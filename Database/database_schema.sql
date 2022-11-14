google_app_info
-
app_name VARCHAR PK
category VARCHAR
rating FLOAT
rating_count FLOAT
free BOOL
price FLOAT
content_rating VARCHAR
editors_choice BOOL

app_installs
-
app_name VARCHAR  PK FK >- google_app_info.app_name
minimum_installs FLOAT
installs FLOAT
maximum_installs FLOAT
size FLOAT
ad_supported FLOAT
in_app_purchases BOOL