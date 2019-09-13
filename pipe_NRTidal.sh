lalinference_pipe -r ./run config.ini

H1_FRAMENAME=(*H1.gwf)
ln -s \
/home/c1633366/PhenomHM_injection/injection-resources/${H1_FRAMENAME} \
/home/c1633366/PhenomHM_injection/injection-resources/run/${H1_FRAMENAME}

L1_FRAMENAME=(*L1.gwf)
ln -s \
/home/c1633366/PhenomHM_injection/injection-resources/${L1_FRAMENAME} \
/home/c1633366/PhenomHM_injection/injection-resources/run/${L1_FRAMENAME}

V1_FRAMENAME=(*V1.gwf)
ln -s \
/home/c1633366/PhenomHM_injection/injection-resources/${V1_FRAMENAME} \
/home/c1633366/PhenomHM_injection/injection-resources/run/${V1_FRAMENAME}