cd /mm
/usr/local/bin/gunicorn --reload --workers 10 --worker-connections 10 --access-logfile=- --pythonpath . -b :5000 api_logic_server_run:flask_app

