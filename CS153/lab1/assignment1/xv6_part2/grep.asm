
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n, m;
  char *p, *q;
  
  m = 0;
   6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
   d:	e9 bf 00 00 00       	jmp    d1 <grep+0xd1>
    m += n;
  12:	8b 45 e8             	mov    -0x18(%ebp),%eax
  15:	01 45 ec             	add    %eax,-0x14(%ebp)
    p = buf;
  18:	c7 45 f0 80 0b 00 00 	movl   $0xb80,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  1f:	eb 53                	jmp    74 <grep+0x74>
      *q = 0;
  21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  24:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
  27:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2a:	89 44 24 04          	mov    %eax,0x4(%esp)
  2e:	8b 45 08             	mov    0x8(%ebp),%eax
  31:	89 04 24             	mov    %eax,(%esp)
  34:	e8 b1 01 00 00       	call   1ea <match>
  39:	85 c0                	test   %eax,%eax
  3b:	74 2e                	je     6b <grep+0x6b>
        *q = '\n';
  3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  40:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
  43:	8b 45 f4             	mov    -0xc(%ebp),%eax
  46:	83 c0 01             	add    $0x1,%eax
  49:	89 c2                	mov    %eax,%edx
  4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  4e:	89 d1                	mov    %edx,%ecx
  50:	29 c1                	sub    %eax,%ecx
  52:	89 c8                	mov    %ecx,%eax
  54:	89 44 24 08          	mov    %eax,0x8(%esp)
  58:	8b 45 f0             	mov    -0x10(%ebp),%eax
  5b:	89 44 24 04          	mov    %eax,0x4(%esp)
  5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  66:	e8 79 05 00 00       	call   5e4 <write>
      }
      p = q+1;
  6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  6e:	83 c0 01             	add    $0x1,%eax
  71:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
  74:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  7b:	00 
  7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  7f:	89 04 24             	mov    %eax,(%esp)
  82:	e8 ab 03 00 00       	call   432 <strchr>
  87:	89 45 f4             	mov    %eax,-0xc(%ebp)
  8a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  8e:	75 91                	jne    21 <grep+0x21>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
  90:	81 7d f0 80 0b 00 00 	cmpl   $0xb80,-0x10(%ebp)
  97:	75 07                	jne    a0 <grep+0xa0>
      m = 0;
  99:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    if(m > 0){
  a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  a4:	7e 2b                	jle    d1 <grep+0xd1>
      m -= p - buf;
  a6:	ba 80 0b 00 00       	mov    $0xb80,%edx
  ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
  ae:	89 d1                	mov    %edx,%ecx
  b0:	29 c1                	sub    %eax,%ecx
  b2:	89 c8                	mov    %ecx,%eax
  b4:	01 45 ec             	add    %eax,-0x14(%ebp)
      memmove(buf, p, m);
  b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  ba:	89 44 24 08          	mov    %eax,0x8(%esp)
  be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c1:	89 44 24 04          	mov    %eax,0x4(%esp)
  c5:	c7 04 24 80 0b 00 00 	movl   $0xb80,(%esp)
  cc:	e8 9d 04 00 00       	call   56e <memmove>
{
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
  d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  d4:	ba 00 04 00 00       	mov    $0x400,%edx
  d9:	89 d1                	mov    %edx,%ecx
  db:	29 c1                	sub    %eax,%ecx
  dd:	89 c8                	mov    %ecx,%eax
  df:	8b 55 ec             	mov    -0x14(%ebp),%edx
  e2:	81 c2 80 0b 00 00    	add    $0xb80,%edx
  e8:	89 44 24 08          	mov    %eax,0x8(%esp)
  ec:	89 54 24 04          	mov    %edx,0x4(%esp)
  f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  f3:	89 04 24             	mov    %eax,(%esp)
  f6:	e8 e1 04 00 00       	call   5dc <read>
  fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  fe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 102:	0f 8f 0a ff ff ff    	jg     12 <grep+0x12>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
 108:	c9                   	leave  
 109:	c3                   	ret    

0000010a <main>:

int
main(int argc, char *argv[])
{
 10a:	55                   	push   %ebp
 10b:	89 e5                	mov    %esp,%ebp
 10d:	83 e4 f0             	and    $0xfffffff0,%esp
 110:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
 113:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 117:	7f 19                	jg     132 <main+0x28>
    printf(2, "usage: grep pattern [file ...]\n");
 119:	c7 44 24 04 0c 0b 00 	movl   $0xb0c,0x4(%esp)
 120:	00 
 121:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 128:	e8 18 06 00 00       	call   745 <printf>
    exit();
 12d:	e8 82 04 00 00       	call   5b4 <exit>
  }
  pattern = argv[1];
 132:	8b 45 0c             	mov    0xc(%ebp),%eax
 135:	83 c0 04             	add    $0x4,%eax
 138:	8b 00                	mov    (%eax),%eax
 13a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  
  if(argc <= 2){
 13e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 142:	7f 19                	jg     15d <main+0x53>
    grep(pattern, 0);
 144:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 14b:	00 
 14c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 150:	89 04 24             	mov    %eax,(%esp)
 153:	e8 a8 fe ff ff       	call   0 <grep>
    exit();
 158:	e8 57 04 00 00       	call   5b4 <exit>
  }

  for(i = 2; i < argc; i++){
 15d:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
 164:	00 
 165:	eb 75                	jmp    1dc <main+0xd2>
    if((fd = open(argv[i], 0)) < 0){
 167:	8b 44 24 18          	mov    0x18(%esp),%eax
 16b:	c1 e0 02             	shl    $0x2,%eax
 16e:	03 45 0c             	add    0xc(%ebp),%eax
 171:	8b 00                	mov    (%eax),%eax
 173:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 17a:	00 
 17b:	89 04 24             	mov    %eax,(%esp)
 17e:	e8 81 04 00 00       	call   604 <open>
 183:	89 44 24 14          	mov    %eax,0x14(%esp)
 187:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 18c:	79 29                	jns    1b7 <main+0xad>
      printf(1, "grep: cannot open %s\n", argv[i]);
 18e:	8b 44 24 18          	mov    0x18(%esp),%eax
 192:	c1 e0 02             	shl    $0x2,%eax
 195:	03 45 0c             	add    0xc(%ebp),%eax
 198:	8b 00                	mov    (%eax),%eax
 19a:	89 44 24 08          	mov    %eax,0x8(%esp)
 19e:	c7 44 24 04 2c 0b 00 	movl   $0xb2c,0x4(%esp)
 1a5:	00 
 1a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ad:	e8 93 05 00 00       	call   745 <printf>
      exit();
 1b2:	e8 fd 03 00 00       	call   5b4 <exit>
    }
    grep(pattern, fd);
 1b7:	8b 44 24 14          	mov    0x14(%esp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1c3:	89 04 24             	mov    %eax,(%esp)
 1c6:	e8 35 fe ff ff       	call   0 <grep>
    close(fd);
 1cb:	8b 44 24 14          	mov    0x14(%esp),%eax
 1cf:	89 04 24             	mov    %eax,(%esp)
 1d2:	e8 15 04 00 00       	call   5ec <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
 1d7:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
 1dc:	8b 44 24 18          	mov    0x18(%esp),%eax
 1e0:	3b 45 08             	cmp    0x8(%ebp),%eax
 1e3:	7c 82                	jl     167 <main+0x5d>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
 1e5:	e8 ca 03 00 00       	call   5b4 <exit>

000001ea <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 1ea:	55                   	push   %ebp
 1eb:	89 e5                	mov    %esp,%ebp
 1ed:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	0f b6 00             	movzbl (%eax),%eax
 1f6:	3c 5e                	cmp    $0x5e,%al
 1f8:	75 17                	jne    211 <match+0x27>
    return matchhere(re+1, text);
 1fa:	8b 45 08             	mov    0x8(%ebp),%eax
 1fd:	8d 50 01             	lea    0x1(%eax),%edx
 200:	8b 45 0c             	mov    0xc(%ebp),%eax
 203:	89 44 24 04          	mov    %eax,0x4(%esp)
 207:	89 14 24             	mov    %edx,(%esp)
 20a:	e8 39 00 00 00       	call   248 <matchhere>
 20f:	eb 35                	jmp    246 <match+0x5c>
  do{  // must look at empty string
    if(matchhere(re, text))
 211:	8b 45 0c             	mov    0xc(%ebp),%eax
 214:	89 44 24 04          	mov    %eax,0x4(%esp)
 218:	8b 45 08             	mov    0x8(%ebp),%eax
 21b:	89 04 24             	mov    %eax,(%esp)
 21e:	e8 25 00 00 00       	call   248 <matchhere>
 223:	85 c0                	test   %eax,%eax
 225:	74 07                	je     22e <match+0x44>
      return 1;
 227:	b8 01 00 00 00       	mov    $0x1,%eax
 22c:	eb 18                	jmp    246 <match+0x5c>
  }while(*text++ != '\0');
 22e:	8b 45 0c             	mov    0xc(%ebp),%eax
 231:	0f b6 00             	movzbl (%eax),%eax
 234:	84 c0                	test   %al,%al
 236:	0f 95 c0             	setne  %al
 239:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 23d:	84 c0                	test   %al,%al
 23f:	75 d0                	jne    211 <match+0x27>
  return 0;
 241:	b8 00 00 00 00       	mov    $0x0,%eax
}
 246:	c9                   	leave  
 247:	c3                   	ret    

00000248 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	0f b6 00             	movzbl (%eax),%eax
 254:	84 c0                	test   %al,%al
 256:	75 0a                	jne    262 <matchhere+0x1a>
    return 1;
 258:	b8 01 00 00 00       	mov    $0x1,%eax
 25d:	e9 9b 00 00 00       	jmp    2fd <matchhere+0xb5>
  if(re[1] == '*')
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	83 c0 01             	add    $0x1,%eax
 268:	0f b6 00             	movzbl (%eax),%eax
 26b:	3c 2a                	cmp    $0x2a,%al
 26d:	75 24                	jne    293 <matchhere+0x4b>
    return matchstar(re[0], re+2, text);
 26f:	8b 45 08             	mov    0x8(%ebp),%eax
 272:	8d 48 02             	lea    0x2(%eax),%ecx
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	0f b6 00             	movzbl (%eax),%eax
 27b:	0f be c0             	movsbl %al,%eax
 27e:	8b 55 0c             	mov    0xc(%ebp),%edx
 281:	89 54 24 08          	mov    %edx,0x8(%esp)
 285:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 289:	89 04 24             	mov    %eax,(%esp)
 28c:	e8 6e 00 00 00       	call   2ff <matchstar>
 291:	eb 6a                	jmp    2fd <matchhere+0xb5>
  if(re[0] == '$' && re[1] == '\0')
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	0f b6 00             	movzbl (%eax),%eax
 299:	3c 24                	cmp    $0x24,%al
 29b:	75 1d                	jne    2ba <matchhere+0x72>
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
 2a0:	83 c0 01             	add    $0x1,%eax
 2a3:	0f b6 00             	movzbl (%eax),%eax
 2a6:	84 c0                	test   %al,%al
 2a8:	75 10                	jne    2ba <matchhere+0x72>
    return *text == '\0';
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	0f b6 00             	movzbl (%eax),%eax
 2b0:	84 c0                	test   %al,%al
 2b2:	0f 94 c0             	sete   %al
 2b5:	0f b6 c0             	movzbl %al,%eax
 2b8:	eb 43                	jmp    2fd <matchhere+0xb5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	0f b6 00             	movzbl (%eax),%eax
 2c0:	84 c0                	test   %al,%al
 2c2:	74 34                	je     2f8 <matchhere+0xb0>
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	0f b6 00             	movzbl (%eax),%eax
 2ca:	3c 2e                	cmp    $0x2e,%al
 2cc:	74 10                	je     2de <matchhere+0x96>
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
 2d1:	0f b6 10             	movzbl (%eax),%edx
 2d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d7:	0f b6 00             	movzbl (%eax),%eax
 2da:	38 c2                	cmp    %al,%dl
 2dc:	75 1a                	jne    2f8 <matchhere+0xb0>
    return matchhere(re+1, text+1);
 2de:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e1:	8d 50 01             	lea    0x1(%eax),%edx
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	83 c0 01             	add    $0x1,%eax
 2ea:	89 54 24 04          	mov    %edx,0x4(%esp)
 2ee:	89 04 24             	mov    %eax,(%esp)
 2f1:	e8 52 ff ff ff       	call   248 <matchhere>
 2f6:	eb 05                	jmp    2fd <matchhere+0xb5>
  return 0;
 2f8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2fd:	c9                   	leave  
 2fe:	c3                   	ret    

000002ff <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 2ff:	55                   	push   %ebp
 300:	89 e5                	mov    %esp,%ebp
 302:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 305:	8b 45 10             	mov    0x10(%ebp),%eax
 308:	89 44 24 04          	mov    %eax,0x4(%esp)
 30c:	8b 45 0c             	mov    0xc(%ebp),%eax
 30f:	89 04 24             	mov    %eax,(%esp)
 312:	e8 31 ff ff ff       	call   248 <matchhere>
 317:	85 c0                	test   %eax,%eax
 319:	74 07                	je     322 <matchstar+0x23>
      return 1;
 31b:	b8 01 00 00 00       	mov    $0x1,%eax
 320:	eb 2c                	jmp    34e <matchstar+0x4f>
  }while(*text!='\0' && (*text++==c || c=='.'));
 322:	8b 45 10             	mov    0x10(%ebp),%eax
 325:	0f b6 00             	movzbl (%eax),%eax
 328:	84 c0                	test   %al,%al
 32a:	74 1d                	je     349 <matchstar+0x4a>
 32c:	8b 45 10             	mov    0x10(%ebp),%eax
 32f:	0f b6 00             	movzbl (%eax),%eax
 332:	0f be c0             	movsbl %al,%eax
 335:	3b 45 08             	cmp    0x8(%ebp),%eax
 338:	0f 94 c0             	sete   %al
 33b:	83 45 10 01          	addl   $0x1,0x10(%ebp)
 33f:	84 c0                	test   %al,%al
 341:	75 c2                	jne    305 <matchstar+0x6>
 343:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 347:	74 bc                	je     305 <matchstar+0x6>
  return 0;
 349:	b8 00 00 00 00       	mov    $0x0,%eax
}
 34e:	c9                   	leave  
 34f:	c3                   	ret    

00000350 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 355:	8b 4d 08             	mov    0x8(%ebp),%ecx
 358:	8b 55 10             	mov    0x10(%ebp),%edx
 35b:	8b 45 0c             	mov    0xc(%ebp),%eax
 35e:	89 cb                	mov    %ecx,%ebx
 360:	89 df                	mov    %ebx,%edi
 362:	89 d1                	mov    %edx,%ecx
 364:	fc                   	cld    
 365:	f3 aa                	rep stos %al,%es:(%edi)
 367:	89 ca                	mov    %ecx,%edx
 369:	89 fb                	mov    %edi,%ebx
 36b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 36e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 371:	5b                   	pop    %ebx
 372:	5f                   	pop    %edi
 373:	5d                   	pop    %ebp
 374:	c3                   	ret    

00000375 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 375:	55                   	push   %ebp
 376:	89 e5                	mov    %esp,%ebp
 378:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 381:	8b 45 0c             	mov    0xc(%ebp),%eax
 384:	0f b6 10             	movzbl (%eax),%edx
 387:	8b 45 08             	mov    0x8(%ebp),%eax
 38a:	88 10                	mov    %dl,(%eax)
 38c:	8b 45 08             	mov    0x8(%ebp),%eax
 38f:	0f b6 00             	movzbl (%eax),%eax
 392:	84 c0                	test   %al,%al
 394:	0f 95 c0             	setne  %al
 397:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 39b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 39f:	84 c0                	test   %al,%al
 3a1:	75 de                	jne    381 <strcpy+0xc>
    ;
  return os;
 3a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3a6:	c9                   	leave  
 3a7:	c3                   	ret    

000003a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3ab:	eb 08                	jmp    3b5 <strcmp+0xd>
    p++, q++;
 3ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3b5:	8b 45 08             	mov    0x8(%ebp),%eax
 3b8:	0f b6 00             	movzbl (%eax),%eax
 3bb:	84 c0                	test   %al,%al
 3bd:	74 10                	je     3cf <strcmp+0x27>
 3bf:	8b 45 08             	mov    0x8(%ebp),%eax
 3c2:	0f b6 10             	movzbl (%eax),%edx
 3c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c8:	0f b6 00             	movzbl (%eax),%eax
 3cb:	38 c2                	cmp    %al,%dl
 3cd:	74 de                	je     3ad <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3cf:	8b 45 08             	mov    0x8(%ebp),%eax
 3d2:	0f b6 00             	movzbl (%eax),%eax
 3d5:	0f b6 d0             	movzbl %al,%edx
 3d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3db:	0f b6 00             	movzbl (%eax),%eax
 3de:	0f b6 c0             	movzbl %al,%eax
 3e1:	89 d1                	mov    %edx,%ecx
 3e3:	29 c1                	sub    %eax,%ecx
 3e5:	89 c8                	mov    %ecx,%eax
}
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret    

000003e9 <strlen>:

uint
strlen(char *s)
{
 3e9:	55                   	push   %ebp
 3ea:	89 e5                	mov    %esp,%ebp
 3ec:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3f6:	eb 04                	jmp    3fc <strlen+0x13>
 3f8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ff:	03 45 08             	add    0x8(%ebp),%eax
 402:	0f b6 00             	movzbl (%eax),%eax
 405:	84 c0                	test   %al,%al
 407:	75 ef                	jne    3f8 <strlen+0xf>
    ;
  return n;
 409:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 40c:	c9                   	leave  
 40d:	c3                   	ret    

0000040e <memset>:

void*
memset(void *dst, int c, uint n)
{
 40e:	55                   	push   %ebp
 40f:	89 e5                	mov    %esp,%ebp
 411:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 414:	8b 45 10             	mov    0x10(%ebp),%eax
 417:	89 44 24 08          	mov    %eax,0x8(%esp)
 41b:	8b 45 0c             	mov    0xc(%ebp),%eax
 41e:	89 44 24 04          	mov    %eax,0x4(%esp)
 422:	8b 45 08             	mov    0x8(%ebp),%eax
 425:	89 04 24             	mov    %eax,(%esp)
 428:	e8 23 ff ff ff       	call   350 <stosb>
  return dst;
 42d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 430:	c9                   	leave  
 431:	c3                   	ret    

00000432 <strchr>:

char*
strchr(const char *s, char c)
{
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	83 ec 04             	sub    $0x4,%esp
 438:	8b 45 0c             	mov    0xc(%ebp),%eax
 43b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 43e:	eb 14                	jmp    454 <strchr+0x22>
    if(*s == c)
 440:	8b 45 08             	mov    0x8(%ebp),%eax
 443:	0f b6 00             	movzbl (%eax),%eax
 446:	3a 45 fc             	cmp    -0x4(%ebp),%al
 449:	75 05                	jne    450 <strchr+0x1e>
      return (char*)s;
 44b:	8b 45 08             	mov    0x8(%ebp),%eax
 44e:	eb 13                	jmp    463 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 450:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 454:	8b 45 08             	mov    0x8(%ebp),%eax
 457:	0f b6 00             	movzbl (%eax),%eax
 45a:	84 c0                	test   %al,%al
 45c:	75 e2                	jne    440 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 45e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 463:	c9                   	leave  
 464:	c3                   	ret    

00000465 <gets>:

char*
gets(char *buf, int max)
{
 465:	55                   	push   %ebp
 466:	89 e5                	mov    %esp,%ebp
 468:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 46b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 472:	eb 44                	jmp    4b8 <gets+0x53>
    cc = read(0, &c, 1);
 474:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 47b:	00 
 47c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 47f:	89 44 24 04          	mov    %eax,0x4(%esp)
 483:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 48a:	e8 4d 01 00 00       	call   5dc <read>
 48f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 492:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 496:	7e 2d                	jle    4c5 <gets+0x60>
      break;
    buf[i++] = c;
 498:	8b 45 f0             	mov    -0x10(%ebp),%eax
 49b:	03 45 08             	add    0x8(%ebp),%eax
 49e:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 4a2:	88 10                	mov    %dl,(%eax)
 4a4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 4a8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4ac:	3c 0a                	cmp    $0xa,%al
 4ae:	74 16                	je     4c6 <gets+0x61>
 4b0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b4:	3c 0d                	cmp    $0xd,%al
 4b6:	74 0e                	je     4c6 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4bb:	83 c0 01             	add    $0x1,%eax
 4be:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4c1:	7c b1                	jl     474 <gets+0xf>
 4c3:	eb 01                	jmp    4c6 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4c5:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4c9:	03 45 08             	add    0x8(%ebp),%eax
 4cc:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4cf:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4d2:	c9                   	leave  
 4d3:	c3                   	ret    

000004d4 <stat>:

int
stat(char *n, struct stat *st)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4da:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4e1:	00 
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	89 04 24             	mov    %eax,(%esp)
 4e8:	e8 17 01 00 00       	call   604 <open>
 4ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 4f0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4f4:	79 07                	jns    4fd <stat+0x29>
    return -1;
 4f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4fb:	eb 23                	jmp    520 <stat+0x4c>
  r = fstat(fd, st);
 4fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 500:	89 44 24 04          	mov    %eax,0x4(%esp)
 504:	8b 45 f0             	mov    -0x10(%ebp),%eax
 507:	89 04 24             	mov    %eax,(%esp)
 50a:	e8 0d 01 00 00       	call   61c <fstat>
 50f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 512:	8b 45 f0             	mov    -0x10(%ebp),%eax
 515:	89 04 24             	mov    %eax,(%esp)
 518:	e8 cf 00 00 00       	call   5ec <close>
  return r;
 51d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 520:	c9                   	leave  
 521:	c3                   	ret    

00000522 <atoi>:

int
atoi(const char *s)
{
 522:	55                   	push   %ebp
 523:	89 e5                	mov    %esp,%ebp
 525:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 528:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 52f:	eb 24                	jmp    555 <atoi+0x33>
    n = n*10 + *s++ - '0';
 531:	8b 55 fc             	mov    -0x4(%ebp),%edx
 534:	89 d0                	mov    %edx,%eax
 536:	c1 e0 02             	shl    $0x2,%eax
 539:	01 d0                	add    %edx,%eax
 53b:	01 c0                	add    %eax,%eax
 53d:	89 c2                	mov    %eax,%edx
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	0f b6 00             	movzbl (%eax),%eax
 545:	0f be c0             	movsbl %al,%eax
 548:	8d 04 02             	lea    (%edx,%eax,1),%eax
 54b:	83 e8 30             	sub    $0x30,%eax
 54e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 551:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	0f b6 00             	movzbl (%eax),%eax
 55b:	3c 2f                	cmp    $0x2f,%al
 55d:	7e 0a                	jle    569 <atoi+0x47>
 55f:	8b 45 08             	mov    0x8(%ebp),%eax
 562:	0f b6 00             	movzbl (%eax),%eax
 565:	3c 39                	cmp    $0x39,%al
 567:	7e c8                	jle    531 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 569:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 56c:	c9                   	leave  
 56d:	c3                   	ret    

0000056e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 56e:	55                   	push   %ebp
 56f:	89 e5                	mov    %esp,%ebp
 571:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 57a:	8b 45 0c             	mov    0xc(%ebp),%eax
 57d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 580:	eb 13                	jmp    595 <memmove+0x27>
    *dst++ = *src++;
 582:	8b 45 fc             	mov    -0x4(%ebp),%eax
 585:	0f b6 10             	movzbl (%eax),%edx
 588:	8b 45 f8             	mov    -0x8(%ebp),%eax
 58b:	88 10                	mov    %dl,(%eax)
 58d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 591:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 595:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 599:	0f 9f c0             	setg   %al
 59c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 5a0:	84 c0                	test   %al,%al
 5a2:	75 de                	jne    582 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5a7:	c9                   	leave  
 5a8:	c3                   	ret    
 5a9:	90                   	nop
 5aa:	90                   	nop
 5ab:	90                   	nop

000005ac <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ac:	b8 01 00 00 00       	mov    $0x1,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <exit>:
SYSCALL(exit)
 5b4:	b8 02 00 00 00       	mov    $0x2,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <exit1>:
SYSCALL(exit1) 
 5bc:	b8 16 00 00 00       	mov    $0x16,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <wait1>:
SYSCALL(wait1) 
 5c4:	b8 17 00 00 00       	mov    $0x17,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <wait>:
SYSCALL(wait)
 5cc:	b8 03 00 00 00       	mov    $0x3,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <pipe>:
SYSCALL(pipe)
 5d4:	b8 04 00 00 00       	mov    $0x4,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <read>:
SYSCALL(read)
 5dc:	b8 05 00 00 00       	mov    $0x5,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <write>:
SYSCALL(write)
 5e4:	b8 10 00 00 00       	mov    $0x10,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <close>:
SYSCALL(close)
 5ec:	b8 15 00 00 00       	mov    $0x15,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <kill>:
SYSCALL(kill)
 5f4:	b8 06 00 00 00       	mov    $0x6,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <exec>:
SYSCALL(exec)
 5fc:	b8 07 00 00 00       	mov    $0x7,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <open>:
SYSCALL(open)
 604:	b8 0f 00 00 00       	mov    $0xf,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <mknod>:
SYSCALL(mknod)
 60c:	b8 11 00 00 00       	mov    $0x11,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <unlink>:
SYSCALL(unlink)
 614:	b8 12 00 00 00       	mov    $0x12,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <fstat>:
SYSCALL(fstat)
 61c:	b8 08 00 00 00       	mov    $0x8,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <link>:
SYSCALL(link)
 624:	b8 13 00 00 00       	mov    $0x13,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <mkdir>:
SYSCALL(mkdir)
 62c:	b8 14 00 00 00       	mov    $0x14,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <chdir>:
SYSCALL(chdir)
 634:	b8 09 00 00 00       	mov    $0x9,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <dup>:
SYSCALL(dup)
 63c:	b8 0a 00 00 00       	mov    $0xa,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <getpid>:
SYSCALL(getpid)
 644:	b8 0b 00 00 00       	mov    $0xb,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <sbrk>:
SYSCALL(sbrk)
 64c:	b8 0c 00 00 00       	mov    $0xc,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <sleep>:
SYSCALL(sleep)
 654:	b8 0d 00 00 00       	mov    $0xd,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <uptime>:
SYSCALL(uptime)
 65c:	b8 0e 00 00 00       	mov    $0xe,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <setPriority>:
SYSCALL(setPriority) 
 664:	b8 18 00 00 00       	mov    $0x18,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 66c:	55                   	push   %ebp
 66d:	89 e5                	mov    %esp,%ebp
 66f:	83 ec 28             	sub    $0x28,%esp
 672:	8b 45 0c             	mov    0xc(%ebp),%eax
 675:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 678:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 67f:	00 
 680:	8d 45 f4             	lea    -0xc(%ebp),%eax
 683:	89 44 24 04          	mov    %eax,0x4(%esp)
 687:	8b 45 08             	mov    0x8(%ebp),%eax
 68a:	89 04 24             	mov    %eax,(%esp)
 68d:	e8 52 ff ff ff       	call   5e4 <write>
}
 692:	c9                   	leave  
 693:	c3                   	ret    

00000694 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	53                   	push   %ebx
 698:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 69b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6a2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6a6:	74 17                	je     6bf <printint+0x2b>
 6a8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6ac:	79 11                	jns    6bf <printint+0x2b>
    neg = 1;
 6ae:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b8:	f7 d8                	neg    %eax
 6ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6bd:	eb 06                	jmp    6c5 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 6c5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 6cc:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 6cf:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d5:	ba 00 00 00 00       	mov    $0x0,%edx
 6da:	f7 f3                	div    %ebx
 6dc:	89 d0                	mov    %edx,%eax
 6de:	0f b6 80 4c 0b 00 00 	movzbl 0xb4c(%eax),%eax
 6e5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 6e9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 6ed:	8b 45 10             	mov    0x10(%ebp),%eax
 6f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f6:	ba 00 00 00 00       	mov    $0x0,%edx
 6fb:	f7 75 d4             	divl   -0x2c(%ebp)
 6fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
 701:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 705:	75 c5                	jne    6cc <printint+0x38>
  if(neg)
 707:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 70b:	74 28                	je     735 <printint+0xa1>
    buf[i++] = '-';
 70d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 710:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 715:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 719:	eb 1a                	jmp    735 <printint+0xa1>
    putc(fd, buf[i]);
 71b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 71e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 723:	0f be c0             	movsbl %al,%eax
 726:	89 44 24 04          	mov    %eax,0x4(%esp)
 72a:	8b 45 08             	mov    0x8(%ebp),%eax
 72d:	89 04 24             	mov    %eax,(%esp)
 730:	e8 37 ff ff ff       	call   66c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 735:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 739:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 73d:	79 dc                	jns    71b <printint+0x87>
    putc(fd, buf[i]);
}
 73f:	83 c4 44             	add    $0x44,%esp
 742:	5b                   	pop    %ebx
 743:	5d                   	pop    %ebp
 744:	c3                   	ret    

00000745 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 745:	55                   	push   %ebp
 746:	89 e5                	mov    %esp,%ebp
 748:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 74b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 752:	8d 45 0c             	lea    0xc(%ebp),%eax
 755:	83 c0 04             	add    $0x4,%eax
 758:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 75b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 762:	e9 7e 01 00 00       	jmp    8e5 <printf+0x1a0>
    c = fmt[i] & 0xff;
 767:	8b 55 0c             	mov    0xc(%ebp),%edx
 76a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 76d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 770:	0f b6 00             	movzbl (%eax),%eax
 773:	0f be c0             	movsbl %al,%eax
 776:	25 ff 00 00 00       	and    $0xff,%eax
 77b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 77e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 782:	75 2c                	jne    7b0 <printf+0x6b>
      if(c == '%'){
 784:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 788:	75 0c                	jne    796 <printf+0x51>
        state = '%';
 78a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 791:	e9 4b 01 00 00       	jmp    8e1 <printf+0x19c>
      } else {
        putc(fd, c);
 796:	8b 45 e8             	mov    -0x18(%ebp),%eax
 799:	0f be c0             	movsbl %al,%eax
 79c:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
 7a3:	89 04 24             	mov    %eax,(%esp)
 7a6:	e8 c1 fe ff ff       	call   66c <putc>
 7ab:	e9 31 01 00 00       	jmp    8e1 <printf+0x19c>
      }
    } else if(state == '%'){
 7b0:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 7b4:	0f 85 27 01 00 00    	jne    8e1 <printf+0x19c>
      if(c == 'd'){
 7ba:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 7be:	75 2d                	jne    7ed <printf+0xa8>
        printint(fd, *ap, 10, 1);
 7c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c3:	8b 00                	mov    (%eax),%eax
 7c5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7cc:	00 
 7cd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7d4:	00 
 7d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
 7dc:	89 04 24             	mov    %eax,(%esp)
 7df:	e8 b0 fe ff ff       	call   694 <printint>
        ap++;
 7e4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 7e8:	e9 ed 00 00 00       	jmp    8da <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 7ed:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 7f1:	74 06                	je     7f9 <printf+0xb4>
 7f3:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 7f7:	75 2d                	jne    826 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 7f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fc:	8b 00                	mov    (%eax),%eax
 7fe:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 805:	00 
 806:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 80d:	00 
 80e:	89 44 24 04          	mov    %eax,0x4(%esp)
 812:	8b 45 08             	mov    0x8(%ebp),%eax
 815:	89 04 24             	mov    %eax,(%esp)
 818:	e8 77 fe ff ff       	call   694 <printint>
        ap++;
 81d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 821:	e9 b4 00 00 00       	jmp    8da <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 826:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 82a:	75 46                	jne    872 <printf+0x12d>
        s = (char*)*ap;
 82c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82f:	8b 00                	mov    (%eax),%eax
 831:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 834:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 838:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 83c:	75 27                	jne    865 <printf+0x120>
          s = "(null)";
 83e:	c7 45 e4 42 0b 00 00 	movl   $0xb42,-0x1c(%ebp)
        while(*s != 0){
 845:	eb 1f                	jmp    866 <printf+0x121>
          putc(fd, *s);
 847:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 84a:	0f b6 00             	movzbl (%eax),%eax
 84d:	0f be c0             	movsbl %al,%eax
 850:	89 44 24 04          	mov    %eax,0x4(%esp)
 854:	8b 45 08             	mov    0x8(%ebp),%eax
 857:	89 04 24             	mov    %eax,(%esp)
 85a:	e8 0d fe ff ff       	call   66c <putc>
          s++;
 85f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 863:	eb 01                	jmp    866 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 865:	90                   	nop
 866:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 869:	0f b6 00             	movzbl (%eax),%eax
 86c:	84 c0                	test   %al,%al
 86e:	75 d7                	jne    847 <printf+0x102>
 870:	eb 68                	jmp    8da <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 872:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 876:	75 1d                	jne    895 <printf+0x150>
        putc(fd, *ap);
 878:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87b:	8b 00                	mov    (%eax),%eax
 87d:	0f be c0             	movsbl %al,%eax
 880:	89 44 24 04          	mov    %eax,0x4(%esp)
 884:	8b 45 08             	mov    0x8(%ebp),%eax
 887:	89 04 24             	mov    %eax,(%esp)
 88a:	e8 dd fd ff ff       	call   66c <putc>
        ap++;
 88f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 893:	eb 45                	jmp    8da <printf+0x195>
      } else if(c == '%'){
 895:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 899:	75 17                	jne    8b2 <printf+0x16d>
        putc(fd, c);
 89b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 89e:	0f be c0             	movsbl %al,%eax
 8a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a5:	8b 45 08             	mov    0x8(%ebp),%eax
 8a8:	89 04 24             	mov    %eax,(%esp)
 8ab:	e8 bc fd ff ff       	call   66c <putc>
 8b0:	eb 28                	jmp    8da <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8b2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8b9:	00 
 8ba:	8b 45 08             	mov    0x8(%ebp),%eax
 8bd:	89 04 24             	mov    %eax,(%esp)
 8c0:	e8 a7 fd ff ff       	call   66c <putc>
        putc(fd, c);
 8c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8c8:	0f be c0             	movsbl %al,%eax
 8cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8cf:	8b 45 08             	mov    0x8(%ebp),%eax
 8d2:	89 04 24             	mov    %eax,(%esp)
 8d5:	e8 92 fd ff ff       	call   66c <putc>
      }
      state = 0;
 8da:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8e1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 8e5:	8b 55 0c             	mov    0xc(%ebp),%edx
 8e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8eb:	8d 04 02             	lea    (%edx,%eax,1),%eax
 8ee:	0f b6 00             	movzbl (%eax),%eax
 8f1:	84 c0                	test   %al,%al
 8f3:	0f 85 6e fe ff ff    	jne    767 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8f9:	c9                   	leave  
 8fa:	c3                   	ret    
 8fb:	90                   	nop

000008fc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8fc:	55                   	push   %ebp
 8fd:	89 e5                	mov    %esp,%ebp
 8ff:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 902:	8b 45 08             	mov    0x8(%ebp),%eax
 905:	83 e8 08             	sub    $0x8,%eax
 908:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 90b:	a1 68 0b 00 00       	mov    0xb68,%eax
 910:	89 45 fc             	mov    %eax,-0x4(%ebp)
 913:	eb 24                	jmp    939 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 915:	8b 45 fc             	mov    -0x4(%ebp),%eax
 918:	8b 00                	mov    (%eax),%eax
 91a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 91d:	77 12                	ja     931 <free+0x35>
 91f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 922:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 925:	77 24                	ja     94b <free+0x4f>
 927:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92a:	8b 00                	mov    (%eax),%eax
 92c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 92f:	77 1a                	ja     94b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 931:	8b 45 fc             	mov    -0x4(%ebp),%eax
 934:	8b 00                	mov    (%eax),%eax
 936:	89 45 fc             	mov    %eax,-0x4(%ebp)
 939:	8b 45 f8             	mov    -0x8(%ebp),%eax
 93c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 93f:	76 d4                	jbe    915 <free+0x19>
 941:	8b 45 fc             	mov    -0x4(%ebp),%eax
 944:	8b 00                	mov    (%eax),%eax
 946:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 949:	76 ca                	jbe    915 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 94b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94e:	8b 40 04             	mov    0x4(%eax),%eax
 951:	c1 e0 03             	shl    $0x3,%eax
 954:	89 c2                	mov    %eax,%edx
 956:	03 55 f8             	add    -0x8(%ebp),%edx
 959:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95c:	8b 00                	mov    (%eax),%eax
 95e:	39 c2                	cmp    %eax,%edx
 960:	75 24                	jne    986 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 962:	8b 45 f8             	mov    -0x8(%ebp),%eax
 965:	8b 50 04             	mov    0x4(%eax),%edx
 968:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96b:	8b 00                	mov    (%eax),%eax
 96d:	8b 40 04             	mov    0x4(%eax),%eax
 970:	01 c2                	add    %eax,%edx
 972:	8b 45 f8             	mov    -0x8(%ebp),%eax
 975:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 978:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97b:	8b 00                	mov    (%eax),%eax
 97d:	8b 10                	mov    (%eax),%edx
 97f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 982:	89 10                	mov    %edx,(%eax)
 984:	eb 0a                	jmp    990 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 986:	8b 45 fc             	mov    -0x4(%ebp),%eax
 989:	8b 10                	mov    (%eax),%edx
 98b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 990:	8b 45 fc             	mov    -0x4(%ebp),%eax
 993:	8b 40 04             	mov    0x4(%eax),%eax
 996:	c1 e0 03             	shl    $0x3,%eax
 999:	03 45 fc             	add    -0x4(%ebp),%eax
 99c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 99f:	75 20                	jne    9c1 <free+0xc5>
    p->s.size += bp->s.size;
 9a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a4:	8b 50 04             	mov    0x4(%eax),%edx
 9a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9aa:	8b 40 04             	mov    0x4(%eax),%eax
 9ad:	01 c2                	add    %eax,%edx
 9af:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9b8:	8b 10                	mov    (%eax),%edx
 9ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9bd:	89 10                	mov    %edx,(%eax)
 9bf:	eb 08                	jmp    9c9 <free+0xcd>
  } else
    p->s.ptr = bp;
 9c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9c7:	89 10                	mov    %edx,(%eax)
  freep = p;
 9c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9cc:	a3 68 0b 00 00       	mov    %eax,0xb68
}
 9d1:	c9                   	leave  
 9d2:	c3                   	ret    

000009d3 <morecore>:

static Header*
morecore(uint nu)
{
 9d3:	55                   	push   %ebp
 9d4:	89 e5                	mov    %esp,%ebp
 9d6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9d9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9e0:	77 07                	ja     9e9 <morecore+0x16>
    nu = 4096;
 9e2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9e9:	8b 45 08             	mov    0x8(%ebp),%eax
 9ec:	c1 e0 03             	shl    $0x3,%eax
 9ef:	89 04 24             	mov    %eax,(%esp)
 9f2:	e8 55 fc ff ff       	call   64c <sbrk>
 9f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 9fa:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 9fe:	75 07                	jne    a07 <morecore+0x34>
    return 0;
 a00:	b8 00 00 00 00       	mov    $0x0,%eax
 a05:	eb 22                	jmp    a29 <morecore+0x56>
  hp = (Header*)p;
 a07:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 a0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a10:	8b 55 08             	mov    0x8(%ebp),%edx
 a13:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a16:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a19:	83 c0 08             	add    $0x8,%eax
 a1c:	89 04 24             	mov    %eax,(%esp)
 a1f:	e8 d8 fe ff ff       	call   8fc <free>
  return freep;
 a24:	a1 68 0b 00 00       	mov    0xb68,%eax
}
 a29:	c9                   	leave  
 a2a:	c3                   	ret    

00000a2b <malloc>:

void*
malloc(uint nbytes)
{
 a2b:	55                   	push   %ebp
 a2c:	89 e5                	mov    %esp,%ebp
 a2e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a31:	8b 45 08             	mov    0x8(%ebp),%eax
 a34:	83 c0 07             	add    $0x7,%eax
 a37:	c1 e8 03             	shr    $0x3,%eax
 a3a:	83 c0 01             	add    $0x1,%eax
 a3d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 a40:	a1 68 0b 00 00       	mov    0xb68,%eax
 a45:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a48:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a4c:	75 23                	jne    a71 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a4e:	c7 45 f0 60 0b 00 00 	movl   $0xb60,-0x10(%ebp)
 a55:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a58:	a3 68 0b 00 00       	mov    %eax,0xb68
 a5d:	a1 68 0b 00 00       	mov    0xb68,%eax
 a62:	a3 60 0b 00 00       	mov    %eax,0xb60
    base.s.size = 0;
 a67:	c7 05 64 0b 00 00 00 	movl   $0x0,0xb64
 a6e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a71:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a74:	8b 00                	mov    (%eax),%eax
 a76:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 a79:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a7c:	8b 40 04             	mov    0x4(%eax),%eax
 a7f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 a82:	72 4d                	jb     ad1 <malloc+0xa6>
      if(p->s.size == nunits)
 a84:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a87:	8b 40 04             	mov    0x4(%eax),%eax
 a8a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 a8d:	75 0c                	jne    a9b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a92:	8b 10                	mov    (%eax),%edx
 a94:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a97:	89 10                	mov    %edx,(%eax)
 a99:	eb 26                	jmp    ac1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a9e:	8b 40 04             	mov    0x4(%eax),%eax
 aa1:	89 c2                	mov    %eax,%edx
 aa3:	2b 55 f4             	sub    -0xc(%ebp),%edx
 aa6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aa9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aac:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aaf:	8b 40 04             	mov    0x4(%eax),%eax
 ab2:	c1 e0 03             	shl    $0x3,%eax
 ab5:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 ab8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 abb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 abe:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ac1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac4:	a3 68 0b 00 00       	mov    %eax,0xb68
      return (void*)(p + 1);
 ac9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 acc:	83 c0 08             	add    $0x8,%eax
 acf:	eb 38                	jmp    b09 <malloc+0xde>
    }
    if(p == freep)
 ad1:	a1 68 0b 00 00       	mov    0xb68,%eax
 ad6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 ad9:	75 1b                	jne    af6 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 adb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ade:	89 04 24             	mov    %eax,(%esp)
 ae1:	e8 ed fe ff ff       	call   9d3 <morecore>
 ae6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 ae9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 aed:	75 07                	jne    af6 <malloc+0xcb>
        return 0;
 aef:	b8 00 00 00 00       	mov    $0x0,%eax
 af4:	eb 13                	jmp    b09 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 af9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 afc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aff:	8b 00                	mov    (%eax),%eax
 b01:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b04:	e9 70 ff ff ff       	jmp    a79 <malloc+0x4e>
}
 b09:	c9                   	leave  
 b0a:	c3                   	ret    
