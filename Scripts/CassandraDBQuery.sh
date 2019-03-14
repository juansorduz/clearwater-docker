#!/bin/bash
echo [INFO]: Table homestead_provisioning.service_profiles
/usr/bin/cqlsh <<- EOF
    SELECT * FROM homestead_provisioning.service_profiles ;
EOF
echo [INFO]: Table homestead_provisioning.implicit_registration_sets
/usr/bin/cqlsh <<- EOF
    SELECT * FROM homestead_provisioning.implicit_registration_sets ;
EOF
echo [INFO]: Table homestead_provisioning.public
/usr/bin/cqlsh <<- EOF
    SELECT * FROM homestead_provisioning.public ;
EOF
echo [INFO]: Table homestead_provisioning.private
/usr/bin/cqlsh <<- EOF
    SELECT * FROM homestead_provisioning.private ;
EOF
echo [INFO]: Table homestead_cache.impi
/usr/bin/cqlsh <<- EOF
    SELECT * FROM homestead_cache.impi;
EOF
echo [INFO]: Table homestead_cache.impi_mapping
/usr/bin/cqlsh <<- EOF
    SELECT * FROM homestead_cache.impi_mapping ;
EOF
echo [INFO]: Table homestead_cache.impu
/usr/bin/cqlsh <<- EOF
    SELECT * FROM homestead_cache.impu ;
EOF
echo [INFO]: Table homer.simservs
/usr/bin/cqlsh <<- EOF
    SELECT * FROM homer.simservs ;
EOF
