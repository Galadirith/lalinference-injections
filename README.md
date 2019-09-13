# Injections with `lalinference`

## Summary

1.  **Selecting a noise curve**

    If you are not provided with a noise file derived from actual data, then you
    can use the analytically calculated PSDs/ASDs. A useful reference for where
    to find ASCII files containing noise curves is
    [`bilby`s docs](https://git.ligo.org/lscsoft/bilby/blob/0af573933fb93292058f40df61faecdea7feca08/bilby/gw/detector/noise_curves/README.md).
    You can also find many noise curves already installed on clusters, although
    their names can be quite cryptic. A typical ASD noise curve used for
    Livingston, Hanford and Virgo are

    ```
    /cvmfs/ligo-containers.opensciencegrid.org/lscsoft/conda/latest/envs/ligo-py36/share/lalsimulation/LIGO-T0900288-v3-ZERO_DET_high_P.txt
    /cvmfs/ligo-containers.opensciencegrid.org/lscsoft/conda/latest/envs/ligo-py36/share/lalsimulation/LIGO-P1200087-v18-AdV_DESIGN.txt
    ```

    However there are many sources of noise files
    ([LIGO-T1800044-v5](https://dcc.ligo.org/LIGO-T1800044-v5),
    [LIGO-P1200087-v47](https://dcc.ligo.org/LIGO-P1200087-v47)) so if you are
    unsure please ask those currently working with parameter estimation.

    While it is possible to pass a *noise model* (ie specify
    `aLIGOZeroDetHighPower` rather than the path to a PSD file) to some parts of
    the parameter estimation pipeline, models are not consistently names, and it
    is also not always possible. As such the best thing to do is use a noise
    file. Noise files are supported at every stage and you know exactly what you
    are providing the PE pipeline.

2.  **Generate gravitational wave detector responses**

    For each detector that is in your network, we create a `*txt` file for each
    detector. This is done using the program `pycbc_generate_hwinj` and has all
    the options of the normal waveform interface in `lalsimulation`. You also
    specify the PSDs or ASDs for each detector which are used to determine the
    correct distance based on an SNR that you provide. Also optionally to also
    generate noise however it is typical for most injection runs to be performed
    with no noise.

3.  **Prepare responses as frame files for each detector**

    The `*txt` detector responses have to be converted to `*gwf` frame files.
    They are a mostly difficult to understand binary format. The easiest way to
    manipulate them is using
    [`gwpy`](https://gwpy.github.io/docs/stable/timeseries/io.html?highlight=frame#gravitational-wave-frames-gwf).

4.  **Perform parameter estimation on frame files**

    You can now configure your parameter estimation job in mostly the same way
    as you normally would. There are a few modifications that need to be made to
    make it consistent with your frame files. In particular you need to make
    sure that the `data.channels` match your frame files and that you use the
    same PSDs/ASDs that you used to generate your frame detector responses.

## Example steps (`S190814bv`)

The following steps work when running on the LIGO `hawk` head node. These
instructions set up `IMRPhenomHM` injection using the estimated parameters for
`S190814bv`. We then perform parameter estimation using `IMRPhenomHM`.

1.  **Activate compute environment**

    If you are not already in the `(ligo-py36)` environment on the `hawk` head
    node then you can activate it using the quickstart guide on
    [docs.ligo.org](https://docs.ligo.org/lscsoft/conda/#quickstart) which are
    summarised here

    ```bash
    source /cvmfs/ligo-containers.opensciencegrid.org/lscsoft/conda/latest/etc/profile.d/conda.sh
    conda activate ligo-py36
    ```

2.  **Generate gravitational wave detector responses**

    You now need to generate ASCII injection files for each interferometer in
    your network. In this example we will generate injection files for a HLV
    network. The program that does this is `pycbc_generate_hwinj`. The file
    `./generate_hwinj_HM.sh` has already been populated with all the necessary
    arguments.

    ```bash
    ./generate_hwinj_HM.sh
    ```

2.  **Prepare responses as frame files for each detector**

    The ASCII injection files now need to be converted to `*gwf` frame files.
    This uses the program `pycbc_insert_frame_hwinj`. One `*gwf` if generated
    for each interferometer. The file `./insert_frame_hwinj.sh` has been
    populated with all the necessary arguments.

    ```bash
    ./insert_frame_hwinj.sh
    ```

3.  **Perform parameter estimation on frame files**

    Finally we generate the resources for parameter estimation and start the
    parameter estimation run. This uses the program `lalinference_pipe`. In
    order for the parameter estimation programs to find the `*gwf` files that
    were generated in the previous step, they need to be placed in
    `lalinferencemcmc` and `lalinferencenest` subdirectories of the working
    directory for the `lalinference` job. The file `./pipe_HM.sh` has been
    populated with all the necessary features to achieve this. The `*gwf` are
    system linked into the appropriate directories.

    ```bash
    ./pipe_HM.sh
    ```

## License

[`lalinference-injections`][repo] is released under the [MIT license][license].

[license]: LICENSE.md
[repo]: https://github.com/Galadirith/lalinference-injections