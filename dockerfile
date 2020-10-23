FROM node:12

RUN npm install -g newman@5

RUN npm install -g newman-reporter-html

RUN mkdir /var/prismapitestdata

RUN chmod 755 /var/prismapitestdata/

COPY Prism_OAS_3.0_Test.postman_collection.json /var/prismapitestdata/

EXPOSE 7002

CMD ["newman","run","/var/prismapitestdata/Prism_OAS_3.0_Test.postman_collection.json","--disable-unicode","--reporters","cli,junit,html","--reporter-junit-export","/var/prismapitestdata/Prism_OAS3_APIMock_report.xml","--reporter-html-export","/var/prismapitestdata/Prism_OAS3_APIMock_report.html","tail -f /dev/null"]





