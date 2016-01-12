CXX=g++
EXEC=libRedisClient.so
ROOT_PATH=/$(EXEC)

INCLUDES=-I ./

CXXFLAGS+=$(INCLUDES)

CXXFLAGS+= -Wall -o2  -fPIC -std=c++0x

#当前目录下的头文件
SRCS = $(wildcard ./C*.cpp ./R*.cpp )

#库名
LDFLAGS=-lPocoFoundation -lPocoNet

OBJS=$(SRCS:.cpp=.o)

all:$(OBJS)
		$(CXX) --shared -fPIC $(OBJS) -o $(EXEC) 
		@echo "build ($(EXEC)) Successful......."

install:
		cp ./*.h /usr/local/include
		cp ./*.hpp /usr/local/include
		cp $(EXEC) /usr/local/lib
		cp $(EXEC) /usr/lib64
		ldconfig
		@echo "install Successful......."
clean :
		rm -rf $(EXEC) $(OBJS)