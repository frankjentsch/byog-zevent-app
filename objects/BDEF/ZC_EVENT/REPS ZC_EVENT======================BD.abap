projection implementation in class ZBP_C_EVENT unique;
strict ( 2 );
use draft;
define behavior for ZC_EVENT alias Event
use etag

{
  use create;
  use update;
  use delete;

  use action Edit;
  use action Activate;
  use action Discard;
  use action Resume;
  use action Prepare;
}