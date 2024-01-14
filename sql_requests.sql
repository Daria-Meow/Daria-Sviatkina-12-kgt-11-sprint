SELECT
  c.login AS courier_login,
  COUNT(o.id) AS orders_in_delivery_count
FROM
  "Couriers" AS c
  LEFT JOIN "Orders" AS o ON c.id = o."courierId"
  AND o."inDelivery" = 't'
GROUP BY
  c.login;

SELECT
  track,
  CASE WHEN finished = 't' THEN 2 WHEN cancelled = 't' THEN -1 WHEN "inDelivery" = 't' THEN 1 ELSE 0 END AS status
FROM
  "Orders";
