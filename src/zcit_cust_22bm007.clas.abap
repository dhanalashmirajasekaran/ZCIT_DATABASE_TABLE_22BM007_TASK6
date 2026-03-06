CLASS zcit_cust_22bm007 DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcit_cust_22bm007 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_insert TYPE TABLE OF zcit_cus_22bm007.

    lt_insert = VALUE #(
      ( cust_id = 1 cust_name = 'ZCIT'    product = 'Milk'     category = 'Dairy'  quantity = 2 price = '3.50'  currency = 'USD' purchase_date = '20260301' )
      ( cust_id = 2 cust_name = 'Arjun'   product = 'Bread'    category = 'Bakery' quantity = 1 price = '2.00'  currency = 'USD' purchase_date = '20260301' )
      ( cust_id = 3 cust_name = 'Priya'   product = 'Apple'    category = 'Fruits' quantity = 5 price = '1.20'  currency = 'USD' purchase_date = '20260302' )
      ( cust_id = 4 cust_name = 'ZCIT'    product = 'Butter'   category = 'Dairy'  quantity = 1 price = '4.00'  currency = 'USD' purchase_date = '20260302' )
      ( cust_id = 5 cust_name = 'Kumar'   product = 'Rice'     category = 'Grains' quantity = 1 price = '20.00' currency = 'USD' purchase_date = '20260303' )
      ( cust_id = 6 cust_name = 'Sita'    product = 'Banana'   category = 'Fruits' quantity = 6 price = '0.50'  currency = 'USD' purchase_date = '20260303' )
      ( cust_id = 7 cust_name = 'ZCIT'    product = 'Cheese'   category = 'Dairy'  quantity = 1 price = '5.00'  currency = 'USD' purchase_date = '20260304' )
      ( cust_id = 8 cust_name = 'Vijay'   product = 'Eggs'     category = 'Dairy'  quantity = 12 price = '0.20' currency = 'USD' purchase_date = '20260304' )
      ( cust_id = 9 cust_name = 'Anu'     product = 'Chocolate' category = 'Snacks' quantity = 2 price = '2.50'  currency = 'USD' purchase_date = '20260305' )
      ( cust_id = 10 cust_name = 'ZCIT'   product = 'Coffee'   category = 'Drinks' quantity = 1 price = '7.00'  currency = 'USD' purchase_date = '20260305' )
    ).

    DELETE FROM zcit_cus_22bm007.
    INSERT zcit_cus_22bm007 FROM TABLE @lt_insert.
    out->write( '1. Database Table Initialized with 10 Records.' ).

    UPDATE zcit_cus_22bm007 SET cust_name = 'Dharshini' WHERE cust_name = 'ZCIT'.

    IF sy-subrc = 0.
      out->write( '2. Update: ZCIT successfully changed to Dharshini.' ).
    ELSE.
      out->write( '2. Update: No records found with name ZCIT.' ).
    ENDIF.

    SELECT * FROM zcit_cus_22bm007 INTO TABLE @DATA(lt_final_data).

 SELECT * FROM zcit_cus_22bm007 WHERE cust_name = 'Dharshini' INTO TABLE @DATA(lt_zcit).
 out->write( lt_zcit ).

    " --- QUERY 3: Sorting (ORDER BY) ---
* SELECT * FROM zcit_cus_22bm007 ORDER BY price DESC INTO TABLE @DATA(lt_sorted).
* out->write( lt_sorted ).

    " --- QUERY 4: Update specific record (UPDATE) ---
* UPDATE zcit_cus_22bm007 SET price = '10.00' WHERE product = 'Coffee'.
* out->write( 'Coffee Price Updated' ).

    " --- QUERY 5: Total Calculation (SUM) ---
* SELECT SUM( price * quantity ) FROM zcit_cus_22bm007 WHERE cust_name = 'ZCIT' INTO @DATA(lv_sum).
* out->write( |ZCIT Total Bill: { lv_sum }| ).

    " --- QUERY 6: Category Summary (GROUP BY) ---
* SELECT category, COUNT( * ) AS total FROM zcit_cus_22bm007 GROUP BY category INTO TABLE @DATA(lt_groups).
* out->write( lt_groups ).

    " --- QUERY 7: Get One Record (SELECT SINGLE) ---
* SELECT SINGLE * FROM zcit_cus_22bm007 WHERE cust_id = 1 INTO @DATA(ls_one).
* out->write( ls_one ).

    " --- QUERY 8: Unique List (DISTINCT) ---
* SELECT DISTINCT category FROM zcit_cus_22bm007 INTO TABLE @DATA(lt_cats).
* out->write( lt_cats ).

    " --- QUERY 9: Remove Data (DELETE) ---
* DELETE FROM zcit_cus_22bm007 WHERE cust_id = 10.
* out->write( 'Customer 10 Deleted' ).

    " --- QUERY 10: Final Table View ---
* SELECT * FROM zcit_cus_22bm007 INTO TABLE @DATA(lt_final).
* out->write( lt_final ).

  ENDMETHOD.

ENDCLASS.
