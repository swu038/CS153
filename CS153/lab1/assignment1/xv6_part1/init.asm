
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 d6 08 00 00 	movl   $0x8d6,(%esp)
  18:	e8 a7 03 00 00       	call   3c4 <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 d6 08 00 00 	movl   $0x8d6,(%esp)
  38:	e8 8f 03 00 00       	call   3cc <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 d6 08 00 00 	movl   $0x8d6,(%esp)
  4c:	e8 73 03 00 00       	call   3c4 <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 9f 03 00 00       	call   3fc <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 93 03 00 00       	call   3fc <dup>
  69:	eb 01                	jmp    6c <main+0x6c>
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  }
  6b:	90                   	nop
  }
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
  6c:	c7 44 24 04 de 08 00 	movl   $0x8de,0x4(%esp)
  73:	00 
  74:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7b:	e8 8d 04 00 00       	call   50d <printf>
    pid = fork();
  80:	e8 ef 02 00 00       	call   374 <fork>
  85:	89 44 24 18          	mov    %eax,0x18(%esp)
    if(pid < 0){
  89:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  8e:	79 19                	jns    a9 <main+0xa9>
      printf(1, "init: fork failed\n");
  90:	c7 44 24 04 f1 08 00 	movl   $0x8f1,0x4(%esp)
  97:	00 
  98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9f:	e8 69 04 00 00       	call   50d <printf>
      exit();
  a4:	e8 d3 02 00 00       	call   37c <exit>
    }
    if(pid == 0){
  a9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  ae:	75 43                	jne    f3 <main+0xf3>
      exec("sh", argv);
  b0:	c7 44 24 04 2c 09 00 	movl   $0x92c,0x4(%esp)
  b7:	00 
  b8:	c7 04 24 d3 08 00 00 	movl   $0x8d3,(%esp)
  bf:	e8 f8 02 00 00       	call   3bc <exec>
      printf(1, "init: exec sh failed\n");
  c4:	c7 44 24 04 04 09 00 	movl   $0x904,0x4(%esp)
  cb:	00 
  cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d3:	e8 35 04 00 00       	call   50d <printf>
      exit();
  d8:	e8 9f 02 00 00       	call   37c <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  dd:	c7 44 24 04 1a 09 00 	movl   $0x91a,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ec:	e8 1c 04 00 00       	call   50d <printf>
  f1:	eb 01                	jmp    f4 <main+0xf4>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  f3:	90                   	nop
  f4:	e8 93 02 00 00       	call   38c <wait>
  f9:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  fd:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 102:	0f 88 63 ff ff ff    	js     6b <main+0x6b>
 108:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 10c:	3b 44 24 18          	cmp    0x18(%esp),%eax
 110:	75 cb                	jne    dd <main+0xdd>
      printf(1, "zombie!\n");
  }
 112:	e9 55 ff ff ff       	jmp    6c <main+0x6c>
 117:	90                   	nop

00000118 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 118:	55                   	push   %ebp
 119:	89 e5                	mov    %esp,%ebp
 11b:	57                   	push   %edi
 11c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 11d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 120:	8b 55 10             	mov    0x10(%ebp),%edx
 123:	8b 45 0c             	mov    0xc(%ebp),%eax
 126:	89 cb                	mov    %ecx,%ebx
 128:	89 df                	mov    %ebx,%edi
 12a:	89 d1                	mov    %edx,%ecx
 12c:	fc                   	cld    
 12d:	f3 aa                	rep stos %al,%es:(%edi)
 12f:	89 ca                	mov    %ecx,%edx
 131:	89 fb                	mov    %edi,%ebx
 133:	89 5d 08             	mov    %ebx,0x8(%ebp)
 136:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 139:	5b                   	pop    %ebx
 13a:	5f                   	pop    %edi
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    

0000013d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 13d:	55                   	push   %ebp
 13e:	89 e5                	mov    %esp,%ebp
 140:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 149:	8b 45 0c             	mov    0xc(%ebp),%eax
 14c:	0f b6 10             	movzbl (%eax),%edx
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
 152:	88 10                	mov    %dl,(%eax)
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	0f b6 00             	movzbl (%eax),%eax
 15a:	84 c0                	test   %al,%al
 15c:	0f 95 c0             	setne  %al
 15f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 163:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 167:	84 c0                	test   %al,%al
 169:	75 de                	jne    149 <strcpy+0xc>
    ;
  return os;
 16b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 16e:	c9                   	leave  
 16f:	c3                   	ret    

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 173:	eb 08                	jmp    17d <strcmp+0xd>
    p++, q++;
 175:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 179:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 17d:	8b 45 08             	mov    0x8(%ebp),%eax
 180:	0f b6 00             	movzbl (%eax),%eax
 183:	84 c0                	test   %al,%al
 185:	74 10                	je     197 <strcmp+0x27>
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	0f b6 10             	movzbl (%eax),%edx
 18d:	8b 45 0c             	mov    0xc(%ebp),%eax
 190:	0f b6 00             	movzbl (%eax),%eax
 193:	38 c2                	cmp    %al,%dl
 195:	74 de                	je     175 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 197:	8b 45 08             	mov    0x8(%ebp),%eax
 19a:	0f b6 00             	movzbl (%eax),%eax
 19d:	0f b6 d0             	movzbl %al,%edx
 1a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a3:	0f b6 00             	movzbl (%eax),%eax
 1a6:	0f b6 c0             	movzbl %al,%eax
 1a9:	89 d1                	mov    %edx,%ecx
 1ab:	29 c1                	sub    %eax,%ecx
 1ad:	89 c8                	mov    %ecx,%eax
}
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    

000001b1 <strlen>:

uint
strlen(char *s)
{
 1b1:	55                   	push   %ebp
 1b2:	89 e5                	mov    %esp,%ebp
 1b4:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1be:	eb 04                	jmp    1c4 <strlen+0x13>
 1c0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1c7:	03 45 08             	add    0x8(%ebp),%eax
 1ca:	0f b6 00             	movzbl (%eax),%eax
 1cd:	84 c0                	test   %al,%al
 1cf:	75 ef                	jne    1c0 <strlen+0xf>
    ;
  return n;
 1d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1d4:	c9                   	leave  
 1d5:	c3                   	ret    

000001d6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d6:	55                   	push   %ebp
 1d7:	89 e5                	mov    %esp,%ebp
 1d9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1dc:	8b 45 10             	mov    0x10(%ebp),%eax
 1df:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
 1ed:	89 04 24             	mov    %eax,(%esp)
 1f0:	e8 23 ff ff ff       	call   118 <stosb>
  return dst;
 1f5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f8:	c9                   	leave  
 1f9:	c3                   	ret    

000001fa <strchr>:

char*
strchr(const char *s, char c)
{
 1fa:	55                   	push   %ebp
 1fb:	89 e5                	mov    %esp,%ebp
 1fd:	83 ec 04             	sub    $0x4,%esp
 200:	8b 45 0c             	mov    0xc(%ebp),%eax
 203:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 206:	eb 14                	jmp    21c <strchr+0x22>
    if(*s == c)
 208:	8b 45 08             	mov    0x8(%ebp),%eax
 20b:	0f b6 00             	movzbl (%eax),%eax
 20e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 211:	75 05                	jne    218 <strchr+0x1e>
      return (char*)s;
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	eb 13                	jmp    22b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 218:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21c:	8b 45 08             	mov    0x8(%ebp),%eax
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	84 c0                	test   %al,%al
 224:	75 e2                	jne    208 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 226:	b8 00 00 00 00       	mov    $0x0,%eax
}
 22b:	c9                   	leave  
 22c:	c3                   	ret    

0000022d <gets>:

char*
gets(char *buf, int max)
{
 22d:	55                   	push   %ebp
 22e:	89 e5                	mov    %esp,%ebp
 230:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 233:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 23a:	eb 44                	jmp    280 <gets+0x53>
    cc = read(0, &c, 1);
 23c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 243:	00 
 244:	8d 45 ef             	lea    -0x11(%ebp),%eax
 247:	89 44 24 04          	mov    %eax,0x4(%esp)
 24b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 252:	e8 45 01 00 00       	call   39c <read>
 257:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 25a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 25e:	7e 2d                	jle    28d <gets+0x60>
      break;
    buf[i++] = c;
 260:	8b 45 f0             	mov    -0x10(%ebp),%eax
 263:	03 45 08             	add    0x8(%ebp),%eax
 266:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 26a:	88 10                	mov    %dl,(%eax)
 26c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 270:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 274:	3c 0a                	cmp    $0xa,%al
 276:	74 16                	je     28e <gets+0x61>
 278:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27c:	3c 0d                	cmp    $0xd,%al
 27e:	74 0e                	je     28e <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 280:	8b 45 f0             	mov    -0x10(%ebp),%eax
 283:	83 c0 01             	add    $0x1,%eax
 286:	3b 45 0c             	cmp    0xc(%ebp),%eax
 289:	7c b1                	jl     23c <gets+0xf>
 28b:	eb 01                	jmp    28e <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 28d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 28e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 291:	03 45 08             	add    0x8(%ebp),%eax
 294:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 297:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <stat>:

int
stat(char *n, struct stat *st)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a9:	00 
 2aa:	8b 45 08             	mov    0x8(%ebp),%eax
 2ad:	89 04 24             	mov    %eax,(%esp)
 2b0:	e8 0f 01 00 00       	call   3c4 <open>
 2b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 2b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2bc:	79 07                	jns    2c5 <stat+0x29>
    return -1;
 2be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c3:	eb 23                	jmp    2e8 <stat+0x4c>
  r = fstat(fd, st);
 2c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 2cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2cf:	89 04 24             	mov    %eax,(%esp)
 2d2:	e8 05 01 00 00       	call   3dc <fstat>
 2d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 2da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2dd:	89 04 24             	mov    %eax,(%esp)
 2e0:	e8 c7 00 00 00       	call   3ac <close>
  return r;
 2e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 2e8:	c9                   	leave  
 2e9:	c3                   	ret    

000002ea <atoi>:

int
atoi(const char *s)
{
 2ea:	55                   	push   %ebp
 2eb:	89 e5                	mov    %esp,%ebp
 2ed:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2f0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f7:	eb 24                	jmp    31d <atoi+0x33>
    n = n*10 + *s++ - '0';
 2f9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2fc:	89 d0                	mov    %edx,%eax
 2fe:	c1 e0 02             	shl    $0x2,%eax
 301:	01 d0                	add    %edx,%eax
 303:	01 c0                	add    %eax,%eax
 305:	89 c2                	mov    %eax,%edx
 307:	8b 45 08             	mov    0x8(%ebp),%eax
 30a:	0f b6 00             	movzbl (%eax),%eax
 30d:	0f be c0             	movsbl %al,%eax
 310:	8d 04 02             	lea    (%edx,%eax,1),%eax
 313:	83 e8 30             	sub    $0x30,%eax
 316:	89 45 fc             	mov    %eax,-0x4(%ebp)
 319:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 31d:	8b 45 08             	mov    0x8(%ebp),%eax
 320:	0f b6 00             	movzbl (%eax),%eax
 323:	3c 2f                	cmp    $0x2f,%al
 325:	7e 0a                	jle    331 <atoi+0x47>
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	0f b6 00             	movzbl (%eax),%eax
 32d:	3c 39                	cmp    $0x39,%al
 32f:	7e c8                	jle    2f9 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 331:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 334:	c9                   	leave  
 335:	c3                   	ret    

00000336 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
 33f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 342:	8b 45 0c             	mov    0xc(%ebp),%eax
 345:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 348:	eb 13                	jmp    35d <memmove+0x27>
    *dst++ = *src++;
 34a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 34d:	0f b6 10             	movzbl (%eax),%edx
 350:	8b 45 f8             	mov    -0x8(%ebp),%eax
 353:	88 10                	mov    %dl,(%eax)
 355:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 359:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 361:	0f 9f c0             	setg   %al
 364:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 368:	84 c0                	test   %al,%al
 36a:	75 de                	jne    34a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 36c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36f:	c9                   	leave  
 370:	c3                   	ret    
 371:	90                   	nop
 372:	90                   	nop
 373:	90                   	nop

00000374 <fork>:
 374:	b8 01 00 00 00       	mov    $0x1,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <exit>:
 37c:	b8 02 00 00 00       	mov    $0x2,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <exit1>:
 384:	b8 16 00 00 00       	mov    $0x16,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <wait>:
 38c:	b8 03 00 00 00       	mov    $0x3,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <pipe>:
 394:	b8 04 00 00 00       	mov    $0x4,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <read>:
 39c:	b8 05 00 00 00       	mov    $0x5,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <write>:
 3a4:	b8 10 00 00 00       	mov    $0x10,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <close>:
 3ac:	b8 15 00 00 00       	mov    $0x15,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <kill>:
 3b4:	b8 06 00 00 00       	mov    $0x6,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <exec>:
 3bc:	b8 07 00 00 00       	mov    $0x7,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <open>:
 3c4:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <mknod>:
 3cc:	b8 11 00 00 00       	mov    $0x11,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <unlink>:
 3d4:	b8 12 00 00 00       	mov    $0x12,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <fstat>:
 3dc:	b8 08 00 00 00       	mov    $0x8,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <link>:
 3e4:	b8 13 00 00 00       	mov    $0x13,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <mkdir>:
 3ec:	b8 14 00 00 00       	mov    $0x14,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <chdir>:
 3f4:	b8 09 00 00 00       	mov    $0x9,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <dup>:
 3fc:	b8 0a 00 00 00       	mov    $0xa,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <getpid>:
 404:	b8 0b 00 00 00       	mov    $0xb,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <sbrk>:
 40c:	b8 0c 00 00 00       	mov    $0xc,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <sleep>:
 414:	b8 0d 00 00 00       	mov    $0xd,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <uptime>:
 41c:	b8 0e 00 00 00       	mov    $0xe,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <waitpid>:
 424:	b8 18 00 00 00       	mov    $0x18,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <wait1>:
 42c:	b8 17 00 00 00       	mov    $0x17,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	83 ec 28             	sub    $0x28,%esp
 43a:	8b 45 0c             	mov    0xc(%ebp),%eax
 43d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 440:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 447:	00 
 448:	8d 45 f4             	lea    -0xc(%ebp),%eax
 44b:	89 44 24 04          	mov    %eax,0x4(%esp)
 44f:	8b 45 08             	mov    0x8(%ebp),%eax
 452:	89 04 24             	mov    %eax,(%esp)
 455:	e8 4a ff ff ff       	call   3a4 <write>
}
 45a:	c9                   	leave  
 45b:	c3                   	ret    

0000045c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 45c:	55                   	push   %ebp
 45d:	89 e5                	mov    %esp,%ebp
 45f:	53                   	push   %ebx
 460:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 463:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 46a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 46e:	74 17                	je     487 <printint+0x2b>
 470:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 474:	79 11                	jns    487 <printint+0x2b>
    neg = 1;
 476:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 47d:	8b 45 0c             	mov    0xc(%ebp),%eax
 480:	f7 d8                	neg    %eax
 482:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 485:	eb 06                	jmp    48d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 487:	8b 45 0c             	mov    0xc(%ebp),%eax
 48a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 48d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 494:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 497:	8b 5d 10             	mov    0x10(%ebp),%ebx
 49a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 49d:	ba 00 00 00 00       	mov    $0x0,%edx
 4a2:	f7 f3                	div    %ebx
 4a4:	89 d0                	mov    %edx,%eax
 4a6:	0f b6 80 34 09 00 00 	movzbl 0x934(%eax),%eax
 4ad:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 4b1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 4b5:	8b 45 10             	mov    0x10(%ebp),%eax
 4b8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4be:	ba 00 00 00 00       	mov    $0x0,%edx
 4c3:	f7 75 d4             	divl   -0x2c(%ebp)
 4c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4c9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4cd:	75 c5                	jne    494 <printint+0x38>
  if(neg)
 4cf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4d3:	74 28                	je     4fd <printint+0xa1>
    buf[i++] = '-';
 4d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4dd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 4e1:	eb 1a                	jmp    4fd <printint+0xa1>
    putc(fd, buf[i]);
 4e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4e6:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 4eb:	0f be c0             	movsbl %al,%eax
 4ee:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f2:	8b 45 08             	mov    0x8(%ebp),%eax
 4f5:	89 04 24             	mov    %eax,(%esp)
 4f8:	e8 37 ff ff ff       	call   434 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4fd:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 501:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 505:	79 dc                	jns    4e3 <printint+0x87>
    putc(fd, buf[i]);
}
 507:	83 c4 44             	add    $0x44,%esp
 50a:	5b                   	pop    %ebx
 50b:	5d                   	pop    %ebp
 50c:	c3                   	ret    

0000050d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 50d:	55                   	push   %ebp
 50e:	89 e5                	mov    %esp,%ebp
 510:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 513:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 51a:	8d 45 0c             	lea    0xc(%ebp),%eax
 51d:	83 c0 04             	add    $0x4,%eax
 520:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 523:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 52a:	e9 7e 01 00 00       	jmp    6ad <printf+0x1a0>
    c = fmt[i] & 0xff;
 52f:	8b 55 0c             	mov    0xc(%ebp),%edx
 532:	8b 45 ec             	mov    -0x14(%ebp),%eax
 535:	8d 04 02             	lea    (%edx,%eax,1),%eax
 538:	0f b6 00             	movzbl (%eax),%eax
 53b:	0f be c0             	movsbl %al,%eax
 53e:	25 ff 00 00 00       	and    $0xff,%eax
 543:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 546:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 54a:	75 2c                	jne    578 <printf+0x6b>
      if(c == '%'){
 54c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 550:	75 0c                	jne    55e <printf+0x51>
        state = '%';
 552:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 559:	e9 4b 01 00 00       	jmp    6a9 <printf+0x19c>
      } else {
        putc(fd, c);
 55e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 561:	0f be c0             	movsbl %al,%eax
 564:	89 44 24 04          	mov    %eax,0x4(%esp)
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	89 04 24             	mov    %eax,(%esp)
 56e:	e8 c1 fe ff ff       	call   434 <putc>
 573:	e9 31 01 00 00       	jmp    6a9 <printf+0x19c>
      }
    } else if(state == '%'){
 578:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 57c:	0f 85 27 01 00 00    	jne    6a9 <printf+0x19c>
      if(c == 'd'){
 582:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 586:	75 2d                	jne    5b5 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 588:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58b:	8b 00                	mov    (%eax),%eax
 58d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 594:	00 
 595:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 59c:	00 
 59d:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a1:	8b 45 08             	mov    0x8(%ebp),%eax
 5a4:	89 04 24             	mov    %eax,(%esp)
 5a7:	e8 b0 fe ff ff       	call   45c <printint>
        ap++;
 5ac:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5b0:	e9 ed 00 00 00       	jmp    6a2 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 5b5:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 5b9:	74 06                	je     5c1 <printf+0xb4>
 5bb:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 5bf:	75 2d                	jne    5ee <printf+0xe1>
        printint(fd, *ap, 16, 0);
 5c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c4:	8b 00                	mov    (%eax),%eax
 5c6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5cd:	00 
 5ce:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5d5:	00 
 5d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	89 04 24             	mov    %eax,(%esp)
 5e0:	e8 77 fe ff ff       	call   45c <printint>
        ap++;
 5e5:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5e9:	e9 b4 00 00 00       	jmp    6a2 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5ee:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 5f2:	75 46                	jne    63a <printf+0x12d>
        s = (char*)*ap;
 5f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f7:	8b 00                	mov    (%eax),%eax
 5f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 5fc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 600:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 604:	75 27                	jne    62d <printf+0x120>
          s = "(null)";
 606:	c7 45 e4 23 09 00 00 	movl   $0x923,-0x1c(%ebp)
        while(*s != 0){
 60d:	eb 1f                	jmp    62e <printf+0x121>
          putc(fd, *s);
 60f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 612:	0f b6 00             	movzbl (%eax),%eax
 615:	0f be c0             	movsbl %al,%eax
 618:	89 44 24 04          	mov    %eax,0x4(%esp)
 61c:	8b 45 08             	mov    0x8(%ebp),%eax
 61f:	89 04 24             	mov    %eax,(%esp)
 622:	e8 0d fe ff ff       	call   434 <putc>
          s++;
 627:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 62b:	eb 01                	jmp    62e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 62d:	90                   	nop
 62e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 631:	0f b6 00             	movzbl (%eax),%eax
 634:	84 c0                	test   %al,%al
 636:	75 d7                	jne    60f <printf+0x102>
 638:	eb 68                	jmp    6a2 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 63a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 63e:	75 1d                	jne    65d <printf+0x150>
        putc(fd, *ap);
 640:	8b 45 f4             	mov    -0xc(%ebp),%eax
 643:	8b 00                	mov    (%eax),%eax
 645:	0f be c0             	movsbl %al,%eax
 648:	89 44 24 04          	mov    %eax,0x4(%esp)
 64c:	8b 45 08             	mov    0x8(%ebp),%eax
 64f:	89 04 24             	mov    %eax,(%esp)
 652:	e8 dd fd ff ff       	call   434 <putc>
        ap++;
 657:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 65b:	eb 45                	jmp    6a2 <printf+0x195>
      } else if(c == '%'){
 65d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 661:	75 17                	jne    67a <printf+0x16d>
        putc(fd, c);
 663:	8b 45 e8             	mov    -0x18(%ebp),%eax
 666:	0f be c0             	movsbl %al,%eax
 669:	89 44 24 04          	mov    %eax,0x4(%esp)
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	89 04 24             	mov    %eax,(%esp)
 673:	e8 bc fd ff ff       	call   434 <putc>
 678:	eb 28                	jmp    6a2 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 67a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 681:	00 
 682:	8b 45 08             	mov    0x8(%ebp),%eax
 685:	89 04 24             	mov    %eax,(%esp)
 688:	e8 a7 fd ff ff       	call   434 <putc>
        putc(fd, c);
 68d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 690:	0f be c0             	movsbl %al,%eax
 693:	89 44 24 04          	mov    %eax,0x4(%esp)
 697:	8b 45 08             	mov    0x8(%ebp),%eax
 69a:	89 04 24             	mov    %eax,(%esp)
 69d:	e8 92 fd ff ff       	call   434 <putc>
      }
      state = 0;
 6a2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6a9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 6ad:	8b 55 0c             	mov    0xc(%ebp),%edx
 6b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6b3:	8d 04 02             	lea    (%edx,%eax,1),%eax
 6b6:	0f b6 00             	movzbl (%eax),%eax
 6b9:	84 c0                	test   %al,%al
 6bb:	0f 85 6e fe ff ff    	jne    52f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6c1:	c9                   	leave  
 6c2:	c3                   	ret    
 6c3:	90                   	nop

000006c4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c4:	55                   	push   %ebp
 6c5:	89 e5                	mov    %esp,%ebp
 6c7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ca:	8b 45 08             	mov    0x8(%ebp),%eax
 6cd:	83 e8 08             	sub    $0x8,%eax
 6d0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d3:	a1 50 09 00 00       	mov    0x950,%eax
 6d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6db:	eb 24                	jmp    701 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e0:	8b 00                	mov    (%eax),%eax
 6e2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e5:	77 12                	ja     6f9 <free+0x35>
 6e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ea:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ed:	77 24                	ja     713 <free+0x4f>
 6ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f2:	8b 00                	mov    (%eax),%eax
 6f4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f7:	77 1a                	ja     713 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fc:	8b 00                	mov    (%eax),%eax
 6fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
 701:	8b 45 f8             	mov    -0x8(%ebp),%eax
 704:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 707:	76 d4                	jbe    6dd <free+0x19>
 709:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70c:	8b 00                	mov    (%eax),%eax
 70e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 711:	76 ca                	jbe    6dd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 713:	8b 45 f8             	mov    -0x8(%ebp),%eax
 716:	8b 40 04             	mov    0x4(%eax),%eax
 719:	c1 e0 03             	shl    $0x3,%eax
 71c:	89 c2                	mov    %eax,%edx
 71e:	03 55 f8             	add    -0x8(%ebp),%edx
 721:	8b 45 fc             	mov    -0x4(%ebp),%eax
 724:	8b 00                	mov    (%eax),%eax
 726:	39 c2                	cmp    %eax,%edx
 728:	75 24                	jne    74e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 72a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72d:	8b 50 04             	mov    0x4(%eax),%edx
 730:	8b 45 fc             	mov    -0x4(%ebp),%eax
 733:	8b 00                	mov    (%eax),%eax
 735:	8b 40 04             	mov    0x4(%eax),%eax
 738:	01 c2                	add    %eax,%edx
 73a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 740:	8b 45 fc             	mov    -0x4(%ebp),%eax
 743:	8b 00                	mov    (%eax),%eax
 745:	8b 10                	mov    (%eax),%edx
 747:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74a:	89 10                	mov    %edx,(%eax)
 74c:	eb 0a                	jmp    758 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 74e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 751:	8b 10                	mov    (%eax),%edx
 753:	8b 45 f8             	mov    -0x8(%ebp),%eax
 756:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 758:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75b:	8b 40 04             	mov    0x4(%eax),%eax
 75e:	c1 e0 03             	shl    $0x3,%eax
 761:	03 45 fc             	add    -0x4(%ebp),%eax
 764:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 767:	75 20                	jne    789 <free+0xc5>
    p->s.size += bp->s.size;
 769:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76c:	8b 50 04             	mov    0x4(%eax),%edx
 76f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 772:	8b 40 04             	mov    0x4(%eax),%eax
 775:	01 c2                	add    %eax,%edx
 777:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 77d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 780:	8b 10                	mov    (%eax),%edx
 782:	8b 45 fc             	mov    -0x4(%ebp),%eax
 785:	89 10                	mov    %edx,(%eax)
 787:	eb 08                	jmp    791 <free+0xcd>
  } else
    p->s.ptr = bp;
 789:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 78f:	89 10                	mov    %edx,(%eax)
  freep = p;
 791:	8b 45 fc             	mov    -0x4(%ebp),%eax
 794:	a3 50 09 00 00       	mov    %eax,0x950
}
 799:	c9                   	leave  
 79a:	c3                   	ret    

0000079b <morecore>:

static Header*
morecore(uint nu)
{
 79b:	55                   	push   %ebp
 79c:	89 e5                	mov    %esp,%ebp
 79e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7a1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7a8:	77 07                	ja     7b1 <morecore+0x16>
    nu = 4096;
 7aa:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	c1 e0 03             	shl    $0x3,%eax
 7b7:	89 04 24             	mov    %eax,(%esp)
 7ba:	e8 4d fc ff ff       	call   40c <sbrk>
 7bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 7c2:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 7c6:	75 07                	jne    7cf <morecore+0x34>
    return 0;
 7c8:	b8 00 00 00 00       	mov    $0x0,%eax
 7cd:	eb 22                	jmp    7f1 <morecore+0x56>
  hp = (Header*)p;
 7cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 7d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d8:	8b 55 08             	mov    0x8(%ebp),%edx
 7db:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e1:	83 c0 08             	add    $0x8,%eax
 7e4:	89 04 24             	mov    %eax,(%esp)
 7e7:	e8 d8 fe ff ff       	call   6c4 <free>
  return freep;
 7ec:	a1 50 09 00 00       	mov    0x950,%eax
}
 7f1:	c9                   	leave  
 7f2:	c3                   	ret    

000007f3 <malloc>:

void*
malloc(uint nbytes)
{
 7f3:	55                   	push   %ebp
 7f4:	89 e5                	mov    %esp,%ebp
 7f6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
 7fc:	83 c0 07             	add    $0x7,%eax
 7ff:	c1 e8 03             	shr    $0x3,%eax
 802:	83 c0 01             	add    $0x1,%eax
 805:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 808:	a1 50 09 00 00       	mov    0x950,%eax
 80d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 810:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 814:	75 23                	jne    839 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 816:	c7 45 f0 48 09 00 00 	movl   $0x948,-0x10(%ebp)
 81d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 820:	a3 50 09 00 00       	mov    %eax,0x950
 825:	a1 50 09 00 00       	mov    0x950,%eax
 82a:	a3 48 09 00 00       	mov    %eax,0x948
    base.s.size = 0;
 82f:	c7 05 4c 09 00 00 00 	movl   $0x0,0x94c
 836:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 839:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83c:	8b 00                	mov    (%eax),%eax
 83e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 841:	8b 45 ec             	mov    -0x14(%ebp),%eax
 844:	8b 40 04             	mov    0x4(%eax),%eax
 847:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 84a:	72 4d                	jb     899 <malloc+0xa6>
      if(p->s.size == nunits)
 84c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 84f:	8b 40 04             	mov    0x4(%eax),%eax
 852:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 855:	75 0c                	jne    863 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 857:	8b 45 ec             	mov    -0x14(%ebp),%eax
 85a:	8b 10                	mov    (%eax),%edx
 85c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85f:	89 10                	mov    %edx,(%eax)
 861:	eb 26                	jmp    889 <malloc+0x96>
      else {
        p->s.size -= nunits;
 863:	8b 45 ec             	mov    -0x14(%ebp),%eax
 866:	8b 40 04             	mov    0x4(%eax),%eax
 869:	89 c2                	mov    %eax,%edx
 86b:	2b 55 f4             	sub    -0xc(%ebp),%edx
 86e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 871:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 874:	8b 45 ec             	mov    -0x14(%ebp),%eax
 877:	8b 40 04             	mov    0x4(%eax),%eax
 87a:	c1 e0 03             	shl    $0x3,%eax
 87d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 880:	8b 45 ec             	mov    -0x14(%ebp),%eax
 883:	8b 55 f4             	mov    -0xc(%ebp),%edx
 886:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 889:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88c:	a3 50 09 00 00       	mov    %eax,0x950
      return (void*)(p + 1);
 891:	8b 45 ec             	mov    -0x14(%ebp),%eax
 894:	83 c0 08             	add    $0x8,%eax
 897:	eb 38                	jmp    8d1 <malloc+0xde>
    }
    if(p == freep)
 899:	a1 50 09 00 00       	mov    0x950,%eax
 89e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 8a1:	75 1b                	jne    8be <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a6:	89 04 24             	mov    %eax,(%esp)
 8a9:	e8 ed fe ff ff       	call   79b <morecore>
 8ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8b1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8b5:	75 07                	jne    8be <malloc+0xcb>
        return 0;
 8b7:	b8 00 00 00 00       	mov    $0x0,%eax
 8bc:	eb 13                	jmp    8d1 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8be:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8c7:	8b 00                	mov    (%eax),%eax
 8c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8cc:	e9 70 ff ff ff       	jmp    841 <malloc+0x4e>
}
 8d1:	c9                   	leave  
 8d2:	c3                   	ret    
