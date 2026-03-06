CLASS zcit_task_6_22bm007 DEFINITION
  PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcit_task_6_22bm007 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " --- 1. CREATE / UPSERT ---
    DATA lt_students TYPE TABLE OF zcit_sta_22bm007.

    lt_students = VALUE #(
      ( id = 1 name = 'Alice'     marks = 30 )
      ( id = 2 name = 'Bob'       marks = 20 )
      ( id = 3 name = 'Dharshini' marks = 95 )
      ( id = 4 name = 'Arjun'     marks = 88 )
    ).

    MODIFY zcit_sta_22bm007 FROM TABLE @lt_students.

    IF sy-subrc = 0.
      out->write( 'Step 1: 4 Student Records Inserted Successfully.' ).
    ENDIF.


    " --- 2. READ ---
    SELECT SINGLE * FROM zcit_sta_22bm007
      WHERE id = 1
      INTO @DATA(ls_student).

    IF sy-subrc = 0.
      out->write( |Step 2: Verification - Name: { ls_student-name } Marks: { ls_student-marks }| ).
    ENDIF.


    " --- 3. UPDATE ---
    UPDATE zcit_sta_22bm007 SET marks = 85 WHERE id = 1.
    IF sy-subrc = 0.
      out->write( 'Step 3: Grade Correction Successful (Alice marks set to 85).' ).
    ENDIF.


    " --- 4. DELETE ---
    DELETE FROM zcit_sta_22bm007 WHERE id = 2.
    IF sy-subrc = 0.
      out->write( 'Step 4: Withdrawal Processed (Bob removed).' ).
    ENDIF.

    " --- 5. FINAL DISPLAY ---
    SELECT * FROM zcit_sta_22bm007 INTO TABLE @DATA(lt_final).
    IF sy-subrc = 0.
      out->write( 'Step 5: Final Database State (Remaining Students):' ).
      out->write( lt_final ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
