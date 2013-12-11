# To compile the thesis

There is a few operations to do in order to compile this complex LaTeX
architecture thesis!  I'll try to explain all of these operations.

## Compile the Memoir

Go into the \`memoir' directory.  All subdirectories in the following explanation
are considering that \`memoir' is the root directory.

### Install other packages

Clone the mytexlive repository as your ~/texmf directory.
Go into \`~/texmf/tex/latex' and update files with

    $ python update.py

### For images

Install ImageMagick and do the following.

    $ cd images/
    $ for file in `ls \*.png`
    $ do
    $   convert $file `echo $file | sed 's/\.png/\.eps/g'`
    $ done

### For statistics

Install R, TCL and TK.
Launch R and install the 'lawstat' package in it (you can launch it with root privileges to install it on all the system).
To install it

    $ install.packages("lawstat")

Now, you can do the following.

    $ for file in `ls files/\*.r`
    $ do
    $   R --vanilla -f $file
    $ done

### For PDFs

To generate the needed PDF files, you need to install Ghostscript then run the
following command which will split multipage PDF files into one page PDF files.

    $ cd images
    $ for num in `seq 1 5`
    $ do              
    $    gs -dBATCH -sDEVICE=pdfwrite -dSAFER -o "exp1-questionnaire-$num.pdf" -dFirstPage=$num -dLastPage=$num exp1-questionnaire.pdf
    $    gs -dBATCH -sDEVICE=pdfwrite -dSAFER -o "exp4-questionnaire-$num.pdf" -dFirstPage=$num -dLastPage=$num exp4-questionnaire.pdf
    $ done

After, you need to convert these PDF files into EPS files.

    $ cd images
    $ for file in `ls \*-[0-9].pdf`
    $ do
    $   convert $file `echo $file | sed 's/\.pdf/\.eps/g'`
    $ done

