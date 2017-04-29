
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 72 02 00 00       	call   280 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 0a 03 00 00       	call   328 <sleep>
  exit();
  1e:	e8 65 02 00 00       	call   288 <exit>
  23:	90                   	nop

00000024 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	57                   	push   %edi
  28:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  29:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2c:	8b 55 10             	mov    0x10(%ebp),%edx
  2f:	8b 45 0c             	mov    0xc(%ebp),%eax
  32:	89 cb                	mov    %ecx,%ebx
  34:	89 df                	mov    %ebx,%edi
  36:	89 d1                	mov    %edx,%ecx
  38:	fc                   	cld    
  39:	f3 aa                	rep stos %al,%es:(%edi)
  3b:	89 ca                	mov    %ecx,%edx
  3d:	89 fb                	mov    %edi,%ebx
  3f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  42:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  45:	5b                   	pop    %ebx
  46:	5f                   	pop    %edi
  47:	5d                   	pop    %ebp
  48:	c3                   	ret    

00000049 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  49:	55                   	push   %ebp
  4a:	89 e5                	mov    %esp,%ebp
  4c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4f:	8b 45 08             	mov    0x8(%ebp),%eax
  52:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  55:	8b 45 0c             	mov    0xc(%ebp),%eax
  58:	0f b6 10             	movzbl (%eax),%edx
  5b:	8b 45 08             	mov    0x8(%ebp),%eax
  5e:	88 10                	mov    %dl,(%eax)
  60:	8b 45 08             	mov    0x8(%ebp),%eax
  63:	0f b6 00             	movzbl (%eax),%eax
  66:	84 c0                	test   %al,%al
  68:	0f 95 c0             	setne  %al
  6b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  6f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  73:	84 c0                	test   %al,%al
  75:	75 de                	jne    55 <strcpy+0xc>
    ;
  return os;
  77:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  7a:	c9                   	leave  
  7b:	c3                   	ret    

0000007c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7c:	55                   	push   %ebp
  7d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7f:	eb 08                	jmp    89 <strcmp+0xd>
    p++, q++;
  81:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  85:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  89:	8b 45 08             	mov    0x8(%ebp),%eax
  8c:	0f b6 00             	movzbl (%eax),%eax
  8f:	84 c0                	test   %al,%al
  91:	74 10                	je     a3 <strcmp+0x27>
  93:	8b 45 08             	mov    0x8(%ebp),%eax
  96:	0f b6 10             	movzbl (%eax),%edx
  99:	8b 45 0c             	mov    0xc(%ebp),%eax
  9c:	0f b6 00             	movzbl (%eax),%eax
  9f:	38 c2                	cmp    %al,%dl
  a1:	74 de                	je     81 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	0f b6 00             	movzbl (%eax),%eax
  a9:	0f b6 d0             	movzbl %al,%edx
  ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  af:	0f b6 00             	movzbl (%eax),%eax
  b2:	0f b6 c0             	movzbl %al,%eax
  b5:	89 d1                	mov    %edx,%ecx
  b7:	29 c1                	sub    %eax,%ecx
  b9:	89 c8                	mov    %ecx,%eax
}
  bb:	5d                   	pop    %ebp
  bc:	c3                   	ret    

000000bd <strlen>:

uint
strlen(char *s)
{
  bd:	55                   	push   %ebp
  be:	89 e5                	mov    %esp,%ebp
  c0:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  ca:	eb 04                	jmp    d0 <strlen+0x13>
  cc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  d3:	03 45 08             	add    0x8(%ebp),%eax
  d6:	0f b6 00             	movzbl (%eax),%eax
  d9:	84 c0                	test   %al,%al
  db:	75 ef                	jne    cc <strlen+0xf>
    ;
  return n;
  dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e0:	c9                   	leave  
  e1:	c3                   	ret    

000000e2 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e2:	55                   	push   %ebp
  e3:	89 e5                	mov    %esp,%ebp
  e5:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e8:	8b 45 10             	mov    0x10(%ebp),%eax
  eb:	89 44 24 08          	mov    %eax,0x8(%esp)
  ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  f2:	89 44 24 04          	mov    %eax,0x4(%esp)
  f6:	8b 45 08             	mov    0x8(%ebp),%eax
  f9:	89 04 24             	mov    %eax,(%esp)
  fc:	e8 23 ff ff ff       	call   24 <stosb>
  return dst;
 101:	8b 45 08             	mov    0x8(%ebp),%eax
}
 104:	c9                   	leave  
 105:	c3                   	ret    

00000106 <strchr>:

char*
strchr(const char *s, char c)
{
 106:	55                   	push   %ebp
 107:	89 e5                	mov    %esp,%ebp
 109:	83 ec 04             	sub    $0x4,%esp
 10c:	8b 45 0c             	mov    0xc(%ebp),%eax
 10f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 112:	eb 14                	jmp    128 <strchr+0x22>
    if(*s == c)
 114:	8b 45 08             	mov    0x8(%ebp),%eax
 117:	0f b6 00             	movzbl (%eax),%eax
 11a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 11d:	75 05                	jne    124 <strchr+0x1e>
      return (char*)s;
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	eb 13                	jmp    137 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 124:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 128:	8b 45 08             	mov    0x8(%ebp),%eax
 12b:	0f b6 00             	movzbl (%eax),%eax
 12e:	84 c0                	test   %al,%al
 130:	75 e2                	jne    114 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 132:	b8 00 00 00 00       	mov    $0x0,%eax
}
 137:	c9                   	leave  
 138:	c3                   	ret    

00000139 <gets>:

char*
gets(char *buf, int max)
{
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 146:	eb 44                	jmp    18c <gets+0x53>
    cc = read(0, &c, 1);
 148:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 14f:	00 
 150:	8d 45 ef             	lea    -0x11(%ebp),%eax
 153:	89 44 24 04          	mov    %eax,0x4(%esp)
 157:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15e:	e8 4d 01 00 00       	call   2b0 <read>
 163:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 166:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 16a:	7e 2d                	jle    199 <gets+0x60>
      break;
    buf[i++] = c;
 16c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 16f:	03 45 08             	add    0x8(%ebp),%eax
 172:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 176:	88 10                	mov    %dl,(%eax)
 178:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 17c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 180:	3c 0a                	cmp    $0xa,%al
 182:	74 16                	je     19a <gets+0x61>
 184:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 188:	3c 0d                	cmp    $0xd,%al
 18a:	74 0e                	je     19a <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 18f:	83 c0 01             	add    $0x1,%eax
 192:	3b 45 0c             	cmp    0xc(%ebp),%eax
 195:	7c b1                	jl     148 <gets+0xf>
 197:	eb 01                	jmp    19a <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 199:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 19a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 19d:	03 45 08             	add    0x8(%ebp),%eax
 1a0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a6:	c9                   	leave  
 1a7:	c3                   	ret    

000001a8 <stat>:

int
stat(char *n, struct stat *st)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
 1ab:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b5:	00 
 1b6:	8b 45 08             	mov    0x8(%ebp),%eax
 1b9:	89 04 24             	mov    %eax,(%esp)
 1bc:	e8 17 01 00 00       	call   2d8 <open>
 1c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 1c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1c8:	79 07                	jns    1d1 <stat+0x29>
    return -1;
 1ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1cf:	eb 23                	jmp    1f4 <stat+0x4c>
  r = fstat(fd, st);
 1d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1db:	89 04 24             	mov    %eax,(%esp)
 1de:	e8 0d 01 00 00       	call   2f0 <fstat>
 1e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 1e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1e9:	89 04 24             	mov    %eax,(%esp)
 1ec:	e8 cf 00 00 00       	call   2c0 <close>
  return r;
 1f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <atoi>:

int
atoi(const char *s)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1fc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 203:	eb 24                	jmp    229 <atoi+0x33>
    n = n*10 + *s++ - '0';
 205:	8b 55 fc             	mov    -0x4(%ebp),%edx
 208:	89 d0                	mov    %edx,%eax
 20a:	c1 e0 02             	shl    $0x2,%eax
 20d:	01 d0                	add    %edx,%eax
 20f:	01 c0                	add    %eax,%eax
 211:	89 c2                	mov    %eax,%edx
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	0f b6 00             	movzbl (%eax),%eax
 219:	0f be c0             	movsbl %al,%eax
 21c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 21f:	83 e8 30             	sub    $0x30,%eax
 222:	89 45 fc             	mov    %eax,-0x4(%ebp)
 225:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 229:	8b 45 08             	mov    0x8(%ebp),%eax
 22c:	0f b6 00             	movzbl (%eax),%eax
 22f:	3c 2f                	cmp    $0x2f,%al
 231:	7e 0a                	jle    23d <atoi+0x47>
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	0f b6 00             	movzbl (%eax),%eax
 239:	3c 39                	cmp    $0x39,%al
 23b:	7e c8                	jle    205 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 23d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 240:	c9                   	leave  
 241:	c3                   	ret    

00000242 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 24e:	8b 45 0c             	mov    0xc(%ebp),%eax
 251:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 254:	eb 13                	jmp    269 <memmove+0x27>
    *dst++ = *src++;
 256:	8b 45 fc             	mov    -0x4(%ebp),%eax
 259:	0f b6 10             	movzbl (%eax),%edx
 25c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 25f:	88 10                	mov    %dl,(%eax)
 261:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 265:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 269:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 26d:	0f 9f c0             	setg   %al
 270:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 274:	84 c0                	test   %al,%al
 276:	75 de                	jne    256 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 278:	8b 45 08             	mov    0x8(%ebp),%eax
}
 27b:	c9                   	leave  
 27c:	c3                   	ret    
 27d:	90                   	nop
 27e:	90                   	nop
 27f:	90                   	nop

00000280 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 280:	b8 01 00 00 00       	mov    $0x1,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <exit>:
SYSCALL(exit)
 288:	b8 02 00 00 00       	mov    $0x2,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <exit1>:
SYSCALL(exit1) 
 290:	b8 16 00 00 00       	mov    $0x16,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <wait1>:
SYSCALL(wait1) 
 298:	b8 17 00 00 00       	mov    $0x17,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <wait>:
SYSCALL(wait)
 2a0:	b8 03 00 00 00       	mov    $0x3,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <pipe>:
SYSCALL(pipe)
 2a8:	b8 04 00 00 00       	mov    $0x4,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <read>:
SYSCALL(read)
 2b0:	b8 05 00 00 00       	mov    $0x5,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <write>:
SYSCALL(write)
 2b8:	b8 10 00 00 00       	mov    $0x10,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <close>:
SYSCALL(close)
 2c0:	b8 15 00 00 00       	mov    $0x15,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <kill>:
SYSCALL(kill)
 2c8:	b8 06 00 00 00       	mov    $0x6,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <exec>:
SYSCALL(exec)
 2d0:	b8 07 00 00 00       	mov    $0x7,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <open>:
SYSCALL(open)
 2d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <mknod>:
SYSCALL(mknod)
 2e0:	b8 11 00 00 00       	mov    $0x11,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <unlink>:
SYSCALL(unlink)
 2e8:	b8 12 00 00 00       	mov    $0x12,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <fstat>:
SYSCALL(fstat)
 2f0:	b8 08 00 00 00       	mov    $0x8,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <link>:
SYSCALL(link)
 2f8:	b8 13 00 00 00       	mov    $0x13,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <mkdir>:
SYSCALL(mkdir)
 300:	b8 14 00 00 00       	mov    $0x14,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <chdir>:
SYSCALL(chdir)
 308:	b8 09 00 00 00       	mov    $0x9,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <dup>:
SYSCALL(dup)
 310:	b8 0a 00 00 00       	mov    $0xa,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <getpid>:
SYSCALL(getpid)
 318:	b8 0b 00 00 00       	mov    $0xb,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <sbrk>:
SYSCALL(sbrk)
 320:	b8 0c 00 00 00       	mov    $0xc,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <sleep>:
SYSCALL(sleep)
 328:	b8 0d 00 00 00       	mov    $0xd,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <uptime>:
SYSCALL(uptime)
 330:	b8 0e 00 00 00       	mov    $0xe,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <setPriority>:
SYSCALL(setPriority) 
 338:	b8 18 00 00 00       	mov    $0x18,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	83 ec 28             	sub    $0x28,%esp
 346:	8b 45 0c             	mov    0xc(%ebp),%eax
 349:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 34c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 353:	00 
 354:	8d 45 f4             	lea    -0xc(%ebp),%eax
 357:	89 44 24 04          	mov    %eax,0x4(%esp)
 35b:	8b 45 08             	mov    0x8(%ebp),%eax
 35e:	89 04 24             	mov    %eax,(%esp)
 361:	e8 52 ff ff ff       	call   2b8 <write>
}
 366:	c9                   	leave  
 367:	c3                   	ret    

00000368 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 368:	55                   	push   %ebp
 369:	89 e5                	mov    %esp,%ebp
 36b:	53                   	push   %ebx
 36c:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 36f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 376:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 37a:	74 17                	je     393 <printint+0x2b>
 37c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 380:	79 11                	jns    393 <printint+0x2b>
    neg = 1;
 382:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 389:	8b 45 0c             	mov    0xc(%ebp),%eax
 38c:	f7 d8                	neg    %eax
 38e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 391:	eb 06                	jmp    399 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 393:	8b 45 0c             	mov    0xc(%ebp),%eax
 396:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 399:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3a0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3a3:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a9:	ba 00 00 00 00       	mov    $0x0,%edx
 3ae:	f7 f3                	div    %ebx
 3b0:	89 d0                	mov    %edx,%eax
 3b2:	0f b6 80 e8 07 00 00 	movzbl 0x7e8(%eax),%eax
 3b9:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 3bd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 3c1:	8b 45 10             	mov    0x10(%ebp),%eax
 3c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ca:	ba 00 00 00 00       	mov    $0x0,%edx
 3cf:	f7 75 d4             	divl   -0x2c(%ebp)
 3d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3d9:	75 c5                	jne    3a0 <printint+0x38>
  if(neg)
 3db:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3df:	74 28                	je     409 <printint+0xa1>
    buf[i++] = '-';
 3e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3e4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 3e9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 3ed:	eb 1a                	jmp    409 <printint+0xa1>
    putc(fd, buf[i]);
 3ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3f2:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 3f7:	0f be c0             	movsbl %al,%eax
 3fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 3fe:	8b 45 08             	mov    0x8(%ebp),%eax
 401:	89 04 24             	mov    %eax,(%esp)
 404:	e8 37 ff ff ff       	call   340 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 409:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 40d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 411:	79 dc                	jns    3ef <printint+0x87>
    putc(fd, buf[i]);
}
 413:	83 c4 44             	add    $0x44,%esp
 416:	5b                   	pop    %ebx
 417:	5d                   	pop    %ebp
 418:	c3                   	ret    

00000419 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 419:	55                   	push   %ebp
 41a:	89 e5                	mov    %esp,%ebp
 41c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 41f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 426:	8d 45 0c             	lea    0xc(%ebp),%eax
 429:	83 c0 04             	add    $0x4,%eax
 42c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 42f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 436:	e9 7e 01 00 00       	jmp    5b9 <printf+0x1a0>
    c = fmt[i] & 0xff;
 43b:	8b 55 0c             	mov    0xc(%ebp),%edx
 43e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 441:	8d 04 02             	lea    (%edx,%eax,1),%eax
 444:	0f b6 00             	movzbl (%eax),%eax
 447:	0f be c0             	movsbl %al,%eax
 44a:	25 ff 00 00 00       	and    $0xff,%eax
 44f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 452:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 456:	75 2c                	jne    484 <printf+0x6b>
      if(c == '%'){
 458:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 45c:	75 0c                	jne    46a <printf+0x51>
        state = '%';
 45e:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 465:	e9 4b 01 00 00       	jmp    5b5 <printf+0x19c>
      } else {
        putc(fd, c);
 46a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 46d:	0f be c0             	movsbl %al,%eax
 470:	89 44 24 04          	mov    %eax,0x4(%esp)
 474:	8b 45 08             	mov    0x8(%ebp),%eax
 477:	89 04 24             	mov    %eax,(%esp)
 47a:	e8 c1 fe ff ff       	call   340 <putc>
 47f:	e9 31 01 00 00       	jmp    5b5 <printf+0x19c>
      }
    } else if(state == '%'){
 484:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 488:	0f 85 27 01 00 00    	jne    5b5 <printf+0x19c>
      if(c == 'd'){
 48e:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 492:	75 2d                	jne    4c1 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 494:	8b 45 f4             	mov    -0xc(%ebp),%eax
 497:	8b 00                	mov    (%eax),%eax
 499:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4a0:	00 
 4a1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4a8:	00 
 4a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
 4b0:	89 04 24             	mov    %eax,(%esp)
 4b3:	e8 b0 fe ff ff       	call   368 <printint>
        ap++;
 4b8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 4bc:	e9 ed 00 00 00       	jmp    5ae <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 4c1:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 4c5:	74 06                	je     4cd <printf+0xb4>
 4c7:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 4cb:	75 2d                	jne    4fa <printf+0xe1>
        printint(fd, *ap, 16, 0);
 4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d0:	8b 00                	mov    (%eax),%eax
 4d2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4d9:	00 
 4da:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4e1:	00 
 4e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e6:	8b 45 08             	mov    0x8(%ebp),%eax
 4e9:	89 04 24             	mov    %eax,(%esp)
 4ec:	e8 77 fe ff ff       	call   368 <printint>
        ap++;
 4f1:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4f5:	e9 b4 00 00 00       	jmp    5ae <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4fa:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 4fe:	75 46                	jne    546 <printf+0x12d>
        s = (char*)*ap;
 500:	8b 45 f4             	mov    -0xc(%ebp),%eax
 503:	8b 00                	mov    (%eax),%eax
 505:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 508:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 50c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 510:	75 27                	jne    539 <printf+0x120>
          s = "(null)";
 512:	c7 45 e4 df 07 00 00 	movl   $0x7df,-0x1c(%ebp)
        while(*s != 0){
 519:	eb 1f                	jmp    53a <printf+0x121>
          putc(fd, *s);
 51b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 51e:	0f b6 00             	movzbl (%eax),%eax
 521:	0f be c0             	movsbl %al,%eax
 524:	89 44 24 04          	mov    %eax,0x4(%esp)
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	89 04 24             	mov    %eax,(%esp)
 52e:	e8 0d fe ff ff       	call   340 <putc>
          s++;
 533:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 537:	eb 01                	jmp    53a <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 539:	90                   	nop
 53a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 53d:	0f b6 00             	movzbl (%eax),%eax
 540:	84 c0                	test   %al,%al
 542:	75 d7                	jne    51b <printf+0x102>
 544:	eb 68                	jmp    5ae <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 546:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 54a:	75 1d                	jne    569 <printf+0x150>
        putc(fd, *ap);
 54c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54f:	8b 00                	mov    (%eax),%eax
 551:	0f be c0             	movsbl %al,%eax
 554:	89 44 24 04          	mov    %eax,0x4(%esp)
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	89 04 24             	mov    %eax,(%esp)
 55e:	e8 dd fd ff ff       	call   340 <putc>
        ap++;
 563:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 567:	eb 45                	jmp    5ae <printf+0x195>
      } else if(c == '%'){
 569:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 56d:	75 17                	jne    586 <printf+0x16d>
        putc(fd, c);
 56f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 572:	0f be c0             	movsbl %al,%eax
 575:	89 44 24 04          	mov    %eax,0x4(%esp)
 579:	8b 45 08             	mov    0x8(%ebp),%eax
 57c:	89 04 24             	mov    %eax,(%esp)
 57f:	e8 bc fd ff ff       	call   340 <putc>
 584:	eb 28                	jmp    5ae <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 586:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 58d:	00 
 58e:	8b 45 08             	mov    0x8(%ebp),%eax
 591:	89 04 24             	mov    %eax,(%esp)
 594:	e8 a7 fd ff ff       	call   340 <putc>
        putc(fd, c);
 599:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59c:	0f be c0             	movsbl %al,%eax
 59f:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a3:	8b 45 08             	mov    0x8(%ebp),%eax
 5a6:	89 04 24             	mov    %eax,(%esp)
 5a9:	e8 92 fd ff ff       	call   340 <putc>
      }
      state = 0;
 5ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5b9:	8b 55 0c             	mov    0xc(%ebp),%edx
 5bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5bf:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5c2:	0f b6 00             	movzbl (%eax),%eax
 5c5:	84 c0                	test   %al,%al
 5c7:	0f 85 6e fe ff ff    	jne    43b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5cd:	c9                   	leave  
 5ce:	c3                   	ret    
 5cf:	90                   	nop

000005d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d0:	55                   	push   %ebp
 5d1:	89 e5                	mov    %esp,%ebp
 5d3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5d6:	8b 45 08             	mov    0x8(%ebp),%eax
 5d9:	83 e8 08             	sub    $0x8,%eax
 5dc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5df:	a1 04 08 00 00       	mov    0x804,%eax
 5e4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5e7:	eb 24                	jmp    60d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ec:	8b 00                	mov    (%eax),%eax
 5ee:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f1:	77 12                	ja     605 <free+0x35>
 5f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f9:	77 24                	ja     61f <free+0x4f>
 5fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5fe:	8b 00                	mov    (%eax),%eax
 600:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 603:	77 1a                	ja     61f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 605:	8b 45 fc             	mov    -0x4(%ebp),%eax
 608:	8b 00                	mov    (%eax),%eax
 60a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 60d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 610:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 613:	76 d4                	jbe    5e9 <free+0x19>
 615:	8b 45 fc             	mov    -0x4(%ebp),%eax
 618:	8b 00                	mov    (%eax),%eax
 61a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 61d:	76 ca                	jbe    5e9 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 61f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 622:	8b 40 04             	mov    0x4(%eax),%eax
 625:	c1 e0 03             	shl    $0x3,%eax
 628:	89 c2                	mov    %eax,%edx
 62a:	03 55 f8             	add    -0x8(%ebp),%edx
 62d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 630:	8b 00                	mov    (%eax),%eax
 632:	39 c2                	cmp    %eax,%edx
 634:	75 24                	jne    65a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 636:	8b 45 f8             	mov    -0x8(%ebp),%eax
 639:	8b 50 04             	mov    0x4(%eax),%edx
 63c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63f:	8b 00                	mov    (%eax),%eax
 641:	8b 40 04             	mov    0x4(%eax),%eax
 644:	01 c2                	add    %eax,%edx
 646:	8b 45 f8             	mov    -0x8(%ebp),%eax
 649:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 64c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64f:	8b 00                	mov    (%eax),%eax
 651:	8b 10                	mov    (%eax),%edx
 653:	8b 45 f8             	mov    -0x8(%ebp),%eax
 656:	89 10                	mov    %edx,(%eax)
 658:	eb 0a                	jmp    664 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 65a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65d:	8b 10                	mov    (%eax),%edx
 65f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 662:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 664:	8b 45 fc             	mov    -0x4(%ebp),%eax
 667:	8b 40 04             	mov    0x4(%eax),%eax
 66a:	c1 e0 03             	shl    $0x3,%eax
 66d:	03 45 fc             	add    -0x4(%ebp),%eax
 670:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 673:	75 20                	jne    695 <free+0xc5>
    p->s.size += bp->s.size;
 675:	8b 45 fc             	mov    -0x4(%ebp),%eax
 678:	8b 50 04             	mov    0x4(%eax),%edx
 67b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67e:	8b 40 04             	mov    0x4(%eax),%eax
 681:	01 c2                	add    %eax,%edx
 683:	8b 45 fc             	mov    -0x4(%ebp),%eax
 686:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 689:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68c:	8b 10                	mov    (%eax),%edx
 68e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 691:	89 10                	mov    %edx,(%eax)
 693:	eb 08                	jmp    69d <free+0xcd>
  } else
    p->s.ptr = bp;
 695:	8b 45 fc             	mov    -0x4(%ebp),%eax
 698:	8b 55 f8             	mov    -0x8(%ebp),%edx
 69b:	89 10                	mov    %edx,(%eax)
  freep = p;
 69d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a0:	a3 04 08 00 00       	mov    %eax,0x804
}
 6a5:	c9                   	leave  
 6a6:	c3                   	ret    

000006a7 <morecore>:

static Header*
morecore(uint nu)
{
 6a7:	55                   	push   %ebp
 6a8:	89 e5                	mov    %esp,%ebp
 6aa:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6ad:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6b4:	77 07                	ja     6bd <morecore+0x16>
    nu = 4096;
 6b6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6bd:	8b 45 08             	mov    0x8(%ebp),%eax
 6c0:	c1 e0 03             	shl    $0x3,%eax
 6c3:	89 04 24             	mov    %eax,(%esp)
 6c6:	e8 55 fc ff ff       	call   320 <sbrk>
 6cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 6ce:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 6d2:	75 07                	jne    6db <morecore+0x34>
    return 0;
 6d4:	b8 00 00 00 00       	mov    $0x0,%eax
 6d9:	eb 22                	jmp    6fd <morecore+0x56>
  hp = (Header*)p;
 6db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 6e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e4:	8b 55 08             	mov    0x8(%ebp),%edx
 6e7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ed:	83 c0 08             	add    $0x8,%eax
 6f0:	89 04 24             	mov    %eax,(%esp)
 6f3:	e8 d8 fe ff ff       	call   5d0 <free>
  return freep;
 6f8:	a1 04 08 00 00       	mov    0x804,%eax
}
 6fd:	c9                   	leave  
 6fe:	c3                   	ret    

000006ff <malloc>:

void*
malloc(uint nbytes)
{
 6ff:	55                   	push   %ebp
 700:	89 e5                	mov    %esp,%ebp
 702:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	83 c0 07             	add    $0x7,%eax
 70b:	c1 e8 03             	shr    $0x3,%eax
 70e:	83 c0 01             	add    $0x1,%eax
 711:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 714:	a1 04 08 00 00       	mov    0x804,%eax
 719:	89 45 f0             	mov    %eax,-0x10(%ebp)
 71c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 720:	75 23                	jne    745 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 722:	c7 45 f0 fc 07 00 00 	movl   $0x7fc,-0x10(%ebp)
 729:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72c:	a3 04 08 00 00       	mov    %eax,0x804
 731:	a1 04 08 00 00       	mov    0x804,%eax
 736:	a3 fc 07 00 00       	mov    %eax,0x7fc
    base.s.size = 0;
 73b:	c7 05 00 08 00 00 00 	movl   $0x0,0x800
 742:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 745:	8b 45 f0             	mov    -0x10(%ebp),%eax
 748:	8b 00                	mov    (%eax),%eax
 74a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 74d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 750:	8b 40 04             	mov    0x4(%eax),%eax
 753:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 756:	72 4d                	jb     7a5 <malloc+0xa6>
      if(p->s.size == nunits)
 758:	8b 45 ec             	mov    -0x14(%ebp),%eax
 75b:	8b 40 04             	mov    0x4(%eax),%eax
 75e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 761:	75 0c                	jne    76f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 763:	8b 45 ec             	mov    -0x14(%ebp),%eax
 766:	8b 10                	mov    (%eax),%edx
 768:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76b:	89 10                	mov    %edx,(%eax)
 76d:	eb 26                	jmp    795 <malloc+0x96>
      else {
        p->s.size -= nunits;
 76f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 772:	8b 40 04             	mov    0x4(%eax),%eax
 775:	89 c2                	mov    %eax,%edx
 777:	2b 55 f4             	sub    -0xc(%ebp),%edx
 77a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 77d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 780:	8b 45 ec             	mov    -0x14(%ebp),%eax
 783:	8b 40 04             	mov    0x4(%eax),%eax
 786:	c1 e0 03             	shl    $0x3,%eax
 789:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 78c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 78f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 792:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 795:	8b 45 f0             	mov    -0x10(%ebp),%eax
 798:	a3 04 08 00 00       	mov    %eax,0x804
      return (void*)(p + 1);
 79d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a0:	83 c0 08             	add    $0x8,%eax
 7a3:	eb 38                	jmp    7dd <malloc+0xde>
    }
    if(p == freep)
 7a5:	a1 04 08 00 00       	mov    0x804,%eax
 7aa:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7ad:	75 1b                	jne    7ca <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b2:	89 04 24             	mov    %eax,(%esp)
 7b5:	e8 ed fe ff ff       	call   6a7 <morecore>
 7ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7c1:	75 07                	jne    7ca <malloc+0xcb>
        return 0;
 7c3:	b8 00 00 00 00       	mov    $0x0,%eax
 7c8:	eb 13                	jmp    7dd <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d3:	8b 00                	mov    (%eax),%eax
 7d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7d8:	e9 70 ff ff ff       	jmp    74d <malloc+0x4e>
}
 7dd:	c9                   	leave  
 7de:	c3                   	ret    
