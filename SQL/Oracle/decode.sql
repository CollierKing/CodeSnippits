--Misc

--DECODE
SELECT product_id,
       DECODE (warehouse_id, 1, 'Southlake', 
                             2, 'San Francisco', 
                             3, 'New Jersey', 
                             4, 'Seattle',
                                'Non domestic') 
       "Location of inventory" FROM inventories
       WHERE product_id < 1775;
