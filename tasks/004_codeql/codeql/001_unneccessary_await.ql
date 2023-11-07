/**
 * @name find unneccessary awaits
 * @description ...
 * @kind problem
 * @problem.severity recommendation
 * @id js/custom
 */

import javascript

from Function f
where 
    f.isAsync() and
    not exists ...
    // TODO: add the correct predicate here to check if f does not contain
    //       a await call, this should help:
    //       https://codeql.github.com/codeql-standard-libraries/javascript/semmle/javascript/Expr.qll/type.Expr$AwaitExpr.html
select f, "This async function might only perform synchronous operations."

// not exists (AwaitExpr await | await.getEnclosingFunction() = f) and