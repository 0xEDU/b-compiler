NAME = B

CC = gcc

PATH_SRCS = ./sources/
PATH_OBJS = ./objects/

LEXER = lexer.l
PARSER = parser.y

all: ${NAME}

$(NAME): ${OBJS}
	@mkdir -p ${PATH_OBJS}
	@bison -d ${PATH_SRCS}${PARSER} -o ${PATH_OBJS}parser.c
	@flex -o ${PATH_OBJS}lexer.c ${PATH_SRCS}${LEXER}
	@${CC} -o ${NAME} ${PATH_OBJS}parser.c ${PATH_OBJS}lexer.c -lfl
	@echo "\033[1;92m[SUCCESS] B compiler created!\033[0m"

clean:
	@rm -rf ${PATH_OBJS}
	@echo "\033[1;93m[SUCCESS] Objects removed!\033[0m"

fclean: clean
	@rm -f ${NAME}
	@echo "\033[1;91m[SUCCESS] B compiler removed!\033[0m"

re: fclean all

.PHONY: all clean fclean re
