all: build archive doc

List: build

build : course.o collegemain.o college.o
	g++ course.o collegemain.o college.o -o list.out

college.o : college.cc college.h node.h	
	g++ -c college.cc

collegemain.o : collegemain.cc course.h college.h node.h
	g++ -c collegemain.cc

course.o : course.cc course.h
	g++ -c course.cc

clean : 
	rm -rf *.o core *.core *.out latex html

doc : 
	doxygen Doxyfile

myexe: course.o collegemain.o college.o
	g++ course.o collegemain.o college.o -o list.out

doczip : html latex
	tar -cvzf doctarball.tgz html latex
