lalinference_pipe -r ./run_HM config_HM.ini

H1_FRAMENAME=(*H1.gwf)
ln -s ${PWD}/${H1_FRAMENAME} ${PWD}/run_HM/lalinferencenest/${H1_FRAMENAME}
ln -s ${PWD}/${H1_FRAMENAME} ${PWD}/run_HM/lalinferencemcmc/${H1_FRAMENAME}

L1_FRAMENAME=(*L1.gwf)
ln -s ${PWD}/${L1_FRAMENAME} ${PWD}/run_HM/lalinferencenest/${L1_FRAMENAME}
ln -s ${PWD}/${L1_FRAMENAME} ${PWD}/run_HM/lalinferencemcmc/${L1_FRAMENAME}

V1_FRAMENAME=(*V1.gwf)
ln -s ${PWD}/${V1_FRAMENAME} ${PWD}/run_HM/lalinferencenest/${V1_FRAMENAME}
ln -s ${PWD}/${V1_FRAMENAME} ${PWD}/run_HM/lalinferencemcmc/${V1_FRAMENAME}
