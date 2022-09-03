-- Dynamic page redirect not user friendly url

case when REQ_DEL_TYPE = 'T' then 
    '<a href="' || apex_util.prepare_url('f?p=&APP_ID.:218:&APP_SESSION.:::218:P218_REQ_DEL_NO:' ||REQ_DEL_NO ) 
                || '"><span class="fa fa-warning" aria-hidden="true" style="color:orange"></span></a>'
 ELSE 
    '<a href="' || apex_util.prepare_url('f?p=&APP_ID.:149:&APP_SESSION.:::149:P149_REQ_DEL_NO:' || REQ_DEL_NO ) 
            || '"><span class="fa fa-warning" aria-hidden="true" style="color:orange"></span></a>'
 END as DDT1

--  2nd way

case when REQ_DEL_TYPE = 'T' then 
'<a href ="' || apex_page.get_url (p_page     => '218',
                    p_items    => 'P218_REQ_DEL_NO',
                    p_values   => REQ_DEL_NO)
|| '"><span aria-hidden="true" class="fa fa-edit"></span></a>'
else 
'<a href ="' || apex_page.get_url (p_page     => '149',
                    p_items    => 'P149_REQ_DEL_NO',
                    p_values   => REQ_DEL_NO)
|| '"><span aria-hidden="true" class="fa fa-edit"></a>'
end as link_checksum,


 -- Dynamic page redirect not user friendly url 


 SELECT empno,
          '<a href ="'
       || APEX_UTIL.prepare_url (
                '/ords/r/web/ontoor-solutions-extras/page-access-unrestricted?session='
             || v ('APP_SESSION')
             || '&p11_empno='
             || empno,
             p_checksum_type   => 'SESSION')
       || '">Friendly URL</a>'
          link
  FROM emp

-- 2nd way

case when REQ_DEL_TYPE = 'T' then 
'<a href ="' || apex_page.get_url (p_page     => '218',
                    p_items    => 'P218_REQ_DEL_NO',
                    p_values   => REQ_DEL_NO)
|| '"><span aria-hidden="true" class="fa fa-edit"></span></a>'
else 
'<a href ="' || apex_page.get_url (p_page     => '149',
                    p_items    => 'P149_REQ_DEL_NO',
                    p_values   => REQ_DEL_NO)
|| '"><span aria-hidden="true" class="fa fa-edit"></a>'
end as link_checksum,