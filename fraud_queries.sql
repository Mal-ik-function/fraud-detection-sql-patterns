-- 1. High Transaction Velocity Detection
-- Detect users performing more than 5 transactions within 10 minutes

SELECT user_id, COUNT(*) AS transaction_count
FROM transactions
WHERE transaction_time > NOW() - INTERVAL '10 minutes'
GROUP BY user_id
HAVING COUNT(*) > 5;


-- 2. Duplicate Account Detection by Email

SELECT email, COUNT(*) AS account_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;


-- 3. Multiple Failed Login Attempts

SELECT user_id, COUNT(*) AS failed_attempts
FROM login_attempts
WHERE status = 'FAILED'
  AND attempt_time > NOW() - INTERVAL '15 minutes'
GROUP BY user_id
HAVING COUNT(*) >= 3;
