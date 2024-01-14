SELECT
  c.login AS courier_login,
  COUNT(o.id) AS orders_in_delivery_count
FROM
  "Couriers" AS c
  LEFT JOIN "Orders" AS o ON c.id = o."courierId"
  AND o."inDelivery" = 't'
GROUP BY
  c.login;