NAME = B

CC = gcc

PATH_SRCS = ./sources/
PATH_OBJS = ./objects/

SRCS = main.c

OBJS = ${SRCS:%.c=${PATH_OBJS}%.o}

INCLUDES = -I ./includes/
CFLAGS = -Wall -Wextra -Werror

all: ${NAME}

$(NAME): ${OBJS}
	@$(CC) ${CFLAGS} ${INCLUDES} ${OBJS} -o ${NAME}
	@echo "\033[1;92m[SUCCESS] B compiler created!\033[0m"

$(PATH_OBJS)%.o: $(PATH_SRCS)%.c
	@mkdir -p $(PATH_OBJS)
	@$(CC) ${CFLAGS} ${INCLUDES} -c $< -o $@
	@echo "\033[1;96m[SUCCESS] Object $< created\033[0m"

clean:
	@rm -rf ${PATH_OBJS}
	@echo "\033[1;93m[SUCCESS] Objects removed!\033[0m"

fclean: clean
	@rm -f ${NAME}
	@echo "\033[1;91m[SUCCESS] B compiler removed!\033[0m"

re: fclean all

.PHONY: all clean fclean re
