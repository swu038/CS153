
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
       a:	75 05                	jne    11 <runcmd+0x11>
    exit();
       c:	e8 4b 0f 00 00       	call   f5c <exit>
  
  switch(cmd->type){
      11:	8b 45 08             	mov    0x8(%ebp),%eax
      14:	8b 00                	mov    (%eax),%eax
      16:	83 f8 05             	cmp    $0x5,%eax
      19:	77 09                	ja     24 <runcmd+0x24>
      1b:	8b 04 85 e0 14 00 00 	mov    0x14e0(,%eax,4),%eax
      22:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
      24:	c7 04 24 b4 14 00 00 	movl   $0x14b4,(%esp)
      2b:	e8 29 03 00 00       	call   359 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      30:	8b 45 08             	mov    0x8(%ebp),%eax
      33:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(ecmd->argv[0] == 0)
      36:	8b 45 e8             	mov    -0x18(%ebp),%eax
      39:	8b 40 04             	mov    0x4(%eax),%eax
      3c:	85 c0                	test   %eax,%eax
      3e:	75 05                	jne    45 <runcmd+0x45>
      exit();
      40:	e8 17 0f 00 00       	call   f5c <exit>
    exec(ecmd->argv[0], ecmd->argv);
      45:	8b 45 e8             	mov    -0x18(%ebp),%eax
      48:	8d 50 04             	lea    0x4(%eax),%edx
      4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
      4e:	8b 40 04             	mov    0x4(%eax),%eax
      51:	89 54 24 04          	mov    %edx,0x4(%esp)
      55:	89 04 24             	mov    %eax,(%esp)
      58:	e8 3f 0f 00 00       	call   f9c <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      5d:	8b 45 e8             	mov    -0x18(%ebp),%eax
      60:	8b 40 04             	mov    0x4(%eax),%eax
      63:	89 44 24 08          	mov    %eax,0x8(%esp)
      67:	c7 44 24 04 bb 14 00 	movl   $0x14bb,0x4(%esp)
      6e:	00 
      6f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      76:	e8 72 10 00 00       	call   10ed <printf>
    break;
      7b:	e9 83 01 00 00       	jmp    203 <runcmd+0x203>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      80:	8b 45 08             	mov    0x8(%ebp),%eax
      83:	89 45 f4             	mov    %eax,-0xc(%ebp)
    close(rcmd->fd);
      86:	8b 45 f4             	mov    -0xc(%ebp),%eax
      89:	8b 40 14             	mov    0x14(%eax),%eax
      8c:	89 04 24             	mov    %eax,(%esp)
      8f:	e8 f8 0e 00 00       	call   f8c <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      94:	8b 45 f4             	mov    -0xc(%ebp),%eax
      97:	8b 50 10             	mov    0x10(%eax),%edx
      9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
      9d:	8b 40 08             	mov    0x8(%eax),%eax
      a0:	89 54 24 04          	mov    %edx,0x4(%esp)
      a4:	89 04 24             	mov    %eax,(%esp)
      a7:	e8 f8 0e 00 00       	call   fa4 <open>
      ac:	85 c0                	test   %eax,%eax
      ae:	79 23                	jns    d3 <runcmd+0xd3>
      printf(2, "open %s failed\n", rcmd->file);
      b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
      b3:	8b 40 08             	mov    0x8(%eax),%eax
      b6:	89 44 24 08          	mov    %eax,0x8(%esp)
      ba:	c7 44 24 04 cb 14 00 	movl   $0x14cb,0x4(%esp)
      c1:	00 
      c2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      c9:	e8 1f 10 00 00       	call   10ed <printf>
      exit();
      ce:	e8 89 0e 00 00       	call   f5c <exit>
    }
    runcmd(rcmd->cmd);
      d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
      d6:	8b 40 04             	mov    0x4(%eax),%eax
      d9:	89 04 24             	mov    %eax,(%esp)
      dc:	e8 1f ff ff ff       	call   0 <runcmd>
    break;
      e1:	e9 1d 01 00 00       	jmp    203 <runcmd+0x203>

  case LIST:
    lcmd = (struct listcmd*)cmd;
      e6:	8b 45 08             	mov    0x8(%ebp),%eax
      e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
      ec:	e8 8e 02 00 00       	call   37f <fork1>
      f1:	85 c0                	test   %eax,%eax
      f3:	75 0e                	jne    103 <runcmd+0x103>
      runcmd(lcmd->left);
      f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
      f8:	8b 40 04             	mov    0x4(%eax),%eax
      fb:	89 04 24             	mov    %eax,(%esp)
      fe:	e8 fd fe ff ff       	call   0 <runcmd>
    wait();
     103:	e8 64 0e 00 00       	call   f6c <wait>
    runcmd(lcmd->right);
     108:	8b 45 ec             	mov    -0x14(%ebp),%eax
     10b:	8b 40 08             	mov    0x8(%eax),%eax
     10e:	89 04 24             	mov    %eax,(%esp)
     111:	e8 ea fe ff ff       	call   0 <runcmd>
    break;
     116:	e9 e8 00 00 00       	jmp    203 <runcmd+0x203>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     11b:	8b 45 08             	mov    0x8(%ebp),%eax
     11e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pipe(p) < 0)
     121:	8d 45 dc             	lea    -0x24(%ebp),%eax
     124:	89 04 24             	mov    %eax,(%esp)
     127:	e8 48 0e 00 00       	call   f74 <pipe>
     12c:	85 c0                	test   %eax,%eax
     12e:	79 0c                	jns    13c <runcmd+0x13c>
      panic("pipe");
     130:	c7 04 24 db 14 00 00 	movl   $0x14db,(%esp)
     137:	e8 1d 02 00 00       	call   359 <panic>
    if(fork1() == 0){
     13c:	e8 3e 02 00 00       	call   37f <fork1>
     141:	85 c0                	test   %eax,%eax
     143:	75 3b                	jne    180 <runcmd+0x180>
      close(1);
     145:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     14c:	e8 3b 0e 00 00       	call   f8c <close>
      dup(p[1]);
     151:	8b 45 e0             	mov    -0x20(%ebp),%eax
     154:	89 04 24             	mov    %eax,(%esp)
     157:	e8 80 0e 00 00       	call   fdc <dup>
      close(p[0]);
     15c:	8b 45 dc             	mov    -0x24(%ebp),%eax
     15f:	89 04 24             	mov    %eax,(%esp)
     162:	e8 25 0e 00 00       	call   f8c <close>
      close(p[1]);
     167:	8b 45 e0             	mov    -0x20(%ebp),%eax
     16a:	89 04 24             	mov    %eax,(%esp)
     16d:	e8 1a 0e 00 00       	call   f8c <close>
      runcmd(pcmd->left);
     172:	8b 45 f0             	mov    -0x10(%ebp),%eax
     175:	8b 40 04             	mov    0x4(%eax),%eax
     178:	89 04 24             	mov    %eax,(%esp)
     17b:	e8 80 fe ff ff       	call   0 <runcmd>
    }
    if(fork1() == 0){
     180:	e8 fa 01 00 00       	call   37f <fork1>
     185:	85 c0                	test   %eax,%eax
     187:	75 3b                	jne    1c4 <runcmd+0x1c4>
      close(0);
     189:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     190:	e8 f7 0d 00 00       	call   f8c <close>
      dup(p[0]);
     195:	8b 45 dc             	mov    -0x24(%ebp),%eax
     198:	89 04 24             	mov    %eax,(%esp)
     19b:	e8 3c 0e 00 00       	call   fdc <dup>
      close(p[0]);
     1a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1a3:	89 04 24             	mov    %eax,(%esp)
     1a6:	e8 e1 0d 00 00       	call   f8c <close>
      close(p[1]);
     1ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ae:	89 04 24             	mov    %eax,(%esp)
     1b1:	e8 d6 0d 00 00       	call   f8c <close>
      runcmd(pcmd->right);
     1b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     1b9:	8b 40 08             	mov    0x8(%eax),%eax
     1bc:	89 04 24             	mov    %eax,(%esp)
     1bf:	e8 3c fe ff ff       	call   0 <runcmd>
    }
    close(p[0]);
     1c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1c7:	89 04 24             	mov    %eax,(%esp)
     1ca:	e8 bd 0d 00 00       	call   f8c <close>
    close(p[1]);
     1cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1d2:	89 04 24             	mov    %eax,(%esp)
     1d5:	e8 b2 0d 00 00       	call   f8c <close>
    wait();
     1da:	e8 8d 0d 00 00       	call   f6c <wait>
    wait();
     1df:	e8 88 0d 00 00       	call   f6c <wait>
    break;
     1e4:	eb 1d                	jmp    203 <runcmd+0x203>
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
     1e6:	8b 45 08             	mov    0x8(%ebp),%eax
     1e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
     1ec:	e8 8e 01 00 00       	call   37f <fork1>
     1f1:	85 c0                	test   %eax,%eax
     1f3:	75 0e                	jne    203 <runcmd+0x203>
      runcmd(bcmd->cmd);
     1f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     1f8:	8b 40 04             	mov    0x4(%eax),%eax
     1fb:	89 04 24             	mov    %eax,(%esp)
     1fe:	e8 fd fd ff ff       	call   0 <runcmd>
    break;
  }
  exit();
     203:	e8 54 0d 00 00       	call   f5c <exit>

00000208 <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     208:	55                   	push   %ebp
     209:	89 e5                	mov    %esp,%ebp
     20b:	83 ec 18             	sub    $0x18,%esp
  printf(2, "$ ");
     20e:	c7 44 24 04 f8 14 00 	movl   $0x14f8,0x4(%esp)
     215:	00 
     216:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     21d:	e8 cb 0e 00 00       	call   10ed <printf>
  memset(buf, 0, nbuf);
     222:	8b 45 0c             	mov    0xc(%ebp),%eax
     225:	89 44 24 08          	mov    %eax,0x8(%esp)
     229:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     230:	00 
     231:	8b 45 08             	mov    0x8(%ebp),%eax
     234:	89 04 24             	mov    %eax,(%esp)
     237:	e8 7a 0b 00 00       	call   db6 <memset>
  gets(buf, nbuf);
     23c:	8b 45 0c             	mov    0xc(%ebp),%eax
     23f:	89 44 24 04          	mov    %eax,0x4(%esp)
     243:	8b 45 08             	mov    0x8(%ebp),%eax
     246:	89 04 24             	mov    %eax,(%esp)
     249:	e8 bf 0b 00 00       	call   e0d <gets>
  if(buf[0] == 0) // EOF
     24e:	8b 45 08             	mov    0x8(%ebp),%eax
     251:	0f b6 00             	movzbl (%eax),%eax
     254:	84 c0                	test   %al,%al
     256:	75 07                	jne    25f <getcmd+0x57>
    return -1;
     258:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     25d:	eb 05                	jmp    264 <getcmd+0x5c>
  return 0;
     25f:	b8 00 00 00 00       	mov    $0x0,%eax
}
     264:	c9                   	leave  
     265:	c3                   	ret    

00000266 <main>:

int
main(void)
{
     266:	55                   	push   %ebp
     267:	89 e5                	mov    %esp,%ebp
     269:	83 e4 f0             	and    $0xfffffff0,%esp
     26c:	83 ec 20             	sub    $0x20,%esp
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     26f:	eb 19                	jmp    28a <main+0x24>
    if(fd >= 3){
     271:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
     276:	7e 12                	jle    28a <main+0x24>
      close(fd);
     278:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     27c:	89 04 24             	mov    %eax,(%esp)
     27f:	e8 08 0d 00 00       	call   f8c <close>
      break;
     284:	90                   	nop
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     285:	e9 ae 00 00 00       	jmp    338 <main+0xd2>
{
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     28a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     291:	00 
     292:	c7 04 24 fb 14 00 00 	movl   $0x14fb,(%esp)
     299:	e8 06 0d 00 00       	call   fa4 <open>
     29e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     2a2:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
     2a7:	79 c8                	jns    271 <main+0xb>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     2a9:	e9 8a 00 00 00       	jmp    338 <main+0xd2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     2ae:	0f b6 05 e0 15 00 00 	movzbl 0x15e0,%eax
     2b5:	3c 63                	cmp    $0x63,%al
     2b7:	75 5a                	jne    313 <main+0xad>
     2b9:	0f b6 05 e1 15 00 00 	movzbl 0x15e1,%eax
     2c0:	3c 64                	cmp    $0x64,%al
     2c2:	75 4f                	jne    313 <main+0xad>
     2c4:	0f b6 05 e2 15 00 00 	movzbl 0x15e2,%eax
     2cb:	3c 20                	cmp    $0x20,%al
     2cd:	75 44                	jne    313 <main+0xad>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     2cf:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
     2d6:	e8 b6 0a 00 00       	call   d91 <strlen>
     2db:	83 e8 01             	sub    $0x1,%eax
     2de:	c6 80 e0 15 00 00 00 	movb   $0x0,0x15e0(%eax)
      if(chdir(buf+3) < 0)
     2e5:	c7 04 24 e3 15 00 00 	movl   $0x15e3,(%esp)
     2ec:	e8 e3 0c 00 00       	call   fd4 <chdir>
     2f1:	85 c0                	test   %eax,%eax
     2f3:	79 42                	jns    337 <main+0xd1>
        printf(2, "cannot cd %s\n", buf+3);
     2f5:	c7 44 24 08 e3 15 00 	movl   $0x15e3,0x8(%esp)
     2fc:	00 
     2fd:	c7 44 24 04 03 15 00 	movl   $0x1503,0x4(%esp)
     304:	00 
     305:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     30c:	e8 dc 0d 00 00       	call   10ed <printf>
      continue;
     311:	eb 25                	jmp    338 <main+0xd2>
    }
    if(fork1() == 0)
     313:	e8 67 00 00 00       	call   37f <fork1>
     318:	85 c0                	test   %eax,%eax
     31a:	75 14                	jne    330 <main+0xca>
      runcmd(parsecmd(buf));
     31c:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
     323:	e8 c6 03 00 00       	call   6ee <parsecmd>
     328:	89 04 24             	mov    %eax,(%esp)
     32b:	e8 d0 fc ff ff       	call   0 <runcmd>
    wait();
     330:	e8 37 0c 00 00       	call   f6c <wait>
     335:	eb 01                	jmp    338 <main+0xd2>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
     337:	90                   	nop
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     338:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
     33f:	00 
     340:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
     347:	e8 bc fe ff ff       	call   208 <getcmd>
     34c:	85 c0                	test   %eax,%eax
     34e:	0f 89 5a ff ff ff    	jns    2ae <main+0x48>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
     354:	e8 03 0c 00 00       	call   f5c <exit>

00000359 <panic>:
}

void
panic(char *s)
{
     359:	55                   	push   %ebp
     35a:	89 e5                	mov    %esp,%ebp
     35c:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     35f:	8b 45 08             	mov    0x8(%ebp),%eax
     362:	89 44 24 08          	mov    %eax,0x8(%esp)
     366:	c7 44 24 04 11 15 00 	movl   $0x1511,0x4(%esp)
     36d:	00 
     36e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     375:	e8 73 0d 00 00       	call   10ed <printf>
  exit();
     37a:	e8 dd 0b 00 00       	call   f5c <exit>

0000037f <fork1>:
}

int
fork1(void)
{
     37f:	55                   	push   %ebp
     380:	89 e5                	mov    %esp,%ebp
     382:	83 ec 28             	sub    $0x28,%esp
  int pid;
  
  pid = fork();
     385:	e8 ca 0b 00 00       	call   f54 <fork>
     38a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
     38d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     391:	75 0c                	jne    39f <fork1+0x20>
    panic("fork");
     393:	c7 04 24 15 15 00 00 	movl   $0x1515,(%esp)
     39a:	e8 ba ff ff ff       	call   359 <panic>
  return pid;
     39f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3a2:	c9                   	leave  
     3a3:	c3                   	ret    

000003a4 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3a4:	55                   	push   %ebp
     3a5:	89 e5                	mov    %esp,%ebp
     3a7:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3aa:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     3b1:	e8 1d 10 00 00       	call   13d3 <malloc>
     3b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3b9:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     3c0:	00 
     3c1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3c8:	00 
     3c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3cc:	89 04 24             	mov    %eax,(%esp)
     3cf:	e8 e2 09 00 00       	call   db6 <memset>
  cmd->type = EXEC;
     3d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3d7:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     3dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3e0:	c9                   	leave  
     3e1:	c3                   	ret    

000003e2 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3e2:	55                   	push   %ebp
     3e3:	89 e5                	mov    %esp,%ebp
     3e5:	83 ec 28             	sub    $0x28,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e8:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     3ef:	e8 df 0f 00 00       	call   13d3 <malloc>
     3f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3f7:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     3fe:	00 
     3ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     406:	00 
     407:	8b 45 f4             	mov    -0xc(%ebp),%eax
     40a:	89 04 24             	mov    %eax,(%esp)
     40d:	e8 a4 09 00 00       	call   db6 <memset>
  cmd->type = REDIR;
     412:	8b 45 f4             	mov    -0xc(%ebp),%eax
     415:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     41b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     41e:	8b 55 08             	mov    0x8(%ebp),%edx
     421:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     424:	8b 45 f4             	mov    -0xc(%ebp),%eax
     427:	8b 55 0c             	mov    0xc(%ebp),%edx
     42a:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     42d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     430:	8b 55 10             	mov    0x10(%ebp),%edx
     433:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     436:	8b 45 f4             	mov    -0xc(%ebp),%eax
     439:	8b 55 14             	mov    0x14(%ebp),%edx
     43c:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     43f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     442:	8b 55 18             	mov    0x18(%ebp),%edx
     445:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     448:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     44b:	c9                   	leave  
     44c:	c3                   	ret    

0000044d <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     44d:	55                   	push   %ebp
     44e:	89 e5                	mov    %esp,%ebp
     450:	83 ec 28             	sub    $0x28,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     453:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     45a:	e8 74 0f 00 00       	call   13d3 <malloc>
     45f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     462:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     469:	00 
     46a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     471:	00 
     472:	8b 45 f4             	mov    -0xc(%ebp),%eax
     475:	89 04 24             	mov    %eax,(%esp)
     478:	e8 39 09 00 00       	call   db6 <memset>
  cmd->type = PIPE;
     47d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     480:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     486:	8b 45 f4             	mov    -0xc(%ebp),%eax
     489:	8b 55 08             	mov    0x8(%ebp),%edx
     48c:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     48f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     492:	8b 55 0c             	mov    0xc(%ebp),%edx
     495:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     498:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     49b:	c9                   	leave  
     49c:	c3                   	ret    

0000049d <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     49d:	55                   	push   %ebp
     49e:	89 e5                	mov    %esp,%ebp
     4a0:	83 ec 28             	sub    $0x28,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4a3:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     4aa:	e8 24 0f 00 00       	call   13d3 <malloc>
     4af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     4b2:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     4b9:	00 
     4ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4c1:	00 
     4c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4c5:	89 04 24             	mov    %eax,(%esp)
     4c8:	e8 e9 08 00 00       	call   db6 <memset>
  cmd->type = LIST;
     4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4d0:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     4d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4d9:	8b 55 08             	mov    0x8(%ebp),%edx
     4dc:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     4df:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4e2:	8b 55 0c             	mov    0xc(%ebp),%edx
     4e5:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     4e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     4eb:	c9                   	leave  
     4ec:	c3                   	ret    

000004ed <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4ed:	55                   	push   %ebp
     4ee:	89 e5                	mov    %esp,%ebp
     4f0:	83 ec 28             	sub    $0x28,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4f3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     4fa:	e8 d4 0e 00 00       	call   13d3 <malloc>
     4ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     502:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     509:	00 
     50a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     511:	00 
     512:	8b 45 f4             	mov    -0xc(%ebp),%eax
     515:	89 04 24             	mov    %eax,(%esp)
     518:	e8 99 08 00 00       	call   db6 <memset>
  cmd->type = BACK;
     51d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     520:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     526:	8b 45 f4             	mov    -0xc(%ebp),%eax
     529:	8b 55 08             	mov    0x8(%ebp),%edx
     52c:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     52f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     532:	c9                   	leave  
     533:	c3                   	ret    

00000534 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     534:	55                   	push   %ebp
     535:	89 e5                	mov    %esp,%ebp
     537:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int ret;
  
  s = *ps;
     53a:	8b 45 08             	mov    0x8(%ebp),%eax
     53d:	8b 00                	mov    (%eax),%eax
     53f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(s < es && strchr(whitespace, *s))
     542:	eb 04                	jmp    548 <gettoken+0x14>
    s++;
     544:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     548:	8b 45 f0             	mov    -0x10(%ebp),%eax
     54b:	3b 45 0c             	cmp    0xc(%ebp),%eax
     54e:	73 1d                	jae    56d <gettoken+0x39>
     550:	8b 45 f0             	mov    -0x10(%ebp),%eax
     553:	0f b6 00             	movzbl (%eax),%eax
     556:	0f be c0             	movsbl %al,%eax
     559:	89 44 24 04          	mov    %eax,0x4(%esp)
     55d:	c7 04 24 ac 15 00 00 	movl   $0x15ac,(%esp)
     564:	e8 71 08 00 00       	call   dda <strchr>
     569:	85 c0                	test   %eax,%eax
     56b:	75 d7                	jne    544 <gettoken+0x10>
    s++;
  if(q)
     56d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     571:	74 08                	je     57b <gettoken+0x47>
    *q = s;
     573:	8b 45 10             	mov    0x10(%ebp),%eax
     576:	8b 55 f0             	mov    -0x10(%ebp),%edx
     579:	89 10                	mov    %edx,(%eax)
  ret = *s;
     57b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     57e:	0f b6 00             	movzbl (%eax),%eax
     581:	0f be c0             	movsbl %al,%eax
     584:	89 45 f4             	mov    %eax,-0xc(%ebp)
  switch(*s){
     587:	8b 45 f0             	mov    -0x10(%ebp),%eax
     58a:	0f b6 00             	movzbl (%eax),%eax
     58d:	0f be c0             	movsbl %al,%eax
     590:	83 f8 3c             	cmp    $0x3c,%eax
     593:	7f 1e                	jg     5b3 <gettoken+0x7f>
     595:	83 f8 3b             	cmp    $0x3b,%eax
     598:	7d 23                	jge    5bd <gettoken+0x89>
     59a:	83 f8 29             	cmp    $0x29,%eax
     59d:	7f 3f                	jg     5de <gettoken+0xaa>
     59f:	83 f8 28             	cmp    $0x28,%eax
     5a2:	7d 19                	jge    5bd <gettoken+0x89>
     5a4:	85 c0                	test   %eax,%eax
     5a6:	0f 84 83 00 00 00    	je     62f <gettoken+0xfb>
     5ac:	83 f8 26             	cmp    $0x26,%eax
     5af:	74 0c                	je     5bd <gettoken+0x89>
     5b1:	eb 2b                	jmp    5de <gettoken+0xaa>
     5b3:	83 f8 3e             	cmp    $0x3e,%eax
     5b6:	74 0b                	je     5c3 <gettoken+0x8f>
     5b8:	83 f8 7c             	cmp    $0x7c,%eax
     5bb:	75 21                	jne    5de <gettoken+0xaa>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     5bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    break;
     5c1:	eb 70                	jmp    633 <gettoken+0xff>
  case '>':
    s++;
     5c3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(*s == '>'){
     5c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5ca:	0f b6 00             	movzbl (%eax),%eax
     5cd:	3c 3e                	cmp    $0x3e,%al
     5cf:	75 61                	jne    632 <gettoken+0xfe>
      ret = '+';
     5d1:	c7 45 f4 2b 00 00 00 	movl   $0x2b,-0xc(%ebp)
      s++;
     5d8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    }
    break;
     5dc:	eb 55                	jmp    633 <gettoken+0xff>
  default:
    ret = 'a';
     5de:	c7 45 f4 61 00 00 00 	movl   $0x61,-0xc(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5e5:	eb 04                	jmp    5eb <gettoken+0xb7>
      s++;
     5e7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5ee:	3b 45 0c             	cmp    0xc(%ebp),%eax
     5f1:	73 40                	jae    633 <gettoken+0xff>
     5f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5f6:	0f b6 00             	movzbl (%eax),%eax
     5f9:	0f be c0             	movsbl %al,%eax
     5fc:	89 44 24 04          	mov    %eax,0x4(%esp)
     600:	c7 04 24 ac 15 00 00 	movl   $0x15ac,(%esp)
     607:	e8 ce 07 00 00       	call   dda <strchr>
     60c:	85 c0                	test   %eax,%eax
     60e:	75 23                	jne    633 <gettoken+0xff>
     610:	8b 45 f0             	mov    -0x10(%ebp),%eax
     613:	0f b6 00             	movzbl (%eax),%eax
     616:	0f be c0             	movsbl %al,%eax
     619:	89 44 24 04          	mov    %eax,0x4(%esp)
     61d:	c7 04 24 b2 15 00 00 	movl   $0x15b2,(%esp)
     624:	e8 b1 07 00 00       	call   dda <strchr>
     629:	85 c0                	test   %eax,%eax
     62b:	74 ba                	je     5e7 <gettoken+0xb3>
     62d:	eb 04                	jmp    633 <gettoken+0xff>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
     62f:	90                   	nop
     630:	eb 01                	jmp    633 <gettoken+0xff>
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
     632:	90                   	nop
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     633:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     637:	74 0e                	je     647 <gettoken+0x113>
    *eq = s;
     639:	8b 45 14             	mov    0x14(%ebp),%eax
     63c:	8b 55 f0             	mov    -0x10(%ebp),%edx
     63f:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
     641:	eb 04                	jmp    647 <gettoken+0x113>
    s++;
     643:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
     647:	8b 45 f0             	mov    -0x10(%ebp),%eax
     64a:	3b 45 0c             	cmp    0xc(%ebp),%eax
     64d:	73 1d                	jae    66c <gettoken+0x138>
     64f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     652:	0f b6 00             	movzbl (%eax),%eax
     655:	0f be c0             	movsbl %al,%eax
     658:	89 44 24 04          	mov    %eax,0x4(%esp)
     65c:	c7 04 24 ac 15 00 00 	movl   $0x15ac,(%esp)
     663:	e8 72 07 00 00       	call   dda <strchr>
     668:	85 c0                	test   %eax,%eax
     66a:	75 d7                	jne    643 <gettoken+0x10f>
    s++;
  *ps = s;
     66c:	8b 45 08             	mov    0x8(%ebp),%eax
     66f:	8b 55 f0             	mov    -0x10(%ebp),%edx
     672:	89 10                	mov    %edx,(%eax)
  return ret;
     674:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     677:	c9                   	leave  
     678:	c3                   	ret    

00000679 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     679:	55                   	push   %ebp
     67a:	89 e5                	mov    %esp,%ebp
     67c:	83 ec 28             	sub    $0x28,%esp
  char *s;
  
  s = *ps;
     67f:	8b 45 08             	mov    0x8(%ebp),%eax
     682:	8b 00                	mov    (%eax),%eax
     684:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     687:	eb 04                	jmp    68d <peek+0x14>
    s++;
     689:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     68d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     690:	3b 45 0c             	cmp    0xc(%ebp),%eax
     693:	73 1d                	jae    6b2 <peek+0x39>
     695:	8b 45 f4             	mov    -0xc(%ebp),%eax
     698:	0f b6 00             	movzbl (%eax),%eax
     69b:	0f be c0             	movsbl %al,%eax
     69e:	89 44 24 04          	mov    %eax,0x4(%esp)
     6a2:	c7 04 24 ac 15 00 00 	movl   $0x15ac,(%esp)
     6a9:	e8 2c 07 00 00       	call   dda <strchr>
     6ae:	85 c0                	test   %eax,%eax
     6b0:	75 d7                	jne    689 <peek+0x10>
    s++;
  *ps = s;
     6b2:	8b 45 08             	mov    0x8(%ebp),%eax
     6b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
     6b8:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
     6ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6bd:	0f b6 00             	movzbl (%eax),%eax
     6c0:	84 c0                	test   %al,%al
     6c2:	74 23                	je     6e7 <peek+0x6e>
     6c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6c7:	0f b6 00             	movzbl (%eax),%eax
     6ca:	0f be c0             	movsbl %al,%eax
     6cd:	89 44 24 04          	mov    %eax,0x4(%esp)
     6d1:	8b 45 10             	mov    0x10(%ebp),%eax
     6d4:	89 04 24             	mov    %eax,(%esp)
     6d7:	e8 fe 06 00 00       	call   dda <strchr>
     6dc:	85 c0                	test   %eax,%eax
     6de:	74 07                	je     6e7 <peek+0x6e>
     6e0:	b8 01 00 00 00       	mov    $0x1,%eax
     6e5:	eb 05                	jmp    6ec <peek+0x73>
     6e7:	b8 00 00 00 00       	mov    $0x0,%eax
}
     6ec:	c9                   	leave  
     6ed:	c3                   	ret    

000006ee <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     6ee:	55                   	push   %ebp
     6ef:	89 e5                	mov    %esp,%ebp
     6f1:	53                   	push   %ebx
     6f2:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     6f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
     6f8:	8b 45 08             	mov    0x8(%ebp),%eax
     6fb:	89 04 24             	mov    %eax,(%esp)
     6fe:	e8 8e 06 00 00       	call   d91 <strlen>
     703:	8d 04 03             	lea    (%ebx,%eax,1),%eax
     706:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = parseline(&s, es);
     709:	8b 45 f0             	mov    -0x10(%ebp),%eax
     70c:	89 44 24 04          	mov    %eax,0x4(%esp)
     710:	8d 45 08             	lea    0x8(%ebp),%eax
     713:	89 04 24             	mov    %eax,(%esp)
     716:	e8 60 00 00 00       	call   77b <parseline>
     71b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  peek(&s, es, "");
     71e:	c7 44 24 08 1a 15 00 	movl   $0x151a,0x8(%esp)
     725:	00 
     726:	8b 45 f0             	mov    -0x10(%ebp),%eax
     729:	89 44 24 04          	mov    %eax,0x4(%esp)
     72d:	8d 45 08             	lea    0x8(%ebp),%eax
     730:	89 04 24             	mov    %eax,(%esp)
     733:	e8 41 ff ff ff       	call   679 <peek>
  if(s != es){
     738:	8b 45 08             	mov    0x8(%ebp),%eax
     73b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     73e:	74 27                	je     767 <parsecmd+0x79>
    printf(2, "leftovers: %s\n", s);
     740:	8b 45 08             	mov    0x8(%ebp),%eax
     743:	89 44 24 08          	mov    %eax,0x8(%esp)
     747:	c7 44 24 04 1b 15 00 	movl   $0x151b,0x4(%esp)
     74e:	00 
     74f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     756:	e8 92 09 00 00       	call   10ed <printf>
    panic("syntax");
     75b:	c7 04 24 2a 15 00 00 	movl   $0x152a,(%esp)
     762:	e8 f2 fb ff ff       	call   359 <panic>
  }
  nulterminate(cmd);
     767:	8b 45 f4             	mov    -0xc(%ebp),%eax
     76a:	89 04 24             	mov    %eax,(%esp)
     76d:	e8 a4 04 00 00       	call   c16 <nulterminate>
  return cmd;
     772:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     775:	83 c4 24             	add    $0x24,%esp
     778:	5b                   	pop    %ebx
     779:	5d                   	pop    %ebp
     77a:	c3                   	ret    

0000077b <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     77b:	55                   	push   %ebp
     77c:	89 e5                	mov    %esp,%ebp
     77e:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     781:	8b 45 0c             	mov    0xc(%ebp),%eax
     784:	89 44 24 04          	mov    %eax,0x4(%esp)
     788:	8b 45 08             	mov    0x8(%ebp),%eax
     78b:	89 04 24             	mov    %eax,(%esp)
     78e:	e8 bc 00 00 00       	call   84f <parsepipe>
     793:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     796:	eb 30                	jmp    7c8 <parseline+0x4d>
    gettoken(ps, es, 0, 0);
     798:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     79f:	00 
     7a0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     7a7:	00 
     7a8:	8b 45 0c             	mov    0xc(%ebp),%eax
     7ab:	89 44 24 04          	mov    %eax,0x4(%esp)
     7af:	8b 45 08             	mov    0x8(%ebp),%eax
     7b2:	89 04 24             	mov    %eax,(%esp)
     7b5:	e8 7a fd ff ff       	call   534 <gettoken>
    cmd = backcmd(cmd);
     7ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7bd:	89 04 24             	mov    %eax,(%esp)
     7c0:	e8 28 fd ff ff       	call   4ed <backcmd>
     7c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     7c8:	c7 44 24 08 31 15 00 	movl   $0x1531,0x8(%esp)
     7cf:	00 
     7d0:	8b 45 0c             	mov    0xc(%ebp),%eax
     7d3:	89 44 24 04          	mov    %eax,0x4(%esp)
     7d7:	8b 45 08             	mov    0x8(%ebp),%eax
     7da:	89 04 24             	mov    %eax,(%esp)
     7dd:	e8 97 fe ff ff       	call   679 <peek>
     7e2:	85 c0                	test   %eax,%eax
     7e4:	75 b2                	jne    798 <parseline+0x1d>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     7e6:	c7 44 24 08 33 15 00 	movl   $0x1533,0x8(%esp)
     7ed:	00 
     7ee:	8b 45 0c             	mov    0xc(%ebp),%eax
     7f1:	89 44 24 04          	mov    %eax,0x4(%esp)
     7f5:	8b 45 08             	mov    0x8(%ebp),%eax
     7f8:	89 04 24             	mov    %eax,(%esp)
     7fb:	e8 79 fe ff ff       	call   679 <peek>
     800:	85 c0                	test   %eax,%eax
     802:	74 46                	je     84a <parseline+0xcf>
    gettoken(ps, es, 0, 0);
     804:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     80b:	00 
     80c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     813:	00 
     814:	8b 45 0c             	mov    0xc(%ebp),%eax
     817:	89 44 24 04          	mov    %eax,0x4(%esp)
     81b:	8b 45 08             	mov    0x8(%ebp),%eax
     81e:	89 04 24             	mov    %eax,(%esp)
     821:	e8 0e fd ff ff       	call   534 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     826:	8b 45 0c             	mov    0xc(%ebp),%eax
     829:	89 44 24 04          	mov    %eax,0x4(%esp)
     82d:	8b 45 08             	mov    0x8(%ebp),%eax
     830:	89 04 24             	mov    %eax,(%esp)
     833:	e8 43 ff ff ff       	call   77b <parseline>
     838:	89 44 24 04          	mov    %eax,0x4(%esp)
     83c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     83f:	89 04 24             	mov    %eax,(%esp)
     842:	e8 56 fc ff ff       	call   49d <listcmd>
     847:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     84a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     84d:	c9                   	leave  
     84e:	c3                   	ret    

0000084f <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     84f:	55                   	push   %ebp
     850:	89 e5                	mov    %esp,%ebp
     852:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     855:	8b 45 0c             	mov    0xc(%ebp),%eax
     858:	89 44 24 04          	mov    %eax,0x4(%esp)
     85c:	8b 45 08             	mov    0x8(%ebp),%eax
     85f:	89 04 24             	mov    %eax,(%esp)
     862:	e8 67 02 00 00       	call   ace <parseexec>
     867:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
     86a:	c7 44 24 08 35 15 00 	movl   $0x1535,0x8(%esp)
     871:	00 
     872:	8b 45 0c             	mov    0xc(%ebp),%eax
     875:	89 44 24 04          	mov    %eax,0x4(%esp)
     879:	8b 45 08             	mov    0x8(%ebp),%eax
     87c:	89 04 24             	mov    %eax,(%esp)
     87f:	e8 f5 fd ff ff       	call   679 <peek>
     884:	85 c0                	test   %eax,%eax
     886:	74 46                	je     8ce <parsepipe+0x7f>
    gettoken(ps, es, 0, 0);
     888:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     88f:	00 
     890:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     897:	00 
     898:	8b 45 0c             	mov    0xc(%ebp),%eax
     89b:	89 44 24 04          	mov    %eax,0x4(%esp)
     89f:	8b 45 08             	mov    0x8(%ebp),%eax
     8a2:	89 04 24             	mov    %eax,(%esp)
     8a5:	e8 8a fc ff ff       	call   534 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8aa:	8b 45 0c             	mov    0xc(%ebp),%eax
     8ad:	89 44 24 04          	mov    %eax,0x4(%esp)
     8b1:	8b 45 08             	mov    0x8(%ebp),%eax
     8b4:	89 04 24             	mov    %eax,(%esp)
     8b7:	e8 93 ff ff ff       	call   84f <parsepipe>
     8bc:	89 44 24 04          	mov    %eax,0x4(%esp)
     8c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8c3:	89 04 24             	mov    %eax,(%esp)
     8c6:	e8 82 fb ff ff       	call   44d <pipecmd>
     8cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     8ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     8d1:	c9                   	leave  
     8d2:	c3                   	ret    

000008d3 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     8d3:	55                   	push   %ebp
     8d4:	89 e5                	mov    %esp,%ebp
     8d6:	83 ec 38             	sub    $0x38,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     8d9:	e9 f5 00 00 00       	jmp    9d3 <parseredirs+0x100>
    tok = gettoken(ps, es, 0, 0);
     8de:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8e5:	00 
     8e6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8ed:	00 
     8ee:	8b 45 10             	mov    0x10(%ebp),%eax
     8f1:	89 44 24 04          	mov    %eax,0x4(%esp)
     8f5:	8b 45 0c             	mov    0xc(%ebp),%eax
     8f8:	89 04 24             	mov    %eax,(%esp)
     8fb:	e8 34 fc ff ff       	call   534 <gettoken>
     900:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
     903:	8d 45 ec             	lea    -0x14(%ebp),%eax
     906:	89 44 24 0c          	mov    %eax,0xc(%esp)
     90a:	8d 45 f0             	lea    -0x10(%ebp),%eax
     90d:	89 44 24 08          	mov    %eax,0x8(%esp)
     911:	8b 45 10             	mov    0x10(%ebp),%eax
     914:	89 44 24 04          	mov    %eax,0x4(%esp)
     918:	8b 45 0c             	mov    0xc(%ebp),%eax
     91b:	89 04 24             	mov    %eax,(%esp)
     91e:	e8 11 fc ff ff       	call   534 <gettoken>
     923:	83 f8 61             	cmp    $0x61,%eax
     926:	74 0c                	je     934 <parseredirs+0x61>
      panic("missing file for redirection");
     928:	c7 04 24 37 15 00 00 	movl   $0x1537,(%esp)
     92f:	e8 25 fa ff ff       	call   359 <panic>
    switch(tok){
     934:	8b 45 f4             	mov    -0xc(%ebp),%eax
     937:	83 f8 3c             	cmp    $0x3c,%eax
     93a:	74 0f                	je     94b <parseredirs+0x78>
     93c:	83 f8 3e             	cmp    $0x3e,%eax
     93f:	74 38                	je     979 <parseredirs+0xa6>
     941:	83 f8 2b             	cmp    $0x2b,%eax
     944:	74 61                	je     9a7 <parseredirs+0xd4>
     946:	e9 88 00 00 00       	jmp    9d3 <parseredirs+0x100>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     94b:	8b 55 ec             	mov    -0x14(%ebp),%edx
     94e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     951:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     958:	00 
     959:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     960:	00 
     961:	89 54 24 08          	mov    %edx,0x8(%esp)
     965:	89 44 24 04          	mov    %eax,0x4(%esp)
     969:	8b 45 08             	mov    0x8(%ebp),%eax
     96c:	89 04 24             	mov    %eax,(%esp)
     96f:	e8 6e fa ff ff       	call   3e2 <redircmd>
     974:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     977:	eb 5a                	jmp    9d3 <parseredirs+0x100>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     979:	8b 55 ec             	mov    -0x14(%ebp),%edx
     97c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     97f:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     986:	00 
     987:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     98e:	00 
     98f:	89 54 24 08          	mov    %edx,0x8(%esp)
     993:	89 44 24 04          	mov    %eax,0x4(%esp)
     997:	8b 45 08             	mov    0x8(%ebp),%eax
     99a:	89 04 24             	mov    %eax,(%esp)
     99d:	e8 40 fa ff ff       	call   3e2 <redircmd>
     9a2:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9a5:	eb 2c                	jmp    9d3 <parseredirs+0x100>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9a7:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9ad:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     9b4:	00 
     9b5:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     9bc:	00 
     9bd:	89 54 24 08          	mov    %edx,0x8(%esp)
     9c1:	89 44 24 04          	mov    %eax,0x4(%esp)
     9c5:	8b 45 08             	mov    0x8(%ebp),%eax
     9c8:	89 04 24             	mov    %eax,(%esp)
     9cb:	e8 12 fa ff ff       	call   3e2 <redircmd>
     9d0:	89 45 08             	mov    %eax,0x8(%ebp)
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     9d3:	c7 44 24 08 54 15 00 	movl   $0x1554,0x8(%esp)
     9da:	00 
     9db:	8b 45 10             	mov    0x10(%ebp),%eax
     9de:	89 44 24 04          	mov    %eax,0x4(%esp)
     9e2:	8b 45 0c             	mov    0xc(%ebp),%eax
     9e5:	89 04 24             	mov    %eax,(%esp)
     9e8:	e8 8c fc ff ff       	call   679 <peek>
     9ed:	85 c0                	test   %eax,%eax
     9ef:	0f 85 e9 fe ff ff    	jne    8de <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
     9f5:	8b 45 08             	mov    0x8(%ebp),%eax
}
     9f8:	c9                   	leave  
     9f9:	c3                   	ret    

000009fa <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     9fa:	55                   	push   %ebp
     9fb:	89 e5                	mov    %esp,%ebp
     9fd:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     a00:	c7 44 24 08 57 15 00 	movl   $0x1557,0x8(%esp)
     a07:	00 
     a08:	8b 45 0c             	mov    0xc(%ebp),%eax
     a0b:	89 44 24 04          	mov    %eax,0x4(%esp)
     a0f:	8b 45 08             	mov    0x8(%ebp),%eax
     a12:	89 04 24             	mov    %eax,(%esp)
     a15:	e8 5f fc ff ff       	call   679 <peek>
     a1a:	85 c0                	test   %eax,%eax
     a1c:	75 0c                	jne    a2a <parseblock+0x30>
    panic("parseblock");
     a1e:	c7 04 24 59 15 00 00 	movl   $0x1559,(%esp)
     a25:	e8 2f f9 ff ff       	call   359 <panic>
  gettoken(ps, es, 0, 0);
     a2a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a31:	00 
     a32:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a39:	00 
     a3a:	8b 45 0c             	mov    0xc(%ebp),%eax
     a3d:	89 44 24 04          	mov    %eax,0x4(%esp)
     a41:	8b 45 08             	mov    0x8(%ebp),%eax
     a44:	89 04 24             	mov    %eax,(%esp)
     a47:	e8 e8 fa ff ff       	call   534 <gettoken>
  cmd = parseline(ps, es);
     a4c:	8b 45 0c             	mov    0xc(%ebp),%eax
     a4f:	89 44 24 04          	mov    %eax,0x4(%esp)
     a53:	8b 45 08             	mov    0x8(%ebp),%eax
     a56:	89 04 24             	mov    %eax,(%esp)
     a59:	e8 1d fd ff ff       	call   77b <parseline>
     a5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
     a61:	c7 44 24 08 64 15 00 	movl   $0x1564,0x8(%esp)
     a68:	00 
     a69:	8b 45 0c             	mov    0xc(%ebp),%eax
     a6c:	89 44 24 04          	mov    %eax,0x4(%esp)
     a70:	8b 45 08             	mov    0x8(%ebp),%eax
     a73:	89 04 24             	mov    %eax,(%esp)
     a76:	e8 fe fb ff ff       	call   679 <peek>
     a7b:	85 c0                	test   %eax,%eax
     a7d:	75 0c                	jne    a8b <parseblock+0x91>
    panic("syntax - missing )");
     a7f:	c7 04 24 66 15 00 00 	movl   $0x1566,(%esp)
     a86:	e8 ce f8 ff ff       	call   359 <panic>
  gettoken(ps, es, 0, 0);
     a8b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a92:	00 
     a93:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a9a:	00 
     a9b:	8b 45 0c             	mov    0xc(%ebp),%eax
     a9e:	89 44 24 04          	mov    %eax,0x4(%esp)
     aa2:	8b 45 08             	mov    0x8(%ebp),%eax
     aa5:	89 04 24             	mov    %eax,(%esp)
     aa8:	e8 87 fa ff ff       	call   534 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     aad:	8b 45 0c             	mov    0xc(%ebp),%eax
     ab0:	89 44 24 08          	mov    %eax,0x8(%esp)
     ab4:	8b 45 08             	mov    0x8(%ebp),%eax
     ab7:	89 44 24 04          	mov    %eax,0x4(%esp)
     abb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     abe:	89 04 24             	mov    %eax,(%esp)
     ac1:	e8 0d fe ff ff       	call   8d3 <parseredirs>
     ac6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
     ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     acc:	c9                   	leave  
     acd:	c3                   	ret    

00000ace <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     ace:	55                   	push   %ebp
     acf:	89 e5                	mov    %esp,%ebp
     ad1:	83 ec 38             	sub    $0x38,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     ad4:	c7 44 24 08 57 15 00 	movl   $0x1557,0x8(%esp)
     adb:	00 
     adc:	8b 45 0c             	mov    0xc(%ebp),%eax
     adf:	89 44 24 04          	mov    %eax,0x4(%esp)
     ae3:	8b 45 08             	mov    0x8(%ebp),%eax
     ae6:	89 04 24             	mov    %eax,(%esp)
     ae9:	e8 8b fb ff ff       	call   679 <peek>
     aee:	85 c0                	test   %eax,%eax
     af0:	74 17                	je     b09 <parseexec+0x3b>
    return parseblock(ps, es);
     af2:	8b 45 0c             	mov    0xc(%ebp),%eax
     af5:	89 44 24 04          	mov    %eax,0x4(%esp)
     af9:	8b 45 08             	mov    0x8(%ebp),%eax
     afc:	89 04 24             	mov    %eax,(%esp)
     aff:	e8 f6 fe ff ff       	call   9fa <parseblock>
     b04:	e9 0b 01 00 00       	jmp    c14 <parseexec+0x146>

  ret = execcmd();
     b09:	e8 96 f8 ff ff       	call   3a4 <execcmd>
     b0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = (struct execcmd*)ret;
     b11:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b14:	89 45 f0             	mov    %eax,-0x10(%ebp)

  argc = 0;
     b17:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ret = parseredirs(ret, ps, es);
     b1e:	8b 45 0c             	mov    0xc(%ebp),%eax
     b21:	89 44 24 08          	mov    %eax,0x8(%esp)
     b25:	8b 45 08             	mov    0x8(%ebp),%eax
     b28:	89 44 24 04          	mov    %eax,0x4(%esp)
     b2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b2f:	89 04 24             	mov    %eax,(%esp)
     b32:	e8 9c fd ff ff       	call   8d3 <parseredirs>
     b37:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(!peek(ps, es, "|)&;")){
     b3a:	e9 8e 00 00 00       	jmp    bcd <parseexec+0xff>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b3f:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b42:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b46:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     b49:	89 44 24 08          	mov    %eax,0x8(%esp)
     b4d:	8b 45 0c             	mov    0xc(%ebp),%eax
     b50:	89 44 24 04          	mov    %eax,0x4(%esp)
     b54:	8b 45 08             	mov    0x8(%ebp),%eax
     b57:	89 04 24             	mov    %eax,(%esp)
     b5a:	e8 d5 f9 ff ff       	call   534 <gettoken>
     b5f:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b62:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     b66:	0f 84 85 00 00 00    	je     bf1 <parseexec+0x123>
      break;
    if(tok != 'a')
     b6c:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
     b70:	74 0c                	je     b7e <parseexec+0xb0>
      panic("syntax");
     b72:	c7 04 24 2a 15 00 00 	movl   $0x152a,(%esp)
     b79:	e8 db f7 ff ff       	call   359 <panic>
    cmd->argv[argc] = q;
     b7e:	8b 55 ec             	mov    -0x14(%ebp),%edx
     b81:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     b84:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b87:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
     b8b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
     b8e:	8b 55 e0             	mov    -0x20(%ebp),%edx
     b91:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b94:	83 c1 08             	add    $0x8,%ecx
     b97:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
     b9b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    if(argc >= MAXARGS)
     b9f:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
     ba3:	7e 0c                	jle    bb1 <parseexec+0xe3>
      panic("too many args");
     ba5:	c7 04 24 79 15 00 00 	movl   $0x1579,(%esp)
     bac:	e8 a8 f7 ff ff       	call   359 <panic>
    ret = parseredirs(ret, ps, es);
     bb1:	8b 45 0c             	mov    0xc(%ebp),%eax
     bb4:	89 44 24 08          	mov    %eax,0x8(%esp)
     bb8:	8b 45 08             	mov    0x8(%ebp),%eax
     bbb:	89 44 24 04          	mov    %eax,0x4(%esp)
     bbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bc2:	89 04 24             	mov    %eax,(%esp)
     bc5:	e8 09 fd ff ff       	call   8d3 <parseredirs>
     bca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     bcd:	c7 44 24 08 87 15 00 	movl   $0x1587,0x8(%esp)
     bd4:	00 
     bd5:	8b 45 0c             	mov    0xc(%ebp),%eax
     bd8:	89 44 24 04          	mov    %eax,0x4(%esp)
     bdc:	8b 45 08             	mov    0x8(%ebp),%eax
     bdf:	89 04 24             	mov    %eax,(%esp)
     be2:	e8 92 fa ff ff       	call   679 <peek>
     be7:	85 c0                	test   %eax,%eax
     be9:	0f 84 50 ff ff ff    	je     b3f <parseexec+0x71>
     bef:	eb 01                	jmp    bf2 <parseexec+0x124>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
     bf1:	90                   	nop
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     bf2:	8b 55 ec             	mov    -0x14(%ebp),%edx
     bf5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bf8:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
     bff:	00 
  cmd->eargv[argc] = 0;
     c00:	8b 55 ec             	mov    -0x14(%ebp),%edx
     c03:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c06:	83 c2 08             	add    $0x8,%edx
     c09:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
     c10:	00 
  return ret;
     c11:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     c14:	c9                   	leave  
     c15:	c3                   	ret    

00000c16 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c16:	55                   	push   %ebp
     c17:	89 e5                	mov    %esp,%ebp
     c19:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c1c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     c20:	75 0a                	jne    c2c <nulterminate+0x16>
    return 0;
     c22:	b8 00 00 00 00       	mov    $0x0,%eax
     c27:	e9 c8 00 00 00       	jmp    cf4 <nulterminate+0xde>
  
  switch(cmd->type){
     c2c:	8b 45 08             	mov    0x8(%ebp),%eax
     c2f:	8b 00                	mov    (%eax),%eax
     c31:	83 f8 05             	cmp    $0x5,%eax
     c34:	0f 87 b7 00 00 00    	ja     cf1 <nulterminate+0xdb>
     c3a:	8b 04 85 8c 15 00 00 	mov    0x158c(,%eax,4),%eax
     c41:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     c43:	8b 45 08             	mov    0x8(%ebp),%eax
     c46:	89 45 e8             	mov    %eax,-0x18(%ebp)
    for(i=0; ecmd->argv[i]; i++)
     c49:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
     c50:	eb 14                	jmp    c66 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
     c52:	8b 55 e0             	mov    -0x20(%ebp),%edx
     c55:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c58:	83 c2 08             	add    $0x8,%edx
     c5b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
     c5f:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     c62:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
     c66:	8b 55 e0             	mov    -0x20(%ebp),%edx
     c69:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c6c:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
     c70:	85 c0                	test   %eax,%eax
     c72:	75 de                	jne    c52 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
     c74:	eb 7b                	jmp    cf1 <nulterminate+0xdb>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     c76:	8b 45 08             	mov    0x8(%ebp),%eax
     c79:	89 45 f4             	mov    %eax,-0xc(%ebp)
    nulterminate(rcmd->cmd);
     c7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c7f:	8b 40 04             	mov    0x4(%eax),%eax
     c82:	89 04 24             	mov    %eax,(%esp)
     c85:	e8 8c ff ff ff       	call   c16 <nulterminate>
    *rcmd->efile = 0;
     c8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c8d:	8b 40 0c             	mov    0xc(%eax),%eax
     c90:	c6 00 00             	movb   $0x0,(%eax)
    break;
     c93:	eb 5c                	jmp    cf1 <nulterminate+0xdb>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     c95:	8b 45 08             	mov    0x8(%ebp),%eax
     c98:	89 45 f0             	mov    %eax,-0x10(%ebp)
    nulterminate(pcmd->left);
     c9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c9e:	8b 40 04             	mov    0x4(%eax),%eax
     ca1:	89 04 24             	mov    %eax,(%esp)
     ca4:	e8 6d ff ff ff       	call   c16 <nulterminate>
    nulterminate(pcmd->right);
     ca9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cac:	8b 40 08             	mov    0x8(%eax),%eax
     caf:	89 04 24             	mov    %eax,(%esp)
     cb2:	e8 5f ff ff ff       	call   c16 <nulterminate>
    break;
     cb7:	eb 38                	jmp    cf1 <nulterminate+0xdb>
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
     cb9:	8b 45 08             	mov    0x8(%ebp),%eax
     cbc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(lcmd->left);
     cbf:	8b 45 ec             	mov    -0x14(%ebp),%eax
     cc2:	8b 40 04             	mov    0x4(%eax),%eax
     cc5:	89 04 24             	mov    %eax,(%esp)
     cc8:	e8 49 ff ff ff       	call   c16 <nulterminate>
    nulterminate(lcmd->right);
     ccd:	8b 45 ec             	mov    -0x14(%ebp),%eax
     cd0:	8b 40 08             	mov    0x8(%eax),%eax
     cd3:	89 04 24             	mov    %eax,(%esp)
     cd6:	e8 3b ff ff ff       	call   c16 <nulterminate>
    break;
     cdb:	eb 14                	jmp    cf1 <nulterminate+0xdb>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     cdd:	8b 45 08             	mov    0x8(%ebp),%eax
     ce0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(bcmd->cmd);
     ce3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ce6:	8b 40 04             	mov    0x4(%eax),%eax
     ce9:	89 04 24             	mov    %eax,(%esp)
     cec:	e8 25 ff ff ff       	call   c16 <nulterminate>
    break;
  }
  return cmd;
     cf1:	8b 45 08             	mov    0x8(%ebp),%eax
}
     cf4:	c9                   	leave  
     cf5:	c3                   	ret    
     cf6:	90                   	nop
     cf7:	90                   	nop

00000cf8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     cf8:	55                   	push   %ebp
     cf9:	89 e5                	mov    %esp,%ebp
     cfb:	57                   	push   %edi
     cfc:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     cfd:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d00:	8b 55 10             	mov    0x10(%ebp),%edx
     d03:	8b 45 0c             	mov    0xc(%ebp),%eax
     d06:	89 cb                	mov    %ecx,%ebx
     d08:	89 df                	mov    %ebx,%edi
     d0a:	89 d1                	mov    %edx,%ecx
     d0c:	fc                   	cld    
     d0d:	f3 aa                	rep stos %al,%es:(%edi)
     d0f:	89 ca                	mov    %ecx,%edx
     d11:	89 fb                	mov    %edi,%ebx
     d13:	89 5d 08             	mov    %ebx,0x8(%ebp)
     d16:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     d19:	5b                   	pop    %ebx
     d1a:	5f                   	pop    %edi
     d1b:	5d                   	pop    %ebp
     d1c:	c3                   	ret    

00000d1d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     d1d:	55                   	push   %ebp
     d1e:	89 e5                	mov    %esp,%ebp
     d20:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     d23:	8b 45 08             	mov    0x8(%ebp),%eax
     d26:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     d29:	8b 45 0c             	mov    0xc(%ebp),%eax
     d2c:	0f b6 10             	movzbl (%eax),%edx
     d2f:	8b 45 08             	mov    0x8(%ebp),%eax
     d32:	88 10                	mov    %dl,(%eax)
     d34:	8b 45 08             	mov    0x8(%ebp),%eax
     d37:	0f b6 00             	movzbl (%eax),%eax
     d3a:	84 c0                	test   %al,%al
     d3c:	0f 95 c0             	setne  %al
     d3f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     d43:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
     d47:	84 c0                	test   %al,%al
     d49:	75 de                	jne    d29 <strcpy+0xc>
    ;
  return os;
     d4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     d4e:	c9                   	leave  
     d4f:	c3                   	ret    

00000d50 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d50:	55                   	push   %ebp
     d51:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     d53:	eb 08                	jmp    d5d <strcmp+0xd>
    p++, q++;
     d55:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     d59:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     d5d:	8b 45 08             	mov    0x8(%ebp),%eax
     d60:	0f b6 00             	movzbl (%eax),%eax
     d63:	84 c0                	test   %al,%al
     d65:	74 10                	je     d77 <strcmp+0x27>
     d67:	8b 45 08             	mov    0x8(%ebp),%eax
     d6a:	0f b6 10             	movzbl (%eax),%edx
     d6d:	8b 45 0c             	mov    0xc(%ebp),%eax
     d70:	0f b6 00             	movzbl (%eax),%eax
     d73:	38 c2                	cmp    %al,%dl
     d75:	74 de                	je     d55 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     d77:	8b 45 08             	mov    0x8(%ebp),%eax
     d7a:	0f b6 00             	movzbl (%eax),%eax
     d7d:	0f b6 d0             	movzbl %al,%edx
     d80:	8b 45 0c             	mov    0xc(%ebp),%eax
     d83:	0f b6 00             	movzbl (%eax),%eax
     d86:	0f b6 c0             	movzbl %al,%eax
     d89:	89 d1                	mov    %edx,%ecx
     d8b:	29 c1                	sub    %eax,%ecx
     d8d:	89 c8                	mov    %ecx,%eax
}
     d8f:	5d                   	pop    %ebp
     d90:	c3                   	ret    

00000d91 <strlen>:

uint
strlen(char *s)
{
     d91:	55                   	push   %ebp
     d92:	89 e5                	mov    %esp,%ebp
     d94:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     d97:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     d9e:	eb 04                	jmp    da4 <strlen+0x13>
     da0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     da4:	8b 45 fc             	mov    -0x4(%ebp),%eax
     da7:	03 45 08             	add    0x8(%ebp),%eax
     daa:	0f b6 00             	movzbl (%eax),%eax
     dad:	84 c0                	test   %al,%al
     daf:	75 ef                	jne    da0 <strlen+0xf>
    ;
  return n;
     db1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     db4:	c9                   	leave  
     db5:	c3                   	ret    

00000db6 <memset>:

void*
memset(void *dst, int c, uint n)
{
     db6:	55                   	push   %ebp
     db7:	89 e5                	mov    %esp,%ebp
     db9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     dbc:	8b 45 10             	mov    0x10(%ebp),%eax
     dbf:	89 44 24 08          	mov    %eax,0x8(%esp)
     dc3:	8b 45 0c             	mov    0xc(%ebp),%eax
     dc6:	89 44 24 04          	mov    %eax,0x4(%esp)
     dca:	8b 45 08             	mov    0x8(%ebp),%eax
     dcd:	89 04 24             	mov    %eax,(%esp)
     dd0:	e8 23 ff ff ff       	call   cf8 <stosb>
  return dst;
     dd5:	8b 45 08             	mov    0x8(%ebp),%eax
}
     dd8:	c9                   	leave  
     dd9:	c3                   	ret    

00000dda <strchr>:

char*
strchr(const char *s, char c)
{
     dda:	55                   	push   %ebp
     ddb:	89 e5                	mov    %esp,%ebp
     ddd:	83 ec 04             	sub    $0x4,%esp
     de0:	8b 45 0c             	mov    0xc(%ebp),%eax
     de3:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     de6:	eb 14                	jmp    dfc <strchr+0x22>
    if(*s == c)
     de8:	8b 45 08             	mov    0x8(%ebp),%eax
     deb:	0f b6 00             	movzbl (%eax),%eax
     dee:	3a 45 fc             	cmp    -0x4(%ebp),%al
     df1:	75 05                	jne    df8 <strchr+0x1e>
      return (char*)s;
     df3:	8b 45 08             	mov    0x8(%ebp),%eax
     df6:	eb 13                	jmp    e0b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     df8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     dfc:	8b 45 08             	mov    0x8(%ebp),%eax
     dff:	0f b6 00             	movzbl (%eax),%eax
     e02:	84 c0                	test   %al,%al
     e04:	75 e2                	jne    de8 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     e06:	b8 00 00 00 00       	mov    $0x0,%eax
}
     e0b:	c9                   	leave  
     e0c:	c3                   	ret    

00000e0d <gets>:

char*
gets(char *buf, int max)
{
     e0d:	55                   	push   %ebp
     e0e:	89 e5                	mov    %esp,%ebp
     e10:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e13:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     e1a:	eb 44                	jmp    e60 <gets+0x53>
    cc = read(0, &c, 1);
     e1c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e23:	00 
     e24:	8d 45 ef             	lea    -0x11(%ebp),%eax
     e27:	89 44 24 04          	mov    %eax,0x4(%esp)
     e2b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e32:	e8 45 01 00 00       	call   f7c <read>
     e37:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
     e3a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e3e:	7e 2d                	jle    e6d <gets+0x60>
      break;
    buf[i++] = c;
     e40:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e43:	03 45 08             	add    0x8(%ebp),%eax
     e46:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
     e4a:	88 10                	mov    %dl,(%eax)
     e4c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
     e50:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e54:	3c 0a                	cmp    $0xa,%al
     e56:	74 16                	je     e6e <gets+0x61>
     e58:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e5c:	3c 0d                	cmp    $0xd,%al
     e5e:	74 0e                	je     e6e <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e60:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e63:	83 c0 01             	add    $0x1,%eax
     e66:	3b 45 0c             	cmp    0xc(%ebp),%eax
     e69:	7c b1                	jl     e1c <gets+0xf>
     e6b:	eb 01                	jmp    e6e <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
     e6d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     e6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e71:	03 45 08             	add    0x8(%ebp),%eax
     e74:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     e77:	8b 45 08             	mov    0x8(%ebp),%eax
}
     e7a:	c9                   	leave  
     e7b:	c3                   	ret    

00000e7c <stat>:

int
stat(char *n, struct stat *st)
{
     e7c:	55                   	push   %ebp
     e7d:	89 e5                	mov    %esp,%ebp
     e7f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     e82:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     e89:	00 
     e8a:	8b 45 08             	mov    0x8(%ebp),%eax
     e8d:	89 04 24             	mov    %eax,(%esp)
     e90:	e8 0f 01 00 00       	call   fa4 <open>
     e95:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
     e98:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     e9c:	79 07                	jns    ea5 <stat+0x29>
    return -1;
     e9e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     ea3:	eb 23                	jmp    ec8 <stat+0x4c>
  r = fstat(fd, st);
     ea5:	8b 45 0c             	mov    0xc(%ebp),%eax
     ea8:	89 44 24 04          	mov    %eax,0x4(%esp)
     eac:	8b 45 f0             	mov    -0x10(%ebp),%eax
     eaf:	89 04 24             	mov    %eax,(%esp)
     eb2:	e8 05 01 00 00       	call   fbc <fstat>
     eb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
     eba:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ebd:	89 04 24             	mov    %eax,(%esp)
     ec0:	e8 c7 00 00 00       	call   f8c <close>
  return r;
     ec5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ec8:	c9                   	leave  
     ec9:	c3                   	ret    

00000eca <atoi>:

int
atoi(const char *s)
{
     eca:	55                   	push   %ebp
     ecb:	89 e5                	mov    %esp,%ebp
     ecd:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     ed0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     ed7:	eb 24                	jmp    efd <atoi+0x33>
    n = n*10 + *s++ - '0';
     ed9:	8b 55 fc             	mov    -0x4(%ebp),%edx
     edc:	89 d0                	mov    %edx,%eax
     ede:	c1 e0 02             	shl    $0x2,%eax
     ee1:	01 d0                	add    %edx,%eax
     ee3:	01 c0                	add    %eax,%eax
     ee5:	89 c2                	mov    %eax,%edx
     ee7:	8b 45 08             	mov    0x8(%ebp),%eax
     eea:	0f b6 00             	movzbl (%eax),%eax
     eed:	0f be c0             	movsbl %al,%eax
     ef0:	8d 04 02             	lea    (%edx,%eax,1),%eax
     ef3:	83 e8 30             	sub    $0x30,%eax
     ef6:	89 45 fc             	mov    %eax,-0x4(%ebp)
     ef9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     efd:	8b 45 08             	mov    0x8(%ebp),%eax
     f00:	0f b6 00             	movzbl (%eax),%eax
     f03:	3c 2f                	cmp    $0x2f,%al
     f05:	7e 0a                	jle    f11 <atoi+0x47>
     f07:	8b 45 08             	mov    0x8(%ebp),%eax
     f0a:	0f b6 00             	movzbl (%eax),%eax
     f0d:	3c 39                	cmp    $0x39,%al
     f0f:	7e c8                	jle    ed9 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     f11:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f14:	c9                   	leave  
     f15:	c3                   	ret    

00000f16 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     f16:	55                   	push   %ebp
     f17:	89 e5                	mov    %esp,%ebp
     f19:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     f1c:	8b 45 08             	mov    0x8(%ebp),%eax
     f1f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
     f22:	8b 45 0c             	mov    0xc(%ebp),%eax
     f25:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
     f28:	eb 13                	jmp    f3d <memmove+0x27>
    *dst++ = *src++;
     f2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f2d:	0f b6 10             	movzbl (%eax),%edx
     f30:	8b 45 f8             	mov    -0x8(%ebp),%eax
     f33:	88 10                	mov    %dl,(%eax)
     f35:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
     f39:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f3d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     f41:	0f 9f c0             	setg   %al
     f44:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
     f48:	84 c0                	test   %al,%al
     f4a:	75 de                	jne    f2a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     f4c:	8b 45 08             	mov    0x8(%ebp),%eax
}
     f4f:	c9                   	leave  
     f50:	c3                   	ret    
     f51:	90                   	nop
     f52:	90                   	nop
     f53:	90                   	nop

00000f54 <fork>:
     f54:	b8 01 00 00 00       	mov    $0x1,%eax
     f59:	cd 40                	int    $0x40
     f5b:	c3                   	ret    

00000f5c <exit>:
     f5c:	b8 02 00 00 00       	mov    $0x2,%eax
     f61:	cd 40                	int    $0x40
     f63:	c3                   	ret    

00000f64 <exit1>:
     f64:	b8 16 00 00 00       	mov    $0x16,%eax
     f69:	cd 40                	int    $0x40
     f6b:	c3                   	ret    

00000f6c <wait>:
     f6c:	b8 03 00 00 00       	mov    $0x3,%eax
     f71:	cd 40                	int    $0x40
     f73:	c3                   	ret    

00000f74 <pipe>:
     f74:	b8 04 00 00 00       	mov    $0x4,%eax
     f79:	cd 40                	int    $0x40
     f7b:	c3                   	ret    

00000f7c <read>:
     f7c:	b8 05 00 00 00       	mov    $0x5,%eax
     f81:	cd 40                	int    $0x40
     f83:	c3                   	ret    

00000f84 <write>:
     f84:	b8 10 00 00 00       	mov    $0x10,%eax
     f89:	cd 40                	int    $0x40
     f8b:	c3                   	ret    

00000f8c <close>:
     f8c:	b8 15 00 00 00       	mov    $0x15,%eax
     f91:	cd 40                	int    $0x40
     f93:	c3                   	ret    

00000f94 <kill>:
     f94:	b8 06 00 00 00       	mov    $0x6,%eax
     f99:	cd 40                	int    $0x40
     f9b:	c3                   	ret    

00000f9c <exec>:
     f9c:	b8 07 00 00 00       	mov    $0x7,%eax
     fa1:	cd 40                	int    $0x40
     fa3:	c3                   	ret    

00000fa4 <open>:
     fa4:	b8 0f 00 00 00       	mov    $0xf,%eax
     fa9:	cd 40                	int    $0x40
     fab:	c3                   	ret    

00000fac <mknod>:
     fac:	b8 11 00 00 00       	mov    $0x11,%eax
     fb1:	cd 40                	int    $0x40
     fb3:	c3                   	ret    

00000fb4 <unlink>:
     fb4:	b8 12 00 00 00       	mov    $0x12,%eax
     fb9:	cd 40                	int    $0x40
     fbb:	c3                   	ret    

00000fbc <fstat>:
     fbc:	b8 08 00 00 00       	mov    $0x8,%eax
     fc1:	cd 40                	int    $0x40
     fc3:	c3                   	ret    

00000fc4 <link>:
     fc4:	b8 13 00 00 00       	mov    $0x13,%eax
     fc9:	cd 40                	int    $0x40
     fcb:	c3                   	ret    

00000fcc <mkdir>:
     fcc:	b8 14 00 00 00       	mov    $0x14,%eax
     fd1:	cd 40                	int    $0x40
     fd3:	c3                   	ret    

00000fd4 <chdir>:
     fd4:	b8 09 00 00 00       	mov    $0x9,%eax
     fd9:	cd 40                	int    $0x40
     fdb:	c3                   	ret    

00000fdc <dup>:
     fdc:	b8 0a 00 00 00       	mov    $0xa,%eax
     fe1:	cd 40                	int    $0x40
     fe3:	c3                   	ret    

00000fe4 <getpid>:
     fe4:	b8 0b 00 00 00       	mov    $0xb,%eax
     fe9:	cd 40                	int    $0x40
     feb:	c3                   	ret    

00000fec <sbrk>:
     fec:	b8 0c 00 00 00       	mov    $0xc,%eax
     ff1:	cd 40                	int    $0x40
     ff3:	c3                   	ret    

00000ff4 <sleep>:
     ff4:	b8 0d 00 00 00       	mov    $0xd,%eax
     ff9:	cd 40                	int    $0x40
     ffb:	c3                   	ret    

00000ffc <uptime>:
     ffc:	b8 0e 00 00 00       	mov    $0xe,%eax
    1001:	cd 40                	int    $0x40
    1003:	c3                   	ret    

00001004 <waitpid>:
    1004:	b8 18 00 00 00       	mov    $0x18,%eax
    1009:	cd 40                	int    $0x40
    100b:	c3                   	ret    

0000100c <wait1>:
    100c:	b8 17 00 00 00       	mov    $0x17,%eax
    1011:	cd 40                	int    $0x40
    1013:	c3                   	ret    

00001014 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1014:	55                   	push   %ebp
    1015:	89 e5                	mov    %esp,%ebp
    1017:	83 ec 28             	sub    $0x28,%esp
    101a:	8b 45 0c             	mov    0xc(%ebp),%eax
    101d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1020:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1027:	00 
    1028:	8d 45 f4             	lea    -0xc(%ebp),%eax
    102b:	89 44 24 04          	mov    %eax,0x4(%esp)
    102f:	8b 45 08             	mov    0x8(%ebp),%eax
    1032:	89 04 24             	mov    %eax,(%esp)
    1035:	e8 4a ff ff ff       	call   f84 <write>
}
    103a:	c9                   	leave  
    103b:	c3                   	ret    

0000103c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    103c:	55                   	push   %ebp
    103d:	89 e5                	mov    %esp,%ebp
    103f:	53                   	push   %ebx
    1040:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1043:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    104a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    104e:	74 17                	je     1067 <printint+0x2b>
    1050:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1054:	79 11                	jns    1067 <printint+0x2b>
    neg = 1;
    1056:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    105d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1060:	f7 d8                	neg    %eax
    1062:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1065:	eb 06                	jmp    106d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    1067:	8b 45 0c             	mov    0xc(%ebp),%eax
    106a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    106d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    1074:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1077:	8b 5d 10             	mov    0x10(%ebp),%ebx
    107a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    107d:	ba 00 00 00 00       	mov    $0x0,%edx
    1082:	f7 f3                	div    %ebx
    1084:	89 d0                	mov    %edx,%eax
    1086:	0f b6 80 bc 15 00 00 	movzbl 0x15bc(%eax),%eax
    108d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    1091:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    1095:	8b 45 10             	mov    0x10(%ebp),%eax
    1098:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    109b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    109e:	ba 00 00 00 00       	mov    $0x0,%edx
    10a3:	f7 75 d4             	divl   -0x2c(%ebp)
    10a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    10a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    10ad:	75 c5                	jne    1074 <printint+0x38>
  if(neg)
    10af:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10b3:	74 28                	je     10dd <printint+0xa1>
    buf[i++] = '-';
    10b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10b8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    10bd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    10c1:	eb 1a                	jmp    10dd <printint+0xa1>
    putc(fd, buf[i]);
    10c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10c6:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    10cb:	0f be c0             	movsbl %al,%eax
    10ce:	89 44 24 04          	mov    %eax,0x4(%esp)
    10d2:	8b 45 08             	mov    0x8(%ebp),%eax
    10d5:	89 04 24             	mov    %eax,(%esp)
    10d8:	e8 37 ff ff ff       	call   1014 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    10dd:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    10e1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    10e5:	79 dc                	jns    10c3 <printint+0x87>
    putc(fd, buf[i]);
}
    10e7:	83 c4 44             	add    $0x44,%esp
    10ea:	5b                   	pop    %ebx
    10eb:	5d                   	pop    %ebp
    10ec:	c3                   	ret    

000010ed <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    10ed:	55                   	push   %ebp
    10ee:	89 e5                	mov    %esp,%ebp
    10f0:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    10f3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    10fa:	8d 45 0c             	lea    0xc(%ebp),%eax
    10fd:	83 c0 04             	add    $0x4,%eax
    1100:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    1103:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    110a:	e9 7e 01 00 00       	jmp    128d <printf+0x1a0>
    c = fmt[i] & 0xff;
    110f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1112:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1115:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1118:	0f b6 00             	movzbl (%eax),%eax
    111b:	0f be c0             	movsbl %al,%eax
    111e:	25 ff 00 00 00       	and    $0xff,%eax
    1123:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    1126:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    112a:	75 2c                	jne    1158 <printf+0x6b>
      if(c == '%'){
    112c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1130:	75 0c                	jne    113e <printf+0x51>
        state = '%';
    1132:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    1139:	e9 4b 01 00 00       	jmp    1289 <printf+0x19c>
      } else {
        putc(fd, c);
    113e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1141:	0f be c0             	movsbl %al,%eax
    1144:	89 44 24 04          	mov    %eax,0x4(%esp)
    1148:	8b 45 08             	mov    0x8(%ebp),%eax
    114b:	89 04 24             	mov    %eax,(%esp)
    114e:	e8 c1 fe ff ff       	call   1014 <putc>
    1153:	e9 31 01 00 00       	jmp    1289 <printf+0x19c>
      }
    } else if(state == '%'){
    1158:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    115c:	0f 85 27 01 00 00    	jne    1289 <printf+0x19c>
      if(c == 'd'){
    1162:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    1166:	75 2d                	jne    1195 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    1168:	8b 45 f4             	mov    -0xc(%ebp),%eax
    116b:	8b 00                	mov    (%eax),%eax
    116d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1174:	00 
    1175:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    117c:	00 
    117d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1181:	8b 45 08             	mov    0x8(%ebp),%eax
    1184:	89 04 24             	mov    %eax,(%esp)
    1187:	e8 b0 fe ff ff       	call   103c <printint>
        ap++;
    118c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    1190:	e9 ed 00 00 00       	jmp    1282 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    1195:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    1199:	74 06                	je     11a1 <printf+0xb4>
    119b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    119f:	75 2d                	jne    11ce <printf+0xe1>
        printint(fd, *ap, 16, 0);
    11a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11a4:	8b 00                	mov    (%eax),%eax
    11a6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    11ad:	00 
    11ae:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    11b5:	00 
    11b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    11ba:	8b 45 08             	mov    0x8(%ebp),%eax
    11bd:	89 04 24             	mov    %eax,(%esp)
    11c0:	e8 77 fe ff ff       	call   103c <printint>
        ap++;
    11c5:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    11c9:	e9 b4 00 00 00       	jmp    1282 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    11ce:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    11d2:	75 46                	jne    121a <printf+0x12d>
        s = (char*)*ap;
    11d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11d7:	8b 00                	mov    (%eax),%eax
    11d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    11dc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    11e0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    11e4:	75 27                	jne    120d <printf+0x120>
          s = "(null)";
    11e6:	c7 45 e4 a4 15 00 00 	movl   $0x15a4,-0x1c(%ebp)
        while(*s != 0){
    11ed:	eb 1f                	jmp    120e <printf+0x121>
          putc(fd, *s);
    11ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11f2:	0f b6 00             	movzbl (%eax),%eax
    11f5:	0f be c0             	movsbl %al,%eax
    11f8:	89 44 24 04          	mov    %eax,0x4(%esp)
    11fc:	8b 45 08             	mov    0x8(%ebp),%eax
    11ff:	89 04 24             	mov    %eax,(%esp)
    1202:	e8 0d fe ff ff       	call   1014 <putc>
          s++;
    1207:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    120b:	eb 01                	jmp    120e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    120d:	90                   	nop
    120e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1211:	0f b6 00             	movzbl (%eax),%eax
    1214:	84 c0                	test   %al,%al
    1216:	75 d7                	jne    11ef <printf+0x102>
    1218:	eb 68                	jmp    1282 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    121a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    121e:	75 1d                	jne    123d <printf+0x150>
        putc(fd, *ap);
    1220:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1223:	8b 00                	mov    (%eax),%eax
    1225:	0f be c0             	movsbl %al,%eax
    1228:	89 44 24 04          	mov    %eax,0x4(%esp)
    122c:	8b 45 08             	mov    0x8(%ebp),%eax
    122f:	89 04 24             	mov    %eax,(%esp)
    1232:	e8 dd fd ff ff       	call   1014 <putc>
        ap++;
    1237:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    123b:	eb 45                	jmp    1282 <printf+0x195>
      } else if(c == '%'){
    123d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    1241:	75 17                	jne    125a <printf+0x16d>
        putc(fd, c);
    1243:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1246:	0f be c0             	movsbl %al,%eax
    1249:	89 44 24 04          	mov    %eax,0x4(%esp)
    124d:	8b 45 08             	mov    0x8(%ebp),%eax
    1250:	89 04 24             	mov    %eax,(%esp)
    1253:	e8 bc fd ff ff       	call   1014 <putc>
    1258:	eb 28                	jmp    1282 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    125a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    1261:	00 
    1262:	8b 45 08             	mov    0x8(%ebp),%eax
    1265:	89 04 24             	mov    %eax,(%esp)
    1268:	e8 a7 fd ff ff       	call   1014 <putc>
        putc(fd, c);
    126d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1270:	0f be c0             	movsbl %al,%eax
    1273:	89 44 24 04          	mov    %eax,0x4(%esp)
    1277:	8b 45 08             	mov    0x8(%ebp),%eax
    127a:	89 04 24             	mov    %eax,(%esp)
    127d:	e8 92 fd ff ff       	call   1014 <putc>
      }
      state = 0;
    1282:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1289:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    128d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1290:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1293:	8d 04 02             	lea    (%edx,%eax,1),%eax
    1296:	0f b6 00             	movzbl (%eax),%eax
    1299:	84 c0                	test   %al,%al
    129b:	0f 85 6e fe ff ff    	jne    110f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    12a1:	c9                   	leave  
    12a2:	c3                   	ret    
    12a3:	90                   	nop

000012a4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12a4:	55                   	push   %ebp
    12a5:	89 e5                	mov    %esp,%ebp
    12a7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    12aa:	8b 45 08             	mov    0x8(%ebp),%eax
    12ad:	83 e8 08             	sub    $0x8,%eax
    12b0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12b3:	a1 4c 16 00 00       	mov    0x164c,%eax
    12b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12bb:	eb 24                	jmp    12e1 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    12bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12c0:	8b 00                	mov    (%eax),%eax
    12c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    12c5:	77 12                	ja     12d9 <free+0x35>
    12c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12ca:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    12cd:	77 24                	ja     12f3 <free+0x4f>
    12cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12d2:	8b 00                	mov    (%eax),%eax
    12d4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    12d7:	77 1a                	ja     12f3 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12dc:	8b 00                	mov    (%eax),%eax
    12de:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12e4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    12e7:	76 d4                	jbe    12bd <free+0x19>
    12e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    12ec:	8b 00                	mov    (%eax),%eax
    12ee:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    12f1:	76 ca                	jbe    12bd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    12f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    12f6:	8b 40 04             	mov    0x4(%eax),%eax
    12f9:	c1 e0 03             	shl    $0x3,%eax
    12fc:	89 c2                	mov    %eax,%edx
    12fe:	03 55 f8             	add    -0x8(%ebp),%edx
    1301:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1304:	8b 00                	mov    (%eax),%eax
    1306:	39 c2                	cmp    %eax,%edx
    1308:	75 24                	jne    132e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    130a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    130d:	8b 50 04             	mov    0x4(%eax),%edx
    1310:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1313:	8b 00                	mov    (%eax),%eax
    1315:	8b 40 04             	mov    0x4(%eax),%eax
    1318:	01 c2                	add    %eax,%edx
    131a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    131d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1320:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1323:	8b 00                	mov    (%eax),%eax
    1325:	8b 10                	mov    (%eax),%edx
    1327:	8b 45 f8             	mov    -0x8(%ebp),%eax
    132a:	89 10                	mov    %edx,(%eax)
    132c:	eb 0a                	jmp    1338 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    132e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1331:	8b 10                	mov    (%eax),%edx
    1333:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1336:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    1338:	8b 45 fc             	mov    -0x4(%ebp),%eax
    133b:	8b 40 04             	mov    0x4(%eax),%eax
    133e:	c1 e0 03             	shl    $0x3,%eax
    1341:	03 45 fc             	add    -0x4(%ebp),%eax
    1344:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1347:	75 20                	jne    1369 <free+0xc5>
    p->s.size += bp->s.size;
    1349:	8b 45 fc             	mov    -0x4(%ebp),%eax
    134c:	8b 50 04             	mov    0x4(%eax),%edx
    134f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1352:	8b 40 04             	mov    0x4(%eax),%eax
    1355:	01 c2                	add    %eax,%edx
    1357:	8b 45 fc             	mov    -0x4(%ebp),%eax
    135a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    135d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1360:	8b 10                	mov    (%eax),%edx
    1362:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1365:	89 10                	mov    %edx,(%eax)
    1367:	eb 08                	jmp    1371 <free+0xcd>
  } else
    p->s.ptr = bp;
    1369:	8b 45 fc             	mov    -0x4(%ebp),%eax
    136c:	8b 55 f8             	mov    -0x8(%ebp),%edx
    136f:	89 10                	mov    %edx,(%eax)
  freep = p;
    1371:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1374:	a3 4c 16 00 00       	mov    %eax,0x164c
}
    1379:	c9                   	leave  
    137a:	c3                   	ret    

0000137b <morecore>:

static Header*
morecore(uint nu)
{
    137b:	55                   	push   %ebp
    137c:	89 e5                	mov    %esp,%ebp
    137e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    1381:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    1388:	77 07                	ja     1391 <morecore+0x16>
    nu = 4096;
    138a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1391:	8b 45 08             	mov    0x8(%ebp),%eax
    1394:	c1 e0 03             	shl    $0x3,%eax
    1397:	89 04 24             	mov    %eax,(%esp)
    139a:	e8 4d fc ff ff       	call   fec <sbrk>
    139f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    13a2:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    13a6:	75 07                	jne    13af <morecore+0x34>
    return 0;
    13a8:	b8 00 00 00 00       	mov    $0x0,%eax
    13ad:	eb 22                	jmp    13d1 <morecore+0x56>
  hp = (Header*)p;
    13af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    13b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13b8:	8b 55 08             	mov    0x8(%ebp),%edx
    13bb:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    13be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13c1:	83 c0 08             	add    $0x8,%eax
    13c4:	89 04 24             	mov    %eax,(%esp)
    13c7:	e8 d8 fe ff ff       	call   12a4 <free>
  return freep;
    13cc:	a1 4c 16 00 00       	mov    0x164c,%eax
}
    13d1:	c9                   	leave  
    13d2:	c3                   	ret    

000013d3 <malloc>:

void*
malloc(uint nbytes)
{
    13d3:	55                   	push   %ebp
    13d4:	89 e5                	mov    %esp,%ebp
    13d6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13d9:	8b 45 08             	mov    0x8(%ebp),%eax
    13dc:	83 c0 07             	add    $0x7,%eax
    13df:	c1 e8 03             	shr    $0x3,%eax
    13e2:	83 c0 01             	add    $0x1,%eax
    13e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    13e8:	a1 4c 16 00 00       	mov    0x164c,%eax
    13ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
    13f0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    13f4:	75 23                	jne    1419 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    13f6:	c7 45 f0 44 16 00 00 	movl   $0x1644,-0x10(%ebp)
    13fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1400:	a3 4c 16 00 00       	mov    %eax,0x164c
    1405:	a1 4c 16 00 00       	mov    0x164c,%eax
    140a:	a3 44 16 00 00       	mov    %eax,0x1644
    base.s.size = 0;
    140f:	c7 05 48 16 00 00 00 	movl   $0x0,0x1648
    1416:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1419:	8b 45 f0             	mov    -0x10(%ebp),%eax
    141c:	8b 00                	mov    (%eax),%eax
    141e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    1421:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1424:	8b 40 04             	mov    0x4(%eax),%eax
    1427:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    142a:	72 4d                	jb     1479 <malloc+0xa6>
      if(p->s.size == nunits)
    142c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    142f:	8b 40 04             	mov    0x4(%eax),%eax
    1432:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1435:	75 0c                	jne    1443 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1437:	8b 45 ec             	mov    -0x14(%ebp),%eax
    143a:	8b 10                	mov    (%eax),%edx
    143c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    143f:	89 10                	mov    %edx,(%eax)
    1441:	eb 26                	jmp    1469 <malloc+0x96>
      else {
        p->s.size -= nunits;
    1443:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1446:	8b 40 04             	mov    0x4(%eax),%eax
    1449:	89 c2                	mov    %eax,%edx
    144b:	2b 55 f4             	sub    -0xc(%ebp),%edx
    144e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1451:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    1454:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1457:	8b 40 04             	mov    0x4(%eax),%eax
    145a:	c1 e0 03             	shl    $0x3,%eax
    145d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    1460:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1463:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1466:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    1469:	8b 45 f0             	mov    -0x10(%ebp),%eax
    146c:	a3 4c 16 00 00       	mov    %eax,0x164c
      return (void*)(p + 1);
    1471:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1474:	83 c0 08             	add    $0x8,%eax
    1477:	eb 38                	jmp    14b1 <malloc+0xde>
    }
    if(p == freep)
    1479:	a1 4c 16 00 00       	mov    0x164c,%eax
    147e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    1481:	75 1b                	jne    149e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    1483:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1486:	89 04 24             	mov    %eax,(%esp)
    1489:	e8 ed fe ff ff       	call   137b <morecore>
    148e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1491:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1495:	75 07                	jne    149e <malloc+0xcb>
        return 0;
    1497:	b8 00 00 00 00       	mov    $0x0,%eax
    149c:	eb 13                	jmp    14b1 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    149e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    14a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14a7:	8b 00                	mov    (%eax),%eax
    14a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    14ac:	e9 70 ff ff ff       	jmp    1421 <malloc+0x4e>
}
    14b1:	c9                   	leave  
    14b2:	c3                   	ret    
