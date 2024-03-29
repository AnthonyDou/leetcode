# Source: https://oj.leetcode.com/problems/duplicate-emails/
# Author: Destin (destin.im)

/*

Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+

For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+

Note: All emails are in lowercase.

*/

# Write your MySQL query statement below
select t.Email from
(
    select Email, count(*) as count from Person group by Email
) as t
where t.count > 1