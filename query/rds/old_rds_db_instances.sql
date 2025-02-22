select
  arn as resource,
  case
    when date_part('day', now()-create_time) > 90 then 'alarm'
    when date_part('day', now()-create_time) > 30 then 'info'
    else 'ok'
  end as status,
  title || ' has been in use for ' || date_part('day', now()-create_time) || ' days.' as reason,
  region,
  account_id
from
  aws_rds_db_instance;