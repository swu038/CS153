
_rm:     file format elf32-i386


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

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "Usage: rm files...\n");
   f:	c7 44 24 04 3f 08 00 	movl   $0x83f,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 56 04 00 00       	call   479 <printf>
    exit();
  23:	e8 c0 02 00 00       	call   2e8 <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 43                	jmp    75 <main+0x75>
    if(unlink(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	c1 e0 02             	shl    $0x2,%eax
  39:	03 45 0c             	add    0xc(%ebp),%eax
  3c:	8b 00                	mov    (%eax),%eax
  3e:	89 04 24             	mov    %eax,(%esp)
  41:	e8 fa 02 00 00       	call   340 <unlink>
  46:	85 c0                	test   %eax,%eax
  48:	79 26                	jns    70 <main+0x70>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  4a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4e:	c1 e0 02             	shl    $0x2,%eax
  51:	03 45 0c             	add    0xc(%ebp),%eax
  54:	8b 00                	mov    (%eax),%eax
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	c7 44 24 04 53 08 00 	movl   $0x853,0x4(%esp)
  61:	00 
  62:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  69:	e8 0b 04 00 00       	call   479 <printf>
      break;
  6e:	eb 0e                	jmp    7e <main+0x7e>
  if(argc < 2){
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  70:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  75:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  79:	3b 45 08             	cmp    0x8(%ebp),%eax
  7c:	7c b4                	jl     32 <main+0x32>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  7e:	e8 65 02 00 00       	call   2e8 <exit>
  83:	90                   	nop

00000084 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	57                   	push   %edi
  88:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  89:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8c:	8b 55 10             	mov    0x10(%ebp),%edx
  8f:	8b 45 0c             	mov    0xc(%ebp),%eax
  92:	89 cb                	mov    %ecx,%ebx
  94:	89 df                	mov    %ebx,%edi
  96:	89 d1                	mov    %edx,%ecx
  98:	fc                   	cld    
  99:	f3 aa                	rep stos %al,%es:(%edi)
  9b:	89 ca                	mov    %ecx,%edx
  9d:	89 fb                	mov    %edi,%ebx
  9f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  a2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  a5:	5b                   	pop    %ebx
  a6:	5f                   	pop    %edi
  a7:	5d                   	pop    %ebp
  a8:	c3                   	ret    

000000a9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a9:	55                   	push   %ebp
  aa:	89 e5                	mov    %esp,%ebp
  ac:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  af:	8b 45 08             	mov    0x8(%ebp),%eax
  b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  b8:	0f b6 10             	movzbl (%eax),%edx
  bb:	8b 45 08             	mov    0x8(%ebp),%eax
  be:	88 10                	mov    %dl,(%eax)
  c0:	8b 45 08             	mov    0x8(%ebp),%eax
  c3:	0f b6 00             	movzbl (%eax),%eax
  c6:	84 c0                	test   %al,%al
  c8:	0f 95 c0             	setne  %al
  cb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  cf:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  d3:	84 c0                	test   %al,%al
  d5:	75 de                	jne    b5 <strcpy+0xc>
    ;
  return os;
  d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  da:	c9                   	leave  
  db:	c3                   	ret    

000000dc <strcmp>:

int
strcmp(const char *p, const char *q)
{
  dc:	55                   	push   %ebp
  dd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  df:	eb 08                	jmp    e9 <strcmp+0xd>
    p++, q++;
  e1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  e5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e9:	8b 45 08             	mov    0x8(%ebp),%eax
  ec:	0f b6 00             	movzbl (%eax),%eax
  ef:	84 c0                	test   %al,%al
  f1:	74 10                	je     103 <strcmp+0x27>
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 10             	movzbl (%eax),%edx
  f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  fc:	0f b6 00             	movzbl (%eax),%eax
  ff:	38 c2                	cmp    %al,%dl
 101:	74 de                	je     e1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	0f b6 00             	movzbl (%eax),%eax
 109:	0f b6 d0             	movzbl %al,%edx
 10c:	8b 45 0c             	mov    0xc(%ebp),%eax
 10f:	0f b6 00             	movzbl (%eax),%eax
 112:	0f b6 c0             	movzbl %al,%eax
 115:	89 d1                	mov    %edx,%ecx
 117:	29 c1                	sub    %eax,%ecx
 119:	89 c8                	mov    %ecx,%eax
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    

0000011d <strlen>:

uint
strlen(char *s)
{
 11d:	55                   	push   %ebp
 11e:	89 e5                	mov    %esp,%ebp
 120:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 123:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 12a:	eb 04                	jmp    130 <strlen+0x13>
 12c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 130:	8b 45 fc             	mov    -0x4(%ebp),%eax
 133:	03 45 08             	add    0x8(%ebp),%eax
 136:	0f b6 00             	movzbl (%eax),%eax
 139:	84 c0                	test   %al,%al
 13b:	75 ef                	jne    12c <strlen+0xf>
    ;
  return n;
 13d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 140:	c9                   	leave  
 141:	c3                   	ret    

00000142 <memset>:

void*
memset(void *dst, int c, uint n)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 148:	8b 45 10             	mov    0x10(%ebp),%eax
 14b:	89 44 24 08          	mov    %eax,0x8(%esp)
 14f:	8b 45 0c             	mov    0xc(%ebp),%eax
 152:	89 44 24 04          	mov    %eax,0x4(%esp)
 156:	8b 45 08             	mov    0x8(%ebp),%eax
 159:	89 04 24             	mov    %eax,(%esp)
 15c:	e8 23 ff ff ff       	call   84 <stosb>
  return dst;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
}
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	83 ec 04             	sub    $0x4,%esp
 16c:	8b 45 0c             	mov    0xc(%ebp),%eax
 16f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 172:	eb 14                	jmp    188 <strchr+0x22>
    if(*s == c)
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 17d:	75 05                	jne    184 <strchr+0x1e>
      return (char*)s;
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	eb 13                	jmp    197 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 184:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 188:	8b 45 08             	mov    0x8(%ebp),%eax
 18b:	0f b6 00             	movzbl (%eax),%eax
 18e:	84 c0                	test   %al,%al
 190:	75 e2                	jne    174 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 192:	b8 00 00 00 00       	mov    $0x0,%eax
}
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <gets>:

char*
gets(char *buf, int max)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1a6:	eb 44                	jmp    1ec <gets+0x53>
    cc = read(0, &c, 1);
 1a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1af:	00 
 1b0:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 1b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1be:	e8 45 01 00 00       	call   308 <read>
 1c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 1c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1ca:	7e 2d                	jle    1f9 <gets+0x60>
      break;
    buf[i++] = c;
 1cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1cf:	03 45 08             	add    0x8(%ebp),%eax
 1d2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1d6:	88 10                	mov    %dl,(%eax)
 1d8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 1dc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e0:	3c 0a                	cmp    $0xa,%al
 1e2:	74 16                	je     1fa <gets+0x61>
 1e4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e8:	3c 0d                	cmp    $0xd,%al
 1ea:	74 0e                	je     1fa <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1ef:	83 c0 01             	add    $0x1,%eax
 1f2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1f5:	7c b1                	jl     1a8 <gets+0xf>
 1f7:	eb 01                	jmp    1fa <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1f9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1fd:	03 45 08             	add    0x8(%ebp),%eax
 200:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 203:	8b 45 08             	mov    0x8(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <stat>:

int
stat(char *n, struct stat *st)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 215:	00 
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	89 04 24             	mov    %eax,(%esp)
 21c:	e8 0f 01 00 00       	call   330 <open>
 221:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 224:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 228:	79 07                	jns    231 <stat+0x29>
    return -1;
 22a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 22f:	eb 23                	jmp    254 <stat+0x4c>
  r = fstat(fd, st);
 231:	8b 45 0c             	mov    0xc(%ebp),%eax
 234:	89 44 24 04          	mov    %eax,0x4(%esp)
 238:	8b 45 f0             	mov    -0x10(%ebp),%eax
 23b:	89 04 24             	mov    %eax,(%esp)
 23e:	e8 05 01 00 00       	call   348 <fstat>
 243:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 246:	8b 45 f0             	mov    -0x10(%ebp),%eax
 249:	89 04 24             	mov    %eax,(%esp)
 24c:	e8 c7 00 00 00       	call   318 <close>
  return r;
 251:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 254:	c9                   	leave  
 255:	c3                   	ret    

00000256 <atoi>:

int
atoi(const char *s)
{
 256:	55                   	push   %ebp
 257:	89 e5                	mov    %esp,%ebp
 259:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 25c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 263:	eb 24                	jmp    289 <atoi+0x33>
    n = n*10 + *s++ - '0';
 265:	8b 55 fc             	mov    -0x4(%ebp),%edx
 268:	89 d0                	mov    %edx,%eax
 26a:	c1 e0 02             	shl    $0x2,%eax
 26d:	01 d0                	add    %edx,%eax
 26f:	01 c0                	add    %eax,%eax
 271:	89 c2                	mov    %eax,%edx
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 00             	movzbl (%eax),%eax
 279:	0f be c0             	movsbl %al,%eax
 27c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 27f:	83 e8 30             	sub    $0x30,%eax
 282:	89 45 fc             	mov    %eax,-0x4(%ebp)
 285:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 289:	8b 45 08             	mov    0x8(%ebp),%eax
 28c:	0f b6 00             	movzbl (%eax),%eax
 28f:	3c 2f                	cmp    $0x2f,%al
 291:	7e 0a                	jle    29d <atoi+0x47>
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	0f b6 00             	movzbl (%eax),%eax
 299:	3c 39                	cmp    $0x39,%al
 29b:	7e c8                	jle    265 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 29d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 2ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 2b4:	eb 13                	jmp    2c9 <memmove+0x27>
    *dst++ = *src++;
 2b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b9:	0f b6 10             	movzbl (%eax),%edx
 2bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2bf:	88 10                	mov    %dl,(%eax)
 2c1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 2c5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2cd:	0f 9f c0             	setg   %al
 2d0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2d4:	84 c0                	test   %al,%al
 2d6:	75 de                	jne    2b6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2db:	c9                   	leave  
 2dc:	c3                   	ret    
 2dd:	90                   	nop
 2de:	90                   	nop
 2df:	90                   	nop

000002e0 <fork>:
 2e0:	b8 01 00 00 00       	mov    $0x1,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <exit>:
 2e8:	b8 02 00 00 00       	mov    $0x2,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <exit1>:
 2f0:	b8 16 00 00 00       	mov    $0x16,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <wait>:
 2f8:	b8 03 00 00 00       	mov    $0x3,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <pipe>:
 300:	b8 04 00 00 00       	mov    $0x4,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <read>:
 308:	b8 05 00 00 00       	mov    $0x5,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <write>:
 310:	b8 10 00 00 00       	mov    $0x10,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <close>:
 318:	b8 15 00 00 00       	mov    $0x15,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <kill>:
 320:	b8 06 00 00 00       	mov    $0x6,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <exec>:
 328:	b8 07 00 00 00       	mov    $0x7,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <open>:
 330:	b8 0f 00 00 00       	mov    $0xf,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <mknod>:
 338:	b8 11 00 00 00       	mov    $0x11,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <unlink>:
 340:	b8 12 00 00 00       	mov    $0x12,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <fstat>:
 348:	b8 08 00 00 00       	mov    $0x8,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <link>:
 350:	b8 13 00 00 00       	mov    $0x13,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <mkdir>:
 358:	b8 14 00 00 00       	mov    $0x14,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <chdir>:
 360:	b8 09 00 00 00       	mov    $0x9,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <dup>:
 368:	b8 0a 00 00 00       	mov    $0xa,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <getpid>:
 370:	b8 0b 00 00 00       	mov    $0xb,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <sbrk>:
 378:	b8 0c 00 00 00       	mov    $0xc,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <sleep>:
 380:	b8 0d 00 00 00       	mov    $0xd,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <uptime>:
 388:	b8 0e 00 00 00       	mov    $0xe,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <waitpid>:
 390:	b8 18 00 00 00       	mov    $0x18,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <wait1>:
 398:	b8 17 00 00 00       	mov    $0x17,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	83 ec 28             	sub    $0x28,%esp
 3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3ac:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3b3:	00 
 3b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 3bb:	8b 45 08             	mov    0x8(%ebp),%eax
 3be:	89 04 24             	mov    %eax,(%esp)
 3c1:	e8 4a ff ff ff       	call   310 <write>
}
 3c6:	c9                   	leave  
 3c7:	c3                   	ret    

000003c8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
 3cb:	53                   	push   %ebx
 3cc:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3cf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3d6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3da:	74 17                	je     3f3 <printint+0x2b>
 3dc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3e0:	79 11                	jns    3f3 <printint+0x2b>
    neg = 1;
 3e2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ec:	f7 d8                	neg    %eax
 3ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3f1:	eb 06                	jmp    3f9 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3f9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 400:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 403:	8b 5d 10             	mov    0x10(%ebp),%ebx
 406:	8b 45 f4             	mov    -0xc(%ebp),%eax
 409:	ba 00 00 00 00       	mov    $0x0,%edx
 40e:	f7 f3                	div    %ebx
 410:	89 d0                	mov    %edx,%eax
 412:	0f b6 80 74 08 00 00 	movzbl 0x874(%eax),%eax
 419:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 41d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 421:	8b 45 10             	mov    0x10(%ebp),%eax
 424:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 427:	8b 45 f4             	mov    -0xc(%ebp),%eax
 42a:	ba 00 00 00 00       	mov    $0x0,%edx
 42f:	f7 75 d4             	divl   -0x2c(%ebp)
 432:	89 45 f4             	mov    %eax,-0xc(%ebp)
 435:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 439:	75 c5                	jne    400 <printint+0x38>
  if(neg)
 43b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 43f:	74 28                	je     469 <printint+0xa1>
    buf[i++] = '-';
 441:	8b 45 ec             	mov    -0x14(%ebp),%eax
 444:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 449:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 44d:	eb 1a                	jmp    469 <printint+0xa1>
    putc(fd, buf[i]);
 44f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 452:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 457:	0f be c0             	movsbl %al,%eax
 45a:	89 44 24 04          	mov    %eax,0x4(%esp)
 45e:	8b 45 08             	mov    0x8(%ebp),%eax
 461:	89 04 24             	mov    %eax,(%esp)
 464:	e8 37 ff ff ff       	call   3a0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 469:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 46d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 471:	79 dc                	jns    44f <printint+0x87>
    putc(fd, buf[i]);
}
 473:	83 c4 44             	add    $0x44,%esp
 476:	5b                   	pop    %ebx
 477:	5d                   	pop    %ebp
 478:	c3                   	ret    

00000479 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
 47c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 47f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 486:	8d 45 0c             	lea    0xc(%ebp),%eax
 489:	83 c0 04             	add    $0x4,%eax
 48c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 48f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 496:	e9 7e 01 00 00       	jmp    619 <printf+0x1a0>
    c = fmt[i] & 0xff;
 49b:	8b 55 0c             	mov    0xc(%ebp),%edx
 49e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4a1:	8d 04 02             	lea    (%edx,%eax,1),%eax
 4a4:	0f b6 00             	movzbl (%eax),%eax
 4a7:	0f be c0             	movsbl %al,%eax
 4aa:	25 ff 00 00 00       	and    $0xff,%eax
 4af:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 4b2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4b6:	75 2c                	jne    4e4 <printf+0x6b>
      if(c == '%'){
 4b8:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 4bc:	75 0c                	jne    4ca <printf+0x51>
        state = '%';
 4be:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 4c5:	e9 4b 01 00 00       	jmp    615 <printf+0x19c>
      } else {
        putc(fd, c);
 4ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4cd:	0f be c0             	movsbl %al,%eax
 4d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d4:	8b 45 08             	mov    0x8(%ebp),%eax
 4d7:	89 04 24             	mov    %eax,(%esp)
 4da:	e8 c1 fe ff ff       	call   3a0 <putc>
 4df:	e9 31 01 00 00       	jmp    615 <printf+0x19c>
      }
    } else if(state == '%'){
 4e4:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4e8:	0f 85 27 01 00 00    	jne    615 <printf+0x19c>
      if(c == 'd'){
 4ee:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4f2:	75 2d                	jne    521 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f7:	8b 00                	mov    (%eax),%eax
 4f9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 500:	00 
 501:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 508:	00 
 509:	89 44 24 04          	mov    %eax,0x4(%esp)
 50d:	8b 45 08             	mov    0x8(%ebp),%eax
 510:	89 04 24             	mov    %eax,(%esp)
 513:	e8 b0 fe ff ff       	call   3c8 <printint>
        ap++;
 518:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 51c:	e9 ed 00 00 00       	jmp    60e <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 521:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 525:	74 06                	je     52d <printf+0xb4>
 527:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 52b:	75 2d                	jne    55a <printf+0xe1>
        printint(fd, *ap, 16, 0);
 52d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 530:	8b 00                	mov    (%eax),%eax
 532:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 539:	00 
 53a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 541:	00 
 542:	89 44 24 04          	mov    %eax,0x4(%esp)
 546:	8b 45 08             	mov    0x8(%ebp),%eax
 549:	89 04 24             	mov    %eax,(%esp)
 54c:	e8 77 fe ff ff       	call   3c8 <printint>
        ap++;
 551:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 555:	e9 b4 00 00 00       	jmp    60e <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 55a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 55e:	75 46                	jne    5a6 <printf+0x12d>
        s = (char*)*ap;
 560:	8b 45 f4             	mov    -0xc(%ebp),%eax
 563:	8b 00                	mov    (%eax),%eax
 565:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 568:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 56c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 570:	75 27                	jne    599 <printf+0x120>
          s = "(null)";
 572:	c7 45 e4 6c 08 00 00 	movl   $0x86c,-0x1c(%ebp)
        while(*s != 0){
 579:	eb 1f                	jmp    59a <printf+0x121>
          putc(fd, *s);
 57b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 57e:	0f b6 00             	movzbl (%eax),%eax
 581:	0f be c0             	movsbl %al,%eax
 584:	89 44 24 04          	mov    %eax,0x4(%esp)
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	89 04 24             	mov    %eax,(%esp)
 58e:	e8 0d fe ff ff       	call   3a0 <putc>
          s++;
 593:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 597:	eb 01                	jmp    59a <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 599:	90                   	nop
 59a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 59d:	0f b6 00             	movzbl (%eax),%eax
 5a0:	84 c0                	test   %al,%al
 5a2:	75 d7                	jne    57b <printf+0x102>
 5a4:	eb 68                	jmp    60e <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5a6:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 5aa:	75 1d                	jne    5c9 <printf+0x150>
        putc(fd, *ap);
 5ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5af:	8b 00                	mov    (%eax),%eax
 5b1:	0f be c0             	movsbl %al,%eax
 5b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b8:	8b 45 08             	mov    0x8(%ebp),%eax
 5bb:	89 04 24             	mov    %eax,(%esp)
 5be:	e8 dd fd ff ff       	call   3a0 <putc>
        ap++;
 5c3:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5c7:	eb 45                	jmp    60e <printf+0x195>
      } else if(c == '%'){
 5c9:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5cd:	75 17                	jne    5e6 <printf+0x16d>
        putc(fd, c);
 5cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d2:	0f be c0             	movsbl %al,%eax
 5d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d9:	8b 45 08             	mov    0x8(%ebp),%eax
 5dc:	89 04 24             	mov    %eax,(%esp)
 5df:	e8 bc fd ff ff       	call   3a0 <putc>
 5e4:	eb 28                	jmp    60e <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5e6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5ed:	00 
 5ee:	8b 45 08             	mov    0x8(%ebp),%eax
 5f1:	89 04 24             	mov    %eax,(%esp)
 5f4:	e8 a7 fd ff ff       	call   3a0 <putc>
        putc(fd, c);
 5f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5fc:	0f be c0             	movsbl %al,%eax
 5ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 603:	8b 45 08             	mov    0x8(%ebp),%eax
 606:	89 04 24             	mov    %eax,(%esp)
 609:	e8 92 fd ff ff       	call   3a0 <putc>
      }
      state = 0;
 60e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 615:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 619:	8b 55 0c             	mov    0xc(%ebp),%edx
 61c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 61f:	8d 04 02             	lea    (%edx,%eax,1),%eax
 622:	0f b6 00             	movzbl (%eax),%eax
 625:	84 c0                	test   %al,%al
 627:	0f 85 6e fe ff ff    	jne    49b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 62d:	c9                   	leave  
 62e:	c3                   	ret    
 62f:	90                   	nop

00000630 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 636:	8b 45 08             	mov    0x8(%ebp),%eax
 639:	83 e8 08             	sub    $0x8,%eax
 63c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63f:	a1 90 08 00 00       	mov    0x890,%eax
 644:	89 45 fc             	mov    %eax,-0x4(%ebp)
 647:	eb 24                	jmp    66d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 649:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64c:	8b 00                	mov    (%eax),%eax
 64e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 651:	77 12                	ja     665 <free+0x35>
 653:	8b 45 f8             	mov    -0x8(%ebp),%eax
 656:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 659:	77 24                	ja     67f <free+0x4f>
 65b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65e:	8b 00                	mov    (%eax),%eax
 660:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 663:	77 1a                	ja     67f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 665:	8b 45 fc             	mov    -0x4(%ebp),%eax
 668:	8b 00                	mov    (%eax),%eax
 66a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 66d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 670:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 673:	76 d4                	jbe    649 <free+0x19>
 675:	8b 45 fc             	mov    -0x4(%ebp),%eax
 678:	8b 00                	mov    (%eax),%eax
 67a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 67d:	76 ca                	jbe    649 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 67f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 682:	8b 40 04             	mov    0x4(%eax),%eax
 685:	c1 e0 03             	shl    $0x3,%eax
 688:	89 c2                	mov    %eax,%edx
 68a:	03 55 f8             	add    -0x8(%ebp),%edx
 68d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 690:	8b 00                	mov    (%eax),%eax
 692:	39 c2                	cmp    %eax,%edx
 694:	75 24                	jne    6ba <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 696:	8b 45 f8             	mov    -0x8(%ebp),%eax
 699:	8b 50 04             	mov    0x4(%eax),%edx
 69c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69f:	8b 00                	mov    (%eax),%eax
 6a1:	8b 40 04             	mov    0x4(%eax),%eax
 6a4:	01 c2                	add    %eax,%edx
 6a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	8b 00                	mov    (%eax),%eax
 6b1:	8b 10                	mov    (%eax),%edx
 6b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b6:	89 10                	mov    %edx,(%eax)
 6b8:	eb 0a                	jmp    6c4 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bd:	8b 10                	mov    (%eax),%edx
 6bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c7:	8b 40 04             	mov    0x4(%eax),%eax
 6ca:	c1 e0 03             	shl    $0x3,%eax
 6cd:	03 45 fc             	add    -0x4(%ebp),%eax
 6d0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6d3:	75 20                	jne    6f5 <free+0xc5>
    p->s.size += bp->s.size;
 6d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d8:	8b 50 04             	mov    0x4(%eax),%edx
 6db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6de:	8b 40 04             	mov    0x4(%eax),%eax
 6e1:	01 c2                	add    %eax,%edx
 6e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ec:	8b 10                	mov    (%eax),%edx
 6ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f1:	89 10                	mov    %edx,(%eax)
 6f3:	eb 08                	jmp    6fd <free+0xcd>
  } else
    p->s.ptr = bp;
 6f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6fb:	89 10                	mov    %edx,(%eax)
  freep = p;
 6fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 700:	a3 90 08 00 00       	mov    %eax,0x890
}
 705:	c9                   	leave  
 706:	c3                   	ret    

00000707 <morecore>:

static Header*
morecore(uint nu)
{
 707:	55                   	push   %ebp
 708:	89 e5                	mov    %esp,%ebp
 70a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 70d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 714:	77 07                	ja     71d <morecore+0x16>
    nu = 4096;
 716:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	c1 e0 03             	shl    $0x3,%eax
 723:	89 04 24             	mov    %eax,(%esp)
 726:	e8 4d fc ff ff       	call   378 <sbrk>
 72b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 72e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 732:	75 07                	jne    73b <morecore+0x34>
    return 0;
 734:	b8 00 00 00 00       	mov    $0x0,%eax
 739:	eb 22                	jmp    75d <morecore+0x56>
  hp = (Header*)p;
 73b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 741:	8b 45 f4             	mov    -0xc(%ebp),%eax
 744:	8b 55 08             	mov    0x8(%ebp),%edx
 747:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 74a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74d:	83 c0 08             	add    $0x8,%eax
 750:	89 04 24             	mov    %eax,(%esp)
 753:	e8 d8 fe ff ff       	call   630 <free>
  return freep;
 758:	a1 90 08 00 00       	mov    0x890,%eax
}
 75d:	c9                   	leave  
 75e:	c3                   	ret    

0000075f <malloc>:

void*
malloc(uint nbytes)
{
 75f:	55                   	push   %ebp
 760:	89 e5                	mov    %esp,%ebp
 762:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 765:	8b 45 08             	mov    0x8(%ebp),%eax
 768:	83 c0 07             	add    $0x7,%eax
 76b:	c1 e8 03             	shr    $0x3,%eax
 76e:	83 c0 01             	add    $0x1,%eax
 771:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 774:	a1 90 08 00 00       	mov    0x890,%eax
 779:	89 45 f0             	mov    %eax,-0x10(%ebp)
 77c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 780:	75 23                	jne    7a5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 782:	c7 45 f0 88 08 00 00 	movl   $0x888,-0x10(%ebp)
 789:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78c:	a3 90 08 00 00       	mov    %eax,0x890
 791:	a1 90 08 00 00       	mov    0x890,%eax
 796:	a3 88 08 00 00       	mov    %eax,0x888
    base.s.size = 0;
 79b:	c7 05 8c 08 00 00 00 	movl   $0x0,0x88c
 7a2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a8:	8b 00                	mov    (%eax),%eax
 7aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 7ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b0:	8b 40 04             	mov    0x4(%eax),%eax
 7b3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7b6:	72 4d                	jb     805 <malloc+0xa6>
      if(p->s.size == nunits)
 7b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7bb:	8b 40 04             	mov    0x4(%eax),%eax
 7be:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7c1:	75 0c                	jne    7cf <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cb:	89 10                	mov    %edx,(%eax)
 7cd:	eb 26                	jmp    7f5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d2:	8b 40 04             	mov    0x4(%eax),%eax
 7d5:	89 c2                	mov    %eax,%edx
 7d7:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7da:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7dd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7e3:	8b 40 04             	mov    0x4(%eax),%eax
 7e6:	c1 e0 03             	shl    $0x3,%eax
 7e9:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7f2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f8:	a3 90 08 00 00       	mov    %eax,0x890
      return (void*)(p + 1);
 7fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 800:	83 c0 08             	add    $0x8,%eax
 803:	eb 38                	jmp    83d <malloc+0xde>
    }
    if(p == freep)
 805:	a1 90 08 00 00       	mov    0x890,%eax
 80a:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 80d:	75 1b                	jne    82a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 80f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 812:	89 04 24             	mov    %eax,(%esp)
 815:	e8 ed fe ff ff       	call   707 <morecore>
 81a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 81d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 821:	75 07                	jne    82a <malloc+0xcb>
        return 0;
 823:	b8 00 00 00 00       	mov    $0x0,%eax
 828:	eb 13                	jmp    83d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 82d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 830:	8b 45 ec             	mov    -0x14(%ebp),%eax
 833:	8b 00                	mov    (%eax),%eax
 835:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 838:	e9 70 ff ff ff       	jmp    7ad <malloc+0x4e>
}
 83d:	c9                   	leave  
 83e:	c3                   	ret    
