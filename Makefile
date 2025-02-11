# NOTE: The variables PATH_INCLUDES & PATH_LIB must match the location of your OpenCV installation  
#
# To set PATH_INCLUDE: 
#	To find the 'include' directory, type in a terminal:
#	$ find / -name opencv.hpp 2>&1 | grep -v "Permission denied"
#	$ /usr/local/include/opencv2/opencv.hpp
#	so your 'include' directory is located in '/usr/local/include/'
#
# To set PATH_LIB: 
#	To find the 'lib' directory, type in a terminal:
#	$ find / -name libopencv* 2>&1 | grep -v "Permission denied"
#	$ ...
#	$ /usr/local/lib/libopencv_videostab.so.3.0
#	$ ...
#	$ /usr/local/lib/libopencv_core.so.3.0.0
#	$ /usr/local/lib/libopencv_core.so.3.0
#	$ /usr/local/lib/libopencv_core.so
#	$ ...
#	so your 'lib' directory is located in '/usr/local/lib/'
#	and your OpenCV version is 3.0.0
#
#   In this sample code, OpenCV is installed in the path '/opt/installation'
#	with the following details:
#		Version: 3.4.4
#		Include Path: /opt/installation/OpenCV-3.4.4/include
#		Library Path: /opt/instllation/OpenCV-3.4.4/lib
#
#	Author: Juan C. SanMiguel (juancarlos.sanmiguel@uam.es)

CPPFLAGS = -g -Wall -DCHECK_OVERFLOW -O2

LIBS = -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_videoio -lopencv_objdetect -lopencv_imgcodecs
PATH_INCLUDES = /opt/installation/OpenCV-3.4.4/include
PATH_LIB = /opt/installation/OpenCV-3.4.4/lib

OBJS_TB = Lab2.0AVSA2020.o blobs.o ShowManyImages.o
BIN_TB = Lab2.0AVSA2020

all: link_all
	rm -f $(OBJS_TB)

link_all: $(OBJS_TB)
	g++ -o $(BIN_TB) $(OBJS_TB) -L$(PATH_LIB) $(LIBS)

Lab2.0AVSA2020.o: Lab2.0AVSA2020.cpp
	g++ $(CPPFLAGS) -I$(PATH_INCLUDES) -c Lab2.0AVSA2020.cpp

blobs.o: blobs.cpp
	g++ $(CPPFLAGS) -I$(PATH_INCLUDES) -c blobs.cpp

ShowManyImages.o: ShowManyImages.cpp
	g++ $(CPPFLAGS) -I$(PATH_INCLUDES) -c ShowManyImages.cpp

clean:
	rm -f $(BIN_TB) $(OBJS_TB)

