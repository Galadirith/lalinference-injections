lalinference_pipe -r ./run_HM config_HM.ini

H1_FRAMENAME=(*H1.gwf)
ln -s \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/${H1_FRAMENAME} \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/run_HM/lalinferencenest/${H1_FRAMENAME}

ln -s \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/${H1_FRAMENAME} \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/run_HM/lalinferencemcmc/${H1_FRAMENAME}

L1_FRAMENAME=(*L1.gwf)
ln -s \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/${L1_FRAMENAME} \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/run_HM/lalinferencenest/${L1_FRAMENAME}

ln -s \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/${L1_FRAMENAME} \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/run_HM/lalinferencemcmc/${L1_FRAMENAME}

V1_FRAMENAME=(*V1.gwf)
ln -s \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/${V1_FRAMENAME} \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/run_HM/lalinferencenest/${V1_FRAMENAME}

ln -s \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/${V1_FRAMENAME} \
/home/eleanor.hamilton/PhenomHM_injection/injection-resources/run_HM/lalinferencemcmc/${V1_FRAMENAME}
