---Welcome 

This program is a small project in which you can test and visualize data 
and images from and to the format that comes out of an MRI-scanner.


***This software is not under copyright, and can be used and shared freely if obtained***


^^^^HOW TO USE^^^^

    1.  Generate data by using the function "generate_simdata()" and enter the size of the wanted image.
        Optionally, enter a path to where texturefiles 'tex1.png', 'tex2.png' and 'tex3.png' can be
        found.
        If data is loaded, images must be real values, and fourier transformed data works best
        as complex values.
    
    2.  If needed transform the images to fourier-transformed data via "ft2()" (fft2 with size-check).

    3.  When data is complex/fourier transformed, artificial noise can be added, or padding at
        soft transitions can be added to simulate real world conditions via "signal_limited()" and
        "addnoise()".

    4.  Transform data back into images/volumetric data via "ift2()" (ifft2 with size-check).

    5.  Visualizing the results can be done by slicing the model via "CreateGif()" or "disp_slice()"
        whereas a volume of the object can be estimated by "create_vol()".

A lot of functionality is avalible outside of the mentioned, but discoverable in the functions themselves.

^^^^^^^^^^
       



Made by:
    Aleksander Svendstorp
    Christian Mikkelstrup
    Marcus Galea Jacobsen

-Technical University of Denmark

---19'th January 2020