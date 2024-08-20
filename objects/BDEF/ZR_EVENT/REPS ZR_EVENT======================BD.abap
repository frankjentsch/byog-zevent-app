managed implementation in class ZBP_R_EVENT unique;
strict ( 2 );
with draft;
define behavior for ZR_EVENT alias Event
persistent table ZEVENT
draft table ZEVENT_D
etag master LocalLastChangedAt
lock master total etag LastChangedAt
authorization master( global )

{
  field ( readonly )
   EventUuid,
   LocalCreatedBy,
   LocalCreatedAt,
   LocalLastChangedBy,
   LocalLastChangedAt,
   LastChangedAt;

  field ( numbering : managed )
   EventUuid;


  create;
  update;
  delete;

  draft action Activate optimized;
  draft action Discard;
  draft action Edit;
  draft action Resume;
  draft determine action Prepare;

  mapping for ZEVENT
  {
    EventUuid = event_uuid;
    EventId = event_id;
    EventName = event_name;
    Location = location;
    IsOnline = is_online;
    DateFrom = date_from;
    DateTo = date_to;
    LocalCreatedBy = local_created_by;
    LocalCreatedAt = local_created_at;
    LocalLastChangedBy = local_last_changed_by;
    LocalLastChangedAt = local_last_changed_at;
    LastChangedAt = last_changed_at;
  }
}