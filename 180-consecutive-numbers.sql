# Source: https://oj.leetcode.com/problems/consecutive-numbers/
# Author: Destin (destin.im)

/*

Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+

For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

*/

# Write your MySQL query statement below
select distinct Num from (
    select Num, count(ct) as Times from (
        select num, @cur := @cur + if(@prev = Num, 0, 1) as ct, @prev := Num
        from Logs s, (select @cur := 0) c, (SELECT @prev := null) p
        order by Id asc
    ) t
    group by ct having Times >= 3
) n;