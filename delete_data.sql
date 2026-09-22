-- 删除主账户表中除最近5条外的所有记录
DELETE FROM primary_transaction 
WHERE id NOT IN (
  SELECT id FROM (
    SELECT id FROM primary_transaction 
    ORDER BY date DESC 
    LIMIT 5
  ) AS temp
);

-- 删除储蓄账户表中除最近5条外的所有记录
DELETE FROM savings_transaction
WHERE id NOT IN (
  SELECT id FROM (
    SELECT id FROM savings_transaction
    ORDER BY date DESC
    LIMIT 5
  ) AS temp
);


-- 删除主账户所有转账记录
TRUNCATE TABLE primary_transaction;

-- 删除储蓄账户所有转账记录
TRUNCATE TABLE savings_transaction;