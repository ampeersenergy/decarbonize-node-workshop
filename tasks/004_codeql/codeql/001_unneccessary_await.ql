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
    not exists // TODO:
select f, "This async function might only perform synchronous operations."