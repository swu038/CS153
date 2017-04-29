
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 45                	jmp    58 <main+0x58>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	3b 45 08             	cmp    0x8(%ebp),%eax
  1d:	7d 07                	jge    26 <main+0x26>
  1f:	b8 23 08 00 00       	mov    $0x823,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 25 08 00 00       	mov    $0x825,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	c1 e2 02             	shl    $0x2,%edx
  32:	03 55 0c             	add    0xc(%ebp),%edx
  35:	8b 12                	mov    (%edx),%edx
  37:	89 44 24 0c          	mov    %eax,0xc(%esp)
  3b:	89 54 24 08          	mov    %edx,0x8(%esp)
  3f:	c7 44 24 04 27 08 00 	movl   $0x827,0x4(%esp)
  46:	00 
  47:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4e:	e8 0a 04 00 00       	call   45d <printf>
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
  53:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  58:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5c:	3b 45 08             	cmp    0x8(%ebp),%eax
  5f:	7c b2                	jl     13 <main+0x13>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
  61:	e8 66 02 00 00       	call   2cc <exit>
  66:	90                   	nop
  67:	90                   	nop

00000068 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  68:	55                   	push   %ebp
  69:	89 e5                	mov    %esp,%ebp
  6b:	57                   	push   %edi
  6c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  70:	8b 55 10             	mov    0x10(%ebp),%edx
  73:	8b 45 0c             	mov    0xc(%ebp),%eax
  76:	89 cb                	mov    %ecx,%ebx
  78:	89 df                	mov    %ebx,%edi
  7a:	89 d1                	mov    %edx,%ecx
  7c:	fc                   	cld    
  7d:	f3 aa                	rep stos %al,%es:(%edi)
  7f:	89 ca                	mov    %ecx,%edx
  81:	89 fb                	mov    %edi,%ebx
  83:	89 5d 08             	mov    %ebx,0x8(%ebp)
  86:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  89:	5b                   	pop    %ebx
  8a:	5f                   	pop    %edi
  8b:	5d                   	pop    %ebp
  8c:	c3                   	ret    

0000008d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  93:	8b 45 08             	mov    0x8(%ebp),%eax
  96:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  99:	8b 45 0c             	mov    0xc(%ebp),%eax
  9c:	0f b6 10             	movzbl (%eax),%edx
  9f:	8b 45 08             	mov    0x8(%ebp),%eax
  a2:	88 10                	mov    %dl,(%eax)
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	0f b6 00             	movzbl (%eax),%eax
  aa:	84 c0                	test   %al,%al
  ac:	0f 95 c0             	setne  %al
  af:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  b3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  b7:	84 c0                	test   %al,%al
  b9:	75 de                	jne    99 <strcpy+0xc>
    ;
  return os;
  bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  be:	c9                   	leave  
  bf:	c3                   	ret    

000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c3:	eb 08                	jmp    cd <strcmp+0xd>
    p++, q++;
  c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  cd:	8b 45 08             	mov    0x8(%ebp),%eax
  d0:	0f b6 00             	movzbl (%eax),%eax
  d3:	84 c0                	test   %al,%al
  d5:	74 10                	je     e7 <strcmp+0x27>
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	0f b6 10             	movzbl (%eax),%edx
  dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  e0:	0f b6 00             	movzbl (%eax),%eax
  e3:	38 c2                	cmp    %al,%dl
  e5:	74 de                	je     c5 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e7:	8b 45 08             	mov    0x8(%ebp),%eax
  ea:	0f b6 00             	movzbl (%eax),%eax
  ed:	0f b6 d0             	movzbl %al,%edx
  f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  f3:	0f b6 00             	movzbl (%eax),%eax
  f6:	0f b6 c0             	movzbl %al,%eax
  f9:	89 d1                	mov    %edx,%ecx
  fb:	29 c1                	sub    %eax,%ecx
  fd:	89 c8                	mov    %ecx,%eax
}
  ff:	5d                   	pop    %ebp
 100:	c3                   	ret    

00000101 <strlen>:

uint
strlen(char *s)
{
 101:	55                   	push   %ebp
 102:	89 e5                	mov    %esp,%ebp
 104:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 107:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 10e:	eb 04                	jmp    114 <strlen+0x13>
 110:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 114:	8b 45 fc             	mov    -0x4(%ebp),%eax
 117:	03 45 08             	add    0x8(%ebp),%eax
 11a:	0f b6 00             	movzbl (%eax),%eax
 11d:	84 c0                	test   %al,%al
 11f:	75 ef                	jne    110 <strlen+0xf>
    ;
  return n;
 121:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 124:	c9                   	leave  
 125:	c3                   	ret    

00000126 <memset>:

void*
memset(void *dst, int c, uint n)
{
 126:	55                   	push   %ebp
 127:	89 e5                	mov    %esp,%ebp
 129:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 12c:	8b 45 10             	mov    0x10(%ebp),%eax
 12f:	89 44 24 08          	mov    %eax,0x8(%esp)
 133:	8b 45 0c             	mov    0xc(%ebp),%eax
 136:	89 44 24 04          	mov    %eax,0x4(%esp)
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	89 04 24             	mov    %eax,(%esp)
 140:	e8 23 ff ff ff       	call   68 <stosb>
  return dst;
 145:	8b 45 08             	mov    0x8(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <strchr>:

char*
strchr(const char *s, char c)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 04             	sub    $0x4,%esp
 150:	8b 45 0c             	mov    0xc(%ebp),%eax
 153:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 156:	eb 14                	jmp    16c <strchr+0x22>
    if(*s == c)
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	0f b6 00             	movzbl (%eax),%eax
 15e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 161:	75 05                	jne    168 <strchr+0x1e>
      return (char*)s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	eb 13                	jmp    17b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 168:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	84 c0                	test   %al,%al
 174:	75 e2                	jne    158 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	c9                   	leave  
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 183:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 18a:	eb 44                	jmp    1d0 <gets+0x53>
    cc = read(0, &c, 1);
 18c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 193:	00 
 194:	8d 45 ef             	lea    -0x11(%ebp),%eax
 197:	89 44 24 04          	mov    %eax,0x4(%esp)
 19b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a2:	e8 4d 01 00 00       	call   2f4 <read>
 1a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 1aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1ae:	7e 2d                	jle    1dd <gets+0x60>
      break;
    buf[i++] = c;
 1b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1b3:	03 45 08             	add    0x8(%ebp),%eax
 1b6:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1ba:	88 10                	mov    %dl,(%eax)
 1bc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 1c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c4:	3c 0a                	cmp    $0xa,%al
 1c6:	74 16                	je     1de <gets+0x61>
 1c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cc:	3c 0d                	cmp    $0xd,%al
 1ce:	74 0e                	je     1de <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1d3:	83 c0 01             	add    $0x1,%eax
 1d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d9:	7c b1                	jl     18c <gets+0xf>
 1db:	eb 01                	jmp    1de <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1dd:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1e1:	03 45 08             	add    0x8(%ebp),%eax
 1e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ea:	c9                   	leave  
 1eb:	c3                   	ret    

000001ec <stat>:

int
stat(char *n, struct stat *st)
{
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1f9:	00 
 1fa:	8b 45 08             	mov    0x8(%ebp),%eax
 1fd:	89 04 24             	mov    %eax,(%esp)
 200:	e8 17 01 00 00       	call   31c <open>
 205:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 208:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 20c:	79 07                	jns    215 <stat+0x29>
    return -1;
 20e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 213:	eb 23                	jmp    238 <stat+0x4c>
  r = fstat(fd, st);
 215:	8b 45 0c             	mov    0xc(%ebp),%eax
 218:	89 44 24 04          	mov    %eax,0x4(%esp)
 21c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 21f:	89 04 24             	mov    %eax,(%esp)
 222:	e8 0d 01 00 00       	call   334 <fstat>
 227:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 22a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 22d:	89 04 24             	mov    %eax,(%esp)
 230:	e8 cf 00 00 00       	call   304 <close>
  return r;
 235:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 238:	c9                   	leave  
 239:	c3                   	ret    

0000023a <atoi>:

int
atoi(const char *s)
{
 23a:	55                   	push   %ebp
 23b:	89 e5                	mov    %esp,%ebp
 23d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 240:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 247:	eb 24                	jmp    26d <atoi+0x33>
    n = n*10 + *s++ - '0';
 249:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24c:	89 d0                	mov    %edx,%eax
 24e:	c1 e0 02             	shl    $0x2,%eax
 251:	01 d0                	add    %edx,%eax
 253:	01 c0                	add    %eax,%eax
 255:	89 c2                	mov    %eax,%edx
 257:	8b 45 08             	mov    0x8(%ebp),%eax
 25a:	0f b6 00             	movzbl (%eax),%eax
 25d:	0f be c0             	movsbl %al,%eax
 260:	8d 04 02             	lea    (%edx,%eax,1),%eax
 263:	83 e8 30             	sub    $0x30,%eax
 266:	89 45 fc             	mov    %eax,-0x4(%ebp)
 269:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
 270:	0f b6 00             	movzbl (%eax),%eax
 273:	3c 2f                	cmp    $0x2f,%al
 275:	7e 0a                	jle    281 <atoi+0x47>
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 00             	movzbl (%eax),%eax
 27d:	3c 39                	cmp    $0x39,%al
 27f:	7e c8                	jle    249 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 281:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 284:	c9                   	leave  
 285:	c3                   	ret    

00000286 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 28c:	8b 45 08             	mov    0x8(%ebp),%eax
 28f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 292:	8b 45 0c             	mov    0xc(%ebp),%eax
 295:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 298:	eb 13                	jmp    2ad <memmove+0x27>
    *dst++ = *src++;
 29a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 29d:	0f b6 10             	movzbl (%eax),%edx
 2a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2a3:	88 10                	mov    %dl,(%eax)
 2a5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 2a9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ad:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2b1:	0f 9f c0             	setg   %al
 2b4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2b8:	84 c0                	test   %al,%al
 2ba:	75 de                	jne    29a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2bc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2bf:	c9                   	leave  
 2c0:	c3                   	ret    
 2c1:	90                   	nop
 2c2:	90                   	nop
 2c3:	90                   	nop

000002c4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c4:	b8 01 00 00 00       	mov    $0x1,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <exit>:
SYSCALL(exit)
 2cc:	b8 02 00 00 00       	mov    $0x2,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <exit1>:
SYSCALL(exit1) 
 2d4:	b8 16 00 00 00       	mov    $0x16,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <wait1>:
SYSCALL(wait1) 
 2dc:	b8 17 00 00 00       	mov    $0x17,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <wait>:
SYSCALL(wait)
 2e4:	b8 03 00 00 00       	mov    $0x3,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <pipe>:
SYSCALL(pipe)
 2ec:	b8 04 00 00 00       	mov    $0x4,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <read>:
SYSCALL(read)
 2f4:	b8 05 00 00 00       	mov    $0x5,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <write>:
SYSCALL(write)
 2fc:	b8 10 00 00 00       	mov    $0x10,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <close>:
SYSCALL(close)
 304:	b8 15 00 00 00       	mov    $0x15,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <kill>:
SYSCALL(kill)
 30c:	b8 06 00 00 00       	mov    $0x6,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <exec>:
SYSCALL(exec)
 314:	b8 07 00 00 00       	mov    $0x7,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <open>:
SYSCALL(open)
 31c:	b8 0f 00 00 00       	mov    $0xf,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <mknod>:
SYSCALL(mknod)
 324:	b8 11 00 00 00       	mov    $0x11,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <unlink>:
SYSCALL(unlink)
 32c:	b8 12 00 00 00       	mov    $0x12,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <fstat>:
SYSCALL(fstat)
 334:	b8 08 00 00 00       	mov    $0x8,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <link>:
SYSCALL(link)
 33c:	b8 13 00 00 00       	mov    $0x13,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <mkdir>:
SYSCALL(mkdir)
 344:	b8 14 00 00 00       	mov    $0x14,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <chdir>:
SYSCALL(chdir)
 34c:	b8 09 00 00 00       	mov    $0x9,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <dup>:
SYSCALL(dup)
 354:	b8 0a 00 00 00       	mov    $0xa,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <getpid>:
SYSCALL(getpid)
 35c:	b8 0b 00 00 00       	mov    $0xb,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <sbrk>:
SYSCALL(sbrk)
 364:	b8 0c 00 00 00       	mov    $0xc,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <sleep>:
SYSCALL(sleep)
 36c:	b8 0d 00 00 00       	mov    $0xd,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <uptime>:
SYSCALL(uptime)
 374:	b8 0e 00 00 00       	mov    $0xe,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <setPriority>:
SYSCALL(setPriority) 
 37c:	b8 18 00 00 00       	mov    $0x18,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	83 ec 28             	sub    $0x28,%esp
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 390:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 397:	00 
 398:	8d 45 f4             	lea    -0xc(%ebp),%eax
 39b:	89 44 24 04          	mov    %eax,0x4(%esp)
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	89 04 24             	mov    %eax,(%esp)
 3a5:	e8 52 ff ff ff       	call   2fc <write>
}
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    

000003ac <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3ac:	55                   	push   %ebp
 3ad:	89 e5                	mov    %esp,%ebp
 3af:	53                   	push   %ebx
 3b0:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3b3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3ba:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3be:	74 17                	je     3d7 <printint+0x2b>
 3c0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3c4:	79 11                	jns    3d7 <printint+0x2b>
    neg = 1;
 3c6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d0:	f7 d8                	neg    %eax
 3d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3d5:	eb 06                	jmp    3dd <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3dd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3e4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3e7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ed:	ba 00 00 00 00       	mov    $0x0,%edx
 3f2:	f7 f3                	div    %ebx
 3f4:	89 d0                	mov    %edx,%eax
 3f6:	0f b6 80 34 08 00 00 	movzbl 0x834(%eax),%eax
 3fd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 401:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 405:	8b 45 10             	mov    0x10(%ebp),%eax
 408:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 40b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 40e:	ba 00 00 00 00       	mov    $0x0,%edx
 413:	f7 75 d4             	divl   -0x2c(%ebp)
 416:	89 45 f4             	mov    %eax,-0xc(%ebp)
 419:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 41d:	75 c5                	jne    3e4 <printint+0x38>
  if(neg)
 41f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 423:	74 28                	je     44d <printint+0xa1>
    buf[i++] = '-';
 425:	8b 45 ec             	mov    -0x14(%ebp),%eax
 428:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 42d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 431:	eb 1a                	jmp    44d <printint+0xa1>
    putc(fd, buf[i]);
 433:	8b 45 ec             	mov    -0x14(%ebp),%eax
 436:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 43b:	0f be c0             	movsbl %al,%eax
 43e:	89 44 24 04          	mov    %eax,0x4(%esp)
 442:	8b 45 08             	mov    0x8(%ebp),%eax
 445:	89 04 24             	mov    %eax,(%esp)
 448:	e8 37 ff ff ff       	call   384 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 44d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 451:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 455:	79 dc                	jns    433 <printint+0x87>
    putc(fd, buf[i]);
}
 457:	83 c4 44             	add    $0x44,%esp
 45a:	5b                   	pop    %ebx
 45b:	5d                   	pop    %ebp
 45c:	c3                   	ret    

0000045d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 45d:	55                   	push   %ebp
 45e:	89 e5                	mov    %esp,%ebp
 460:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 463:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 46a:	8d 45 0c             	lea    0xc(%ebp),%eax
 46d:	83 c0 04             	add    $0x4,%eax
 470:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 473:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 47a:	e9 7e 01 00 00       	jmp    5fd <printf+0x1a0>
    c = fmt[i] & 0xff;
 47f:	8b 55 0c             	mov    0xc(%ebp),%edx
 482:	8b 45 ec             	mov    -0x14(%ebp),%eax
 485:	8d 04 02             	lea    (%edx,%eax,1),%eax
 488:	0f b6 00             	movzbl (%eax),%eax
 48b:	0f be c0             	movsbl %al,%eax
 48e:	25 ff 00 00 00       	and    $0xff,%eax
 493:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 496:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 49a:	75 2c                	jne    4c8 <printf+0x6b>
      if(c == '%'){
 49c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 4a0:	75 0c                	jne    4ae <printf+0x51>
        state = '%';
 4a2:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 4a9:	e9 4b 01 00 00       	jmp    5f9 <printf+0x19c>
      } else {
        putc(fd, c);
 4ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4b1:	0f be c0             	movsbl %al,%eax
 4b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b8:	8b 45 08             	mov    0x8(%ebp),%eax
 4bb:	89 04 24             	mov    %eax,(%esp)
 4be:	e8 c1 fe ff ff       	call   384 <putc>
 4c3:	e9 31 01 00 00       	jmp    5f9 <printf+0x19c>
      }
    } else if(state == '%'){
 4c8:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4cc:	0f 85 27 01 00 00    	jne    5f9 <printf+0x19c>
      if(c == 'd'){
 4d2:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4d6:	75 2d                	jne    505 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4db:	8b 00                	mov    (%eax),%eax
 4dd:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4e4:	00 
 4e5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4ec:	00 
 4ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	89 04 24             	mov    %eax,(%esp)
 4f7:	e8 b0 fe ff ff       	call   3ac <printint>
        ap++;
 4fc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 500:	e9 ed 00 00 00       	jmp    5f2 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 505:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 509:	74 06                	je     511 <printf+0xb4>
 50b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 50f:	75 2d                	jne    53e <printf+0xe1>
        printint(fd, *ap, 16, 0);
 511:	8b 45 f4             	mov    -0xc(%ebp),%eax
 514:	8b 00                	mov    (%eax),%eax
 516:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 51d:	00 
 51e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 525:	00 
 526:	89 44 24 04          	mov    %eax,0x4(%esp)
 52a:	8b 45 08             	mov    0x8(%ebp),%eax
 52d:	89 04 24             	mov    %eax,(%esp)
 530:	e8 77 fe ff ff       	call   3ac <printint>
        ap++;
 535:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 539:	e9 b4 00 00 00       	jmp    5f2 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 53e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 542:	75 46                	jne    58a <printf+0x12d>
        s = (char*)*ap;
 544:	8b 45 f4             	mov    -0xc(%ebp),%eax
 547:	8b 00                	mov    (%eax),%eax
 549:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 54c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 550:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 554:	75 27                	jne    57d <printf+0x120>
          s = "(null)";
 556:	c7 45 e4 2c 08 00 00 	movl   $0x82c,-0x1c(%ebp)
        while(*s != 0){
 55d:	eb 1f                	jmp    57e <printf+0x121>
          putc(fd, *s);
 55f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 562:	0f b6 00             	movzbl (%eax),%eax
 565:	0f be c0             	movsbl %al,%eax
 568:	89 44 24 04          	mov    %eax,0x4(%esp)
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
 56f:	89 04 24             	mov    %eax,(%esp)
 572:	e8 0d fe ff ff       	call   384 <putc>
          s++;
 577:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 57b:	eb 01                	jmp    57e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 57d:	90                   	nop
 57e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 581:	0f b6 00             	movzbl (%eax),%eax
 584:	84 c0                	test   %al,%al
 586:	75 d7                	jne    55f <printf+0x102>
 588:	eb 68                	jmp    5f2 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 58a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 58e:	75 1d                	jne    5ad <printf+0x150>
        putc(fd, *ap);
 590:	8b 45 f4             	mov    -0xc(%ebp),%eax
 593:	8b 00                	mov    (%eax),%eax
 595:	0f be c0             	movsbl %al,%eax
 598:	89 44 24 04          	mov    %eax,0x4(%esp)
 59c:	8b 45 08             	mov    0x8(%ebp),%eax
 59f:	89 04 24             	mov    %eax,(%esp)
 5a2:	e8 dd fd ff ff       	call   384 <putc>
        ap++;
 5a7:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5ab:	eb 45                	jmp    5f2 <printf+0x195>
      } else if(c == '%'){
 5ad:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5b1:	75 17                	jne    5ca <printf+0x16d>
        putc(fd, c);
 5b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b6:	0f be c0             	movsbl %al,%eax
 5b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bd:	8b 45 08             	mov    0x8(%ebp),%eax
 5c0:	89 04 24             	mov    %eax,(%esp)
 5c3:	e8 bc fd ff ff       	call   384 <putc>
 5c8:	eb 28                	jmp    5f2 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5ca:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5d1:	00 
 5d2:	8b 45 08             	mov    0x8(%ebp),%eax
 5d5:	89 04 24             	mov    %eax,(%esp)
 5d8:	e8 a7 fd ff ff       	call   384 <putc>
        putc(fd, c);
 5dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e0:	0f be c0             	movsbl %al,%eax
 5e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ea:	89 04 24             	mov    %eax,(%esp)
 5ed:	e8 92 fd ff ff       	call   384 <putc>
      }
      state = 0;
 5f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5f9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5fd:	8b 55 0c             	mov    0xc(%ebp),%edx
 600:	8b 45 ec             	mov    -0x14(%ebp),%eax
 603:	8d 04 02             	lea    (%edx,%eax,1),%eax
 606:	0f b6 00             	movzbl (%eax),%eax
 609:	84 c0                	test   %al,%al
 60b:	0f 85 6e fe ff ff    	jne    47f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 611:	c9                   	leave  
 612:	c3                   	ret    
 613:	90                   	nop

00000614 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 61a:	8b 45 08             	mov    0x8(%ebp),%eax
 61d:	83 e8 08             	sub    $0x8,%eax
 620:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 623:	a1 50 08 00 00       	mov    0x850,%eax
 628:	89 45 fc             	mov    %eax,-0x4(%ebp)
 62b:	eb 24                	jmp    651 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 630:	8b 00                	mov    (%eax),%eax
 632:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 635:	77 12                	ja     649 <free+0x35>
 637:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 63d:	77 24                	ja     663 <free+0x4f>
 63f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 642:	8b 00                	mov    (%eax),%eax
 644:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 647:	77 1a                	ja     663 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 649:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64c:	8b 00                	mov    (%eax),%eax
 64e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 651:	8b 45 f8             	mov    -0x8(%ebp),%eax
 654:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 657:	76 d4                	jbe    62d <free+0x19>
 659:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65c:	8b 00                	mov    (%eax),%eax
 65e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 661:	76 ca                	jbe    62d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 663:	8b 45 f8             	mov    -0x8(%ebp),%eax
 666:	8b 40 04             	mov    0x4(%eax),%eax
 669:	c1 e0 03             	shl    $0x3,%eax
 66c:	89 c2                	mov    %eax,%edx
 66e:	03 55 f8             	add    -0x8(%ebp),%edx
 671:	8b 45 fc             	mov    -0x4(%ebp),%eax
 674:	8b 00                	mov    (%eax),%eax
 676:	39 c2                	cmp    %eax,%edx
 678:	75 24                	jne    69e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 67a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67d:	8b 50 04             	mov    0x4(%eax),%edx
 680:	8b 45 fc             	mov    -0x4(%ebp),%eax
 683:	8b 00                	mov    (%eax),%eax
 685:	8b 40 04             	mov    0x4(%eax),%eax
 688:	01 c2                	add    %eax,%edx
 68a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 690:	8b 45 fc             	mov    -0x4(%ebp),%eax
 693:	8b 00                	mov    (%eax),%eax
 695:	8b 10                	mov    (%eax),%edx
 697:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69a:	89 10                	mov    %edx,(%eax)
 69c:	eb 0a                	jmp    6a8 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 69e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a1:	8b 10                	mov    (%eax),%edx
 6a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ab:	8b 40 04             	mov    0x4(%eax),%eax
 6ae:	c1 e0 03             	shl    $0x3,%eax
 6b1:	03 45 fc             	add    -0x4(%ebp),%eax
 6b4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6b7:	75 20                	jne    6d9 <free+0xc5>
    p->s.size += bp->s.size;
 6b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bc:	8b 50 04             	mov    0x4(%eax),%edx
 6bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c2:	8b 40 04             	mov    0x4(%eax),%eax
 6c5:	01 c2                	add    %eax,%edx
 6c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ca:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d0:	8b 10                	mov    (%eax),%edx
 6d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d5:	89 10                	mov    %edx,(%eax)
 6d7:	eb 08                	jmp    6e1 <free+0xcd>
  } else
    p->s.ptr = bp;
 6d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6df:	89 10                	mov    %edx,(%eax)
  freep = p;
 6e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e4:	a3 50 08 00 00       	mov    %eax,0x850
}
 6e9:	c9                   	leave  
 6ea:	c3                   	ret    

000006eb <morecore>:

static Header*
morecore(uint nu)
{
 6eb:	55                   	push   %ebp
 6ec:	89 e5                	mov    %esp,%ebp
 6ee:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6f1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6f8:	77 07                	ja     701 <morecore+0x16>
    nu = 4096;
 6fa:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 701:	8b 45 08             	mov    0x8(%ebp),%eax
 704:	c1 e0 03             	shl    $0x3,%eax
 707:	89 04 24             	mov    %eax,(%esp)
 70a:	e8 55 fc ff ff       	call   364 <sbrk>
 70f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 712:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 716:	75 07                	jne    71f <morecore+0x34>
    return 0;
 718:	b8 00 00 00 00       	mov    $0x0,%eax
 71d:	eb 22                	jmp    741 <morecore+0x56>
  hp = (Header*)p;
 71f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 722:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 725:	8b 45 f4             	mov    -0xc(%ebp),%eax
 728:	8b 55 08             	mov    0x8(%ebp),%edx
 72b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 72e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 731:	83 c0 08             	add    $0x8,%eax
 734:	89 04 24             	mov    %eax,(%esp)
 737:	e8 d8 fe ff ff       	call   614 <free>
  return freep;
 73c:	a1 50 08 00 00       	mov    0x850,%eax
}
 741:	c9                   	leave  
 742:	c3                   	ret    

00000743 <malloc>:

void*
malloc(uint nbytes)
{
 743:	55                   	push   %ebp
 744:	89 e5                	mov    %esp,%ebp
 746:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 749:	8b 45 08             	mov    0x8(%ebp),%eax
 74c:	83 c0 07             	add    $0x7,%eax
 74f:	c1 e8 03             	shr    $0x3,%eax
 752:	83 c0 01             	add    $0x1,%eax
 755:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 758:	a1 50 08 00 00       	mov    0x850,%eax
 75d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 760:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 764:	75 23                	jne    789 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 766:	c7 45 f0 48 08 00 00 	movl   $0x848,-0x10(%ebp)
 76d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 770:	a3 50 08 00 00       	mov    %eax,0x850
 775:	a1 50 08 00 00       	mov    0x850,%eax
 77a:	a3 48 08 00 00       	mov    %eax,0x848
    base.s.size = 0;
 77f:	c7 05 4c 08 00 00 00 	movl   $0x0,0x84c
 786:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 789:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78c:	8b 00                	mov    (%eax),%eax
 78e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 791:	8b 45 ec             	mov    -0x14(%ebp),%eax
 794:	8b 40 04             	mov    0x4(%eax),%eax
 797:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 79a:	72 4d                	jb     7e9 <malloc+0xa6>
      if(p->s.size == nunits)
 79c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 79f:	8b 40 04             	mov    0x4(%eax),%eax
 7a2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7a5:	75 0c                	jne    7b3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7aa:	8b 10                	mov    (%eax),%edx
 7ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7af:	89 10                	mov    %edx,(%eax)
 7b1:	eb 26                	jmp    7d9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b6:	8b 40 04             	mov    0x4(%eax),%eax
 7b9:	89 c2                	mov    %eax,%edx
 7bb:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7be:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c7:	8b 40 04             	mov    0x4(%eax),%eax
 7ca:	c1 e0 03             	shl    $0x3,%eax
 7cd:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7d6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7dc:	a3 50 08 00 00       	mov    %eax,0x850
      return (void*)(p + 1);
 7e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7e4:	83 c0 08             	add    $0x8,%eax
 7e7:	eb 38                	jmp    821 <malloc+0xde>
    }
    if(p == freep)
 7e9:	a1 50 08 00 00       	mov    0x850,%eax
 7ee:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7f1:	75 1b                	jne    80e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f6:	89 04 24             	mov    %eax,(%esp)
 7f9:	e8 ed fe ff ff       	call   6eb <morecore>
 7fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
 801:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 805:	75 07                	jne    80e <malloc+0xcb>
        return 0;
 807:	b8 00 00 00 00       	mov    $0x0,%eax
 80c:	eb 13                	jmp    821 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 811:	89 45 f0             	mov    %eax,-0x10(%ebp)
 814:	8b 45 ec             	mov    -0x14(%ebp),%eax
 817:	8b 00                	mov    (%eax),%eax
 819:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 81c:	e9 70 ff ff ff       	jmp    791 <malloc+0x4e>
}
 821:	c9                   	leave  
 822:	c3                   	ret    
