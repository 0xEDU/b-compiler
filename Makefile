NAME = B

CC = gcc

PATH_SRC = ./src/
PATH_OBJ = ./obj/

SRCS = test.c
OBJS = $(patsubst %.c, ${PATH_OBJ}%.o, ${SRCS})

LEXER = lexer.l
PARSER = parser.y

CPPFLAGS = -I./inc

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	LDLIBS = -lfl
endif
ifeq ($(UNAME_S),Darwin)
	LDLIBS = -ll
endif

all: ${NAME}

$(NAME): ${OBJS}
	@mkdir -p ${PATH_OBJ}
	@bison -d ${PARSER} -o ${PATH_OBJ}parser.c
	@flex -o ${PATH_OBJ}lexer.c ${LEXER}
	@${CC} ${CPPFLAGS} -o ${NAME} ${PATH_OBJ}parser.c ${PATH_OBJ}lexer.c ${OBJS} ${LDLIBS}
	@echo "\033[1;92m[SUCCESS] B compiler created!\033[0m"

${PATH_OBJ}%.o: ${PATH_SRC}%.c
	@mkdir -p ${PATH_OBJ}
	@${CC} ${CPPFLAGS} -c $< -o $@

clean:
	@rm -rf ${PATH_OBJ}
	@echo "\033[1;93m[SUCCESS] Objects removed!\033[0m"

fclean: clean
	@rm -f ${NAME}
	@echo "\033[1;91m[SUCCESS] B compiler removed!\033[0m"

re: fclean all

.PHONY: all clean fclean re
