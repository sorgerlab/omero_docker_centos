FROM omero_centos_base
MAINTAINER Douglas Russell <douglas_russell@hms.harvard.edu>

# OMERO.server-5.2.6-ice36-b35
ARG OMERO_VERSION
RUN if [ -z "$OMERO_VERSION" ]; then echo "NOT SET - ERROR"; exit 1; else : ; fi

# OMERO
RUN wget http://downloads.openmicroscopy.org/omero/5.2.6/artifacts/${OMERO_VERSION}.zip -P /tmp/
RUN unzip /tmp/${OMERO_VERSION}.zip -d /opt/
RUN rm /tmp/${OMERO_VERSION}.zip
RUN ln -sf /opt/${OMERO_VERSION} /opt/OMERO


# Postgres
#RUN yum -y install http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-2.noarch.rpm
#RUN yum -y install postgresql94-server postgresql94
#RUN PGSETUP_INITDB_OPTIONS=--encoding=UTF8 /usr/pgsql-9.4/bin/postgresql94-setup initdb
#RUN sed -i.bak -re 's/^(host.*)ident/\1md5/' /var/lib/pgsql/9.4/data/pg_hba.conf
#systemctl start postgresql-9.4.service
#systemctl enable postgresql-9.4.service

# CMD ["/var/omero/OMERO.server-5.2.6-ice36-b35/bin/omero", "admin", "start"]
