FROM odoo:15.0

USER root

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y git \
    nano \
    pgbadger \
    unzip \
    libmagic-dev \
    cups \
    libcups2-dev \
    python3-dev \
    python3-pip
RUN pip install --upgrade pip
RUN pip3 install --upgrade pip

RUN pip3 install odoo_import_export_client mollie-api-python urllib3 docutils gevent greenlet gspread
RUN pip3 install oauth2client xmltodict python-barcode paramiko boto3 xlrd pyquerystring parse-accept-language apispec==4.0.0
RUN pip3 install sentry-sdk oauthlib requests_oauthlib raven cerberus aiohttp webp
RUN pip3 install prometheus_client pysftp
RUN pip install redis openai cssselect click-odoo click-odoo-contrib

COPY config/odoo.config /etc/odoo/
RUN mkdir /etc/odoo/addons && mkdir /etc/odoo/enterprise && chown -R odoo:odoo /etc/odoo

RUN mkdir -p /var/lib/odoo/sessions \
    && chown -R odoo:odoo /var/lib/odoo/sessions

USER odoo
