# [명령어가 생략된(내장 규칙 활용) Makefile]

CC = gcc
OBJS = base.o binary.o

# 최종 실행 파일을 만드는 링크 명령어는 직접 적어줍니다.
base: $(OBJS)
	$(CC) -o base $(OBJS)

# 의존성만 적어두면, 아래의 컴파일 명령어(gcc -c)는 make가 알아서 실행합니다!
base.o: base.c binary.h
binary.o: binary.c binary.h

clean:
	rm -f $(OBJS) base
