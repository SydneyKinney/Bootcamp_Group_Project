google_app_info
-
app_name varchar pk
maximum_installs int
category varchar
rating int
price int
rating_count int

app_installs
-
app_name varchar pk
maximum_install int
price int
ad_supported int

categories
-
category varchar fk
category_id varchar pk