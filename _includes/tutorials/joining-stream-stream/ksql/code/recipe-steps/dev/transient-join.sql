SELECT
    O.ORDER_ID AS ORDER_ID, TIMESTAMPTOSTRING(O.ROWTIME,'yyyy-MM-dd HH:mm:ss') AS ORDER_TS,
    O.TOTAL_AMOUNT, O.CUSTOMER_NAME, S.SHIPMENT_ID, TIMESTAMPTOSTRING(S.ROWTIME,'yyyy-MM-dd HH:mm:ss') AS SHIPMENT_TS,
    S.WAREHOUSE, (S.ROWTIME - O.ROWTIME)/1000/60 AS SHIP_TIME
FROM ORDERS O INNER JOIN SHIPMENTS S
WITHIN 7 DAYS
ON O.ORDER_ID = S.ORDER_ID
LIMIT 3;
