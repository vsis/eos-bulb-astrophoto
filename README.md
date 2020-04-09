# eos-bulb-astrophoto

This is a very simple script I wrote to help me with my astrophotography.

This script works with my Canon Rebel T5 / 1200D. It was written with the help I found in [this article written by Khalid](https://baheyeldin.com/astronomy/using-canon-eos-dslr-cameras-bulb-mode-gphoto2.html).

To use this script you need [gphoto](http://gphoto.org/) installed and working.

## How to use it

Execute it this way:

```
$ SHOOT_TIME=<integer number of seconds> SHOOT_NUMBER=<integer number of shoots> SHOOT_NAME=<a prefix for file names> ./shoot.sh
```

For example, if you need 10 photos of 60 seconds each one, you must run:

```
SHOOT_TIME=60 SHOOT_NUMBER=10 SHOOT_NAME=light ./shoot.sh
```

The variable `SHOOT_NAME` is used to give a prefix for filenames. I always use values like `light`, `bias`, `flat`, etc. So I know what is each file for.

## Other cameras

If you want to use this with other cameras, specially with other camera brands, you need to modify `start_shooting()` function. You should modify `gphoto` parameters according to your needs.
