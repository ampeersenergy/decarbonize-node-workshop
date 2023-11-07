/**
 * @name Unused npm dependency
 * @description If unnecessary package dependencies are included in package.json, the
 *              package will become harder to install.
 *              copied from: https://github.com/github/codeql/blob/main/javascript/ql/src/NodeJS/UnusedDependency.ql
 * @kind problem
 * @problem.severity recommendation
 * @id js/node/unused-npm-dependency
 * @tags maintainability
 *       frameworks/node.js
 * @precision low
 */

import javascript

/**
* Holds if the NPM package `pkg` declares a dependency on package `name`,
* and `dep` is the corresponding declaration in the `package.json` file.
*/
predicate declaresDependency(NpmPackage pkg, string name, JsonValue dep) {
  dep = pkg.getPackageJson().getDependencies().getPropValue(name)
}

/**
* Gets a path expression in a module belonging to `pkg`.
*/
PathExpr getAPathExpr(NpmPackage pkg) { result.getEnclosingModule() = pkg.getAModule() }

/**
* Gets a URL-valued attribute in a module or HTML file belonging to `pkg`.
*/
DOM::AttributeDefinition getAUrlAttribute(NpmPackage pkg) {
  result.getFile() = pkg.getAFile() and
  DOM::isUrlValuedAttribute(result)
}

/**
* Gets the name of a script in the 'scripts' object of `pkg`.
* The script makes use of a declared `dependency` of `pkg`.
*/
string getPackageScriptNameWithDependency(NpmPackage pkg, string dependency) {
  exists(JsonObject scriptsObject, string scriptName, string script |
    declaresDependency(pkg, dependency, _) and
    scriptsObject = pkg.getPackageJson().getPropValue("scripts") and
    script = scriptsObject.getPropStringValue(scriptName) and
    script.regexpMatch(".*\\b\\Q" + dependency + "\\E\\b.*") and
    result = scriptName
  )
}

/**
* Holds if the NPM package `pkg` declares a dependency on package `name`,
* and uses it at least once.
*/
predicate usesDependency(NpmPackage pkg, string name) {
  declaresDependency(pkg, name, _) and
  (
    // there is a path expression (e.g., in a `require` or `import`) that
    // references `pkg`
    exists(PathExpr path | path = getAPathExpr(pkg) |
      // check whether the path is `name` or starts with `name/`, ignoring a prefix that ends with '!' (example: "scriptloader!moment")
      path.getValue().regexpMatch("(.*!)?\\Q" + name + "\\E(/.*)?")
    )
    or
    // there is an HTML URL attribute that may reference `pkg`
    exists(DOM::AttributeDefinition attr | attr = getAUrlAttribute(pkg) |
      // check whether the URL contains `node_modules/name`
      attr.getStringValue().regexpMatch(".*\\bnode_modules/\\Q" + name + "\\E(/.*)?")
    )
    or
    // there is a reference in a package.json white-listed script
    exists(string packageScriptName |
      packageScriptName = getPackageScriptNameWithDependency(pkg, name)
    |
      packageScriptName = "preinstall" or
      packageScriptName = "install" or
      packageScriptName = "postinstall"
    )
  )
}

from NpmPackage pkg, string name, JsonValue dep
where
  exists(pkg.getAModule()) and
  // TODO: the pkg, name and dep values have to be filled / set
  //       you can use a existing predicate ;)
  not usesDependency(pkg, name)
select dep, "Unused dependency '" + name + "'."