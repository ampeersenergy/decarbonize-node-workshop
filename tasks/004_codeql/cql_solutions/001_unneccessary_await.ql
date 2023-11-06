/**
 * @name forEach finder
 * @description ...
 * @kind problem
 * @problem.severity recommendation
 * @id js/custom
 * @tags maintainability
 *       frameworks/node.js
 * @precision low
 */

import javascript

from Function f
where 
    f.isAsync() and
    not exists (AwaitExpr await | await.getEnclosingFunction() = f) and
    not exists (CallExpr call | call.getCalleeName() = "setTimeout" and call.getEnclosingFunction() = f) and
    not exists (CallExpr call | call.getCalleeName() = "setInterval" and call.getEnclosingFunction() = f)
select f, "This async function might only perform synchronous operations."