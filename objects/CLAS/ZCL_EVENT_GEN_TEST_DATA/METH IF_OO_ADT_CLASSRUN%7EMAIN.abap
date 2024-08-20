  METHOD if_oo_adt_classrun~main.

    DATA lt_event TYPE STANDARD TABLE OF zevent WITH EMPTY KEY.

    GET TIME STAMP FIELD DATA(lv_timestamp).

    TRY.
        lt_event = VALUE #( ( event_uuid            = cl_system_uuid=>create_uuid_x16_static( )
                              event_id              = 'E001'
                              event_name            = 'Devtoberfest 2023'
                              location              = ''
                              is_online             = abap_true
                              date_from             = '20230918'
                              date_to               = '20231013'
                              local_last_changed_at = lv_timestamp
                              last_changed_at       = lv_timestamp )


                            ( event_uuid            = cl_system_uuid=>create_uuid_x16_static( )
                              event_id              = 'E002'
                              event_name            = 'Steampunk Customer & Partner Roundtable #5'
                              location              = ''
                              is_online             = abap_true
                              date_from             = '20231024'
                              date_to               = '20231024'
                              local_last_changed_at = lv_timestamp
                              last_changed_at       = lv_timestamp )

                            ( event_uuid            = cl_system_uuid=>create_uuid_x16_static( )
                              event_id              = 'E003'
                              event_name            = 'SAP TechEd 2023'
                              location              = 'Bangalore'
                              is_online             = abap_false
                              date_from             = '20231102'
                              date_to               = '20231103'
                              local_last_changed_at = lv_timestamp
                              last_changed_at       = lv_timestamp )

                            ( event_uuid            = cl_system_uuid=>create_uuid_x16_static( )
                              event_id              = 'E004'
                              event_name            = 'SAP TechEd 2023 Virtual'
                              location              = ''
                              is_online             = abap_true
                              date_from             = '20231102'
                              date_to               = '20231103'
                              local_last_changed_at = lv_timestamp
                              last_changed_at       = lv_timestamp )

                            ( event_uuid            = cl_system_uuid=>create_uuid_x16_static( )
                              event_id              = 'E005'
                              event_name            = 'SAPinsider'
                              location              = 'Copenhagen'
                              is_online             = abap_false
                              date_from             = '20231114'
                              date_to               = '20231116'
                              local_last_changed_at = lv_timestamp
                              last_changed_at       = lv_timestamp )

                            ( event_uuid            = cl_system_uuid=>create_uuid_x16_static( )
                              event_id              = 'E006'
                              event_name            = 'Steampunk Customer & Partner Roundtable #6'
                              location              = ''
                              is_online             = abap_true
                              date_from             = '20231123'
                              date_to               = '20231123'
                              local_last_changed_at = lv_timestamp
                              last_changed_at       = lv_timestamp ) ) ##NO_TEXT.
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.

    DELETE FROM zevent.                                 "#EC CI_NOWHERE
    INSERT zevent FROM TABLE @lt_event.
    COMMIT WORK.

    out->write( |{ sy-dbcnt } entries modified| ) ##NO_TEXT.

  ENDMETHOD.