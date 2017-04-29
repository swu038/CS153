
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4 0f                	in     $0xf,%al

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 a0 10 00       	mov    $0x10a000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc 70 c6 10 80       	mov    $0x8010c670,%esp
8010002d:	b8 e4 33 10 80       	mov    $0x801033e4,%eax
80100032:	ff e0                	jmp    *%eax

80100034 <binit>:
80100034:	55                   	push   %ebp
80100035:	89 e5                	mov    %esp,%ebp
80100037:	83 ec 28             	sub    $0x28,%esp
8010003a:	c7 44 24 04 78 85 10 	movl   $0x80108578,0x4(%esp)
80100041:	80 
80100042:	c7 04 24 80 c6 10 80 	movl   $0x8010c680,(%esp)
80100049:	e8 74 4e 00 00       	call   80104ec2 <initlock>
8010004e:	c7 05 b0 db 10 80 a4 	movl   $0x8010dba4,0x8010dbb0
80100055:	db 10 80 
80100058:	c7 05 b4 db 10 80 a4 	movl   $0x8010dba4,0x8010dbb4
8010005f:	db 10 80 
80100062:	c7 45 f4 b4 c6 10 80 	movl   $0x8010c6b4,-0xc(%ebp)
80100069:	eb 3a                	jmp    801000a5 <binit+0x71>
8010006b:	8b 15 b4 db 10 80    	mov    0x8010dbb4,%edx
80100071:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100074:	89 50 10             	mov    %edx,0x10(%eax)
80100077:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010007a:	c7 40 0c a4 db 10 80 	movl   $0x8010dba4,0xc(%eax)
80100081:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100084:	c7 40 04 ff ff ff ff 	movl   $0xffffffff,0x4(%eax)
8010008b:	a1 b4 db 10 80       	mov    0x8010dbb4,%eax
80100090:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100093:	89 50 0c             	mov    %edx,0xc(%eax)
80100096:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100099:	a3 b4 db 10 80       	mov    %eax,0x8010dbb4
8010009e:	81 45 f4 18 02 00 00 	addl   $0x218,-0xc(%ebp)
801000a5:	b8 a4 db 10 80       	mov    $0x8010dba4,%eax
801000aa:	39 45 f4             	cmp    %eax,-0xc(%ebp)
801000ad:	72 bc                	jb     8010006b <binit+0x37>
801000af:	c9                   	leave  
801000b0:	c3                   	ret    

801000b1 <bget>:
801000b1:	55                   	push   %ebp
801000b2:	89 e5                	mov    %esp,%ebp
801000b4:	83 ec 28             	sub    $0x28,%esp
801000b7:	c7 04 24 80 c6 10 80 	movl   $0x8010c680,(%esp)
801000be:	e8 20 4e 00 00       	call   80104ee3 <acquire>
801000c3:	a1 b4 db 10 80       	mov    0x8010dbb4,%eax
801000c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
801000cb:	eb 63                	jmp    80100130 <bget+0x7f>
801000cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000d0:	8b 40 04             	mov    0x4(%eax),%eax
801000d3:	3b 45 08             	cmp    0x8(%ebp),%eax
801000d6:	75 4f                	jne    80100127 <bget+0x76>
801000d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000db:	8b 40 08             	mov    0x8(%eax),%eax
801000de:	3b 45 0c             	cmp    0xc(%ebp),%eax
801000e1:	75 44                	jne    80100127 <bget+0x76>
801000e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000e6:	8b 00                	mov    (%eax),%eax
801000e8:	83 e0 01             	and    $0x1,%eax
801000eb:	85 c0                	test   %eax,%eax
801000ed:	75 23                	jne    80100112 <bget+0x61>
801000ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000f2:	8b 00                	mov    (%eax),%eax
801000f4:	89 c2                	mov    %eax,%edx
801000f6:	83 ca 01             	or     $0x1,%edx
801000f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801000fc:	89 10                	mov    %edx,(%eax)
801000fe:	c7 04 24 80 c6 10 80 	movl   $0x8010c680,(%esp)
80100105:	e8 3a 4e 00 00       	call   80104f44 <release>
8010010a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010010d:	e9 93 00 00 00       	jmp    801001a5 <bget+0xf4>
80100112:	c7 44 24 04 80 c6 10 	movl   $0x8010c680,0x4(%esp)
80100119:	80 
8010011a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010011d:	89 04 24             	mov    %eax,(%esp)
80100120:	e8 e4 4a 00 00       	call   80104c09 <sleep>
80100125:	eb 9c                	jmp    801000c3 <bget+0x12>
80100127:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010012a:	8b 40 10             	mov    0x10(%eax),%eax
8010012d:	89 45 f4             	mov    %eax,-0xc(%ebp)
80100130:	81 7d f4 a4 db 10 80 	cmpl   $0x8010dba4,-0xc(%ebp)
80100137:	75 94                	jne    801000cd <bget+0x1c>
80100139:	a1 b0 db 10 80       	mov    0x8010dbb0,%eax
8010013e:	89 45 f4             	mov    %eax,-0xc(%ebp)
80100141:	eb 4d                	jmp    80100190 <bget+0xdf>
80100143:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100146:	8b 00                	mov    (%eax),%eax
80100148:	83 e0 01             	and    $0x1,%eax
8010014b:	85 c0                	test   %eax,%eax
8010014d:	75 38                	jne    80100187 <bget+0xd6>
8010014f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100152:	8b 00                	mov    (%eax),%eax
80100154:	83 e0 04             	and    $0x4,%eax
80100157:	85 c0                	test   %eax,%eax
80100159:	75 2c                	jne    80100187 <bget+0xd6>
8010015b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010015e:	8b 55 08             	mov    0x8(%ebp),%edx
80100161:	89 50 04             	mov    %edx,0x4(%eax)
80100164:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100167:	8b 55 0c             	mov    0xc(%ebp),%edx
8010016a:	89 50 08             	mov    %edx,0x8(%eax)
8010016d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100170:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80100176:	c7 04 24 80 c6 10 80 	movl   $0x8010c680,(%esp)
8010017d:	e8 c2 4d 00 00       	call   80104f44 <release>
80100182:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100185:	eb 1e                	jmp    801001a5 <bget+0xf4>
80100187:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010018a:	8b 40 0c             	mov    0xc(%eax),%eax
8010018d:	89 45 f4             	mov    %eax,-0xc(%ebp)
80100190:	81 7d f4 a4 db 10 80 	cmpl   $0x8010dba4,-0xc(%ebp)
80100197:	75 aa                	jne    80100143 <bget+0x92>
80100199:	c7 04 24 7f 85 10 80 	movl   $0x8010857f,(%esp)
801001a0:	e8 95 03 00 00       	call   8010053a <panic>
801001a5:	c9                   	leave  
801001a6:	c3                   	ret    

801001a7 <bread>:
801001a7:	55                   	push   %ebp
801001a8:	89 e5                	mov    %esp,%ebp
801001aa:	83 ec 28             	sub    $0x28,%esp
801001ad:	8b 45 0c             	mov    0xc(%ebp),%eax
801001b0:	89 44 24 04          	mov    %eax,0x4(%esp)
801001b4:	8b 45 08             	mov    0x8(%ebp),%eax
801001b7:	89 04 24             	mov    %eax,(%esp)
801001ba:	e8 f2 fe ff ff       	call   801000b1 <bget>
801001bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
801001c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801001c5:	8b 00                	mov    (%eax),%eax
801001c7:	83 e0 02             	and    $0x2,%eax
801001ca:	85 c0                	test   %eax,%eax
801001cc:	75 0b                	jne    801001d9 <bread+0x32>
801001ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
801001d1:	89 04 24             	mov    %eax,(%esp)
801001d4:	e8 d9 25 00 00       	call   801027b2 <iderw>
801001d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801001dc:	c9                   	leave  
801001dd:	c3                   	ret    

801001de <bwrite>:
801001de:	55                   	push   %ebp
801001df:	89 e5                	mov    %esp,%ebp
801001e1:	83 ec 18             	sub    $0x18,%esp
801001e4:	8b 45 08             	mov    0x8(%ebp),%eax
801001e7:	8b 00                	mov    (%eax),%eax
801001e9:	83 e0 01             	and    $0x1,%eax
801001ec:	85 c0                	test   %eax,%eax
801001ee:	75 0c                	jne    801001fc <bwrite+0x1e>
801001f0:	c7 04 24 90 85 10 80 	movl   $0x80108590,(%esp)
801001f7:	e8 3e 03 00 00       	call   8010053a <panic>
801001fc:	8b 45 08             	mov    0x8(%ebp),%eax
801001ff:	8b 00                	mov    (%eax),%eax
80100201:	89 c2                	mov    %eax,%edx
80100203:	83 ca 04             	or     $0x4,%edx
80100206:	8b 45 08             	mov    0x8(%ebp),%eax
80100209:	89 10                	mov    %edx,(%eax)
8010020b:	8b 45 08             	mov    0x8(%ebp),%eax
8010020e:	89 04 24             	mov    %eax,(%esp)
80100211:	e8 9c 25 00 00       	call   801027b2 <iderw>
80100216:	c9                   	leave  
80100217:	c3                   	ret    

80100218 <brelse>:
80100218:	55                   	push   %ebp
80100219:	89 e5                	mov    %esp,%ebp
8010021b:	83 ec 18             	sub    $0x18,%esp
8010021e:	8b 45 08             	mov    0x8(%ebp),%eax
80100221:	8b 00                	mov    (%eax),%eax
80100223:	83 e0 01             	and    $0x1,%eax
80100226:	85 c0                	test   %eax,%eax
80100228:	75 0c                	jne    80100236 <brelse+0x1e>
8010022a:	c7 04 24 97 85 10 80 	movl   $0x80108597,(%esp)
80100231:	e8 04 03 00 00       	call   8010053a <panic>
80100236:	c7 04 24 80 c6 10 80 	movl   $0x8010c680,(%esp)
8010023d:	e8 a1 4c 00 00       	call   80104ee3 <acquire>
80100242:	8b 45 08             	mov    0x8(%ebp),%eax
80100245:	8b 40 10             	mov    0x10(%eax),%eax
80100248:	8b 55 08             	mov    0x8(%ebp),%edx
8010024b:	8b 52 0c             	mov    0xc(%edx),%edx
8010024e:	89 50 0c             	mov    %edx,0xc(%eax)
80100251:	8b 45 08             	mov    0x8(%ebp),%eax
80100254:	8b 40 0c             	mov    0xc(%eax),%eax
80100257:	8b 55 08             	mov    0x8(%ebp),%edx
8010025a:	8b 52 10             	mov    0x10(%edx),%edx
8010025d:	89 50 10             	mov    %edx,0x10(%eax)
80100260:	8b 15 b4 db 10 80    	mov    0x8010dbb4,%edx
80100266:	8b 45 08             	mov    0x8(%ebp),%eax
80100269:	89 50 10             	mov    %edx,0x10(%eax)
8010026c:	8b 45 08             	mov    0x8(%ebp),%eax
8010026f:	c7 40 0c a4 db 10 80 	movl   $0x8010dba4,0xc(%eax)
80100276:	a1 b4 db 10 80       	mov    0x8010dbb4,%eax
8010027b:	8b 55 08             	mov    0x8(%ebp),%edx
8010027e:	89 50 0c             	mov    %edx,0xc(%eax)
80100281:	8b 45 08             	mov    0x8(%ebp),%eax
80100284:	a3 b4 db 10 80       	mov    %eax,0x8010dbb4
80100289:	8b 45 08             	mov    0x8(%ebp),%eax
8010028c:	8b 00                	mov    (%eax),%eax
8010028e:	89 c2                	mov    %eax,%edx
80100290:	83 e2 fe             	and    $0xfffffffe,%edx
80100293:	8b 45 08             	mov    0x8(%ebp),%eax
80100296:	89 10                	mov    %edx,(%eax)
80100298:	8b 45 08             	mov    0x8(%ebp),%eax
8010029b:	89 04 24             	mov    %eax,(%esp)
8010029e:	e8 43 4a 00 00       	call   80104ce6 <wakeup>
801002a3:	c7 04 24 80 c6 10 80 	movl   $0x8010c680,(%esp)
801002aa:	e8 95 4c 00 00       	call   80104f44 <release>
801002af:	c9                   	leave  
801002b0:	c3                   	ret    
801002b1:	00 00                	add    %al,(%eax)
	...

801002b4 <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
801002b4:	55                   	push   %ebp
801002b5:	89 e5                	mov    %esp,%ebp
801002b7:	83 ec 14             	sub    $0x14,%esp
801002ba:	8b 45 08             	mov    0x8(%ebp),%eax
801002bd:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801002c1:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
801002c5:	89 c2                	mov    %eax,%edx
801002c7:	ec                   	in     (%dx),%al
801002c8:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
801002cb:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
801002cf:	c9                   	leave  
801002d0:	c3                   	ret    

801002d1 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
801002d1:	55                   	push   %ebp
801002d2:	89 e5                	mov    %esp,%ebp
801002d4:	83 ec 08             	sub    $0x8,%esp
801002d7:	8b 55 08             	mov    0x8(%ebp),%edx
801002da:	8b 45 0c             	mov    0xc(%ebp),%eax
801002dd:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
801002e1:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801002e4:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
801002e8:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
801002ec:	ee                   	out    %al,(%dx)
}
801002ed:	c9                   	leave  
801002ee:	c3                   	ret    

801002ef <cli>:
  asm volatile("movw %0, %%gs" : : "r" (v));
}

static inline void
cli(void)
{
801002ef:	55                   	push   %ebp
801002f0:	89 e5                	mov    %esp,%ebp
  asm volatile("cli");
801002f2:	fa                   	cli    
}
801002f3:	5d                   	pop    %ebp
801002f4:	c3                   	ret    

801002f5 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
801002f5:	55                   	push   %ebp
801002f6:	89 e5                	mov    %esp,%ebp
801002f8:	53                   	push   %ebx
801002f9:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
801002fc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80100300:	74 19                	je     8010031b <printint+0x26>
80100302:	8b 45 08             	mov    0x8(%ebp),%eax
80100305:	c1 e8 1f             	shr    $0x1f,%eax
80100308:	89 45 10             	mov    %eax,0x10(%ebp)
8010030b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
8010030f:	74 0a                	je     8010031b <printint+0x26>
    x = -xx;
80100311:	8b 45 08             	mov    0x8(%ebp),%eax
80100314:	f7 d8                	neg    %eax
80100316:	89 45 f4             	mov    %eax,-0xc(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100319:	eb 06                	jmp    80100321 <printint+0x2c>
    x = -xx;
  else
    x = xx;
8010031b:	8b 45 08             	mov    0x8(%ebp),%eax
8010031e:	89 45 f4             	mov    %eax,-0xc(%ebp)

  i = 0;
80100321:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  do{
    buf[i++] = digits[x % base];
80100328:	8b 4d f0             	mov    -0x10(%ebp),%ecx
8010032b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010032e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100331:	ba 00 00 00 00       	mov    $0x0,%edx
80100336:	f7 f3                	div    %ebx
80100338:	89 d0                	mov    %edx,%eax
8010033a:	0f b6 80 04 90 10 80 	movzbl -0x7fef6ffc(%eax),%eax
80100341:	88 44 0d e0          	mov    %al,-0x20(%ebp,%ecx,1)
80100345:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }while((x /= base) != 0);
80100349:	8b 45 0c             	mov    0xc(%ebp),%eax
8010034c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
8010034f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100352:	ba 00 00 00 00       	mov    $0x0,%edx
80100357:	f7 75 d4             	divl   -0x2c(%ebp)
8010035a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010035d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80100361:	75 c5                	jne    80100328 <printint+0x33>

  if(sign)
80100363:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80100367:	74 21                	je     8010038a <printint+0x95>
    buf[i++] = '-';
80100369:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010036c:	c6 44 05 e0 2d       	movb   $0x2d,-0x20(%ebp,%eax,1)
80100371:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

  while(--i >= 0)
80100375:	eb 13                	jmp    8010038a <printint+0x95>
    consputc(buf[i]);
80100377:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010037a:	0f b6 44 05 e0       	movzbl -0x20(%ebp,%eax,1),%eax
8010037f:	0f be c0             	movsbl %al,%eax
80100382:	89 04 24             	mov    %eax,(%esp)
80100385:	e8 c4 03 00 00       	call   8010074e <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
8010038a:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
8010038e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80100392:	79 e3                	jns    80100377 <printint+0x82>
    consputc(buf[i]);
}
80100394:	83 c4 44             	add    $0x44,%esp
80100397:	5b                   	pop    %ebx
80100398:	5d                   	pop    %ebp
80100399:	c3                   	ret    

8010039a <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
8010039a:	55                   	push   %ebp
8010039b:	89 e5                	mov    %esp,%ebp
8010039d:	83 ec 38             	sub    $0x38,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
801003a0:	a1 14 b6 10 80       	mov    0x8010b614,%eax
801003a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(locking)
801003a8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
801003ac:	74 0c                	je     801003ba <cprintf+0x20>
    acquire(&cons.lock);
801003ae:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
801003b5:	e8 29 4b 00 00       	call   80104ee3 <acquire>

  if (fmt == 0)
801003ba:	8b 45 08             	mov    0x8(%ebp),%eax
801003bd:	85 c0                	test   %eax,%eax
801003bf:	75 0c                	jne    801003cd <cprintf+0x33>
    panic("null fmt");
801003c1:	c7 04 24 9e 85 10 80 	movl   $0x8010859e,(%esp)
801003c8:	e8 6d 01 00 00       	call   8010053a <panic>

  argp = (uint*)(void*)(&fmt + 1);
801003cd:	8d 45 08             	lea    0x8(%ebp),%eax
801003d0:	83 c0 04             	add    $0x4,%eax
801003d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801003d6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
801003dd:	e9 20 01 00 00       	jmp    80100502 <cprintf+0x168>
    if(c != '%'){
801003e2:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
801003e6:	74 10                	je     801003f8 <cprintf+0x5e>
      consputc(c);
801003e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
801003eb:	89 04 24             	mov    %eax,(%esp)
801003ee:	e8 5b 03 00 00       	call   8010074e <consputc>
      continue;
801003f3:	e9 06 01 00 00       	jmp    801004fe <cprintf+0x164>
    }
    c = fmt[++i] & 0xff;
801003f8:	8b 55 08             	mov    0x8(%ebp),%edx
801003fb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
801003ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100402:	8d 04 02             	lea    (%edx,%eax,1),%eax
80100405:	0f b6 00             	movzbl (%eax),%eax
80100408:	0f be c0             	movsbl %al,%eax
8010040b:	25 ff 00 00 00       	and    $0xff,%eax
80100410:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(c == 0)
80100413:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80100417:	0f 84 08 01 00 00    	je     80100525 <cprintf+0x18b>
      break;
    switch(c){
8010041d:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100420:	83 f8 70             	cmp    $0x70,%eax
80100423:	74 4d                	je     80100472 <cprintf+0xd8>
80100425:	83 f8 70             	cmp    $0x70,%eax
80100428:	7f 13                	jg     8010043d <cprintf+0xa3>
8010042a:	83 f8 25             	cmp    $0x25,%eax
8010042d:	0f 84 a6 00 00 00    	je     801004d9 <cprintf+0x13f>
80100433:	83 f8 64             	cmp    $0x64,%eax
80100436:	74 14                	je     8010044c <cprintf+0xb2>
80100438:	e9 aa 00 00 00       	jmp    801004e7 <cprintf+0x14d>
8010043d:	83 f8 73             	cmp    $0x73,%eax
80100440:	74 53                	je     80100495 <cprintf+0xfb>
80100442:	83 f8 78             	cmp    $0x78,%eax
80100445:	74 2b                	je     80100472 <cprintf+0xd8>
80100447:	e9 9b 00 00 00       	jmp    801004e7 <cprintf+0x14d>
    case 'd':
      printint(*argp++, 10, 1);
8010044c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010044f:	8b 00                	mov    (%eax),%eax
80100451:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
80100455:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
8010045c:	00 
8010045d:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
80100464:	00 
80100465:	89 04 24             	mov    %eax,(%esp)
80100468:	e8 88 fe ff ff       	call   801002f5 <printint>
      break;
8010046d:	e9 8c 00 00 00       	jmp    801004fe <cprintf+0x164>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
80100472:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100475:	8b 00                	mov    (%eax),%eax
80100477:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
8010047b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80100482:	00 
80100483:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
8010048a:	00 
8010048b:	89 04 24             	mov    %eax,(%esp)
8010048e:	e8 62 fe ff ff       	call   801002f5 <printint>
      break;
80100493:	eb 69                	jmp    801004fe <cprintf+0x164>
    case 's':
      if((s = (char*)*argp++) == 0)
80100495:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100498:	8b 00                	mov    (%eax),%eax
8010049a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010049d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801004a1:	0f 94 c0             	sete   %al
801004a4:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
801004a8:	84 c0                	test   %al,%al
801004aa:	74 20                	je     801004cc <cprintf+0x132>
        s = "(null)";
801004ac:	c7 45 f4 a7 85 10 80 	movl   $0x801085a7,-0xc(%ebp)
      for(; *s; s++)
801004b3:	eb 18                	jmp    801004cd <cprintf+0x133>
        consputc(*s);
801004b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801004b8:	0f b6 00             	movzbl (%eax),%eax
801004bb:	0f be c0             	movsbl %al,%eax
801004be:	89 04 24             	mov    %eax,(%esp)
801004c1:	e8 88 02 00 00       	call   8010074e <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801004c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801004ca:	eb 01                	jmp    801004cd <cprintf+0x133>
801004cc:	90                   	nop
801004cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
801004d0:	0f b6 00             	movzbl (%eax),%eax
801004d3:	84 c0                	test   %al,%al
801004d5:	75 de                	jne    801004b5 <cprintf+0x11b>
        consputc(*s);
      break;
801004d7:	eb 25                	jmp    801004fe <cprintf+0x164>
    case '%':
      consputc('%');
801004d9:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
801004e0:	e8 69 02 00 00       	call   8010074e <consputc>
      break;
801004e5:	eb 17                	jmp    801004fe <cprintf+0x164>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
801004e7:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
801004ee:	e8 5b 02 00 00       	call   8010074e <consputc>
      consputc(c);
801004f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
801004f6:	89 04 24             	mov    %eax,(%esp)
801004f9:	e8 50 02 00 00       	call   8010074e <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801004fe:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80100502:	8b 55 08             	mov    0x8(%ebp),%edx
80100505:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100508:	8d 04 02             	lea    (%edx,%eax,1),%eax
8010050b:	0f b6 00             	movzbl (%eax),%eax
8010050e:	0f be c0             	movsbl %al,%eax
80100511:	25 ff 00 00 00       	and    $0xff,%eax
80100516:	89 45 e8             	mov    %eax,-0x18(%ebp)
80100519:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
8010051d:	0f 85 bf fe ff ff    	jne    801003e2 <cprintf+0x48>
80100523:	eb 01                	jmp    80100526 <cprintf+0x18c>
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
80100525:	90                   	nop
      consputc(c);
      break;
    }
  }

  if(locking)
80100526:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
8010052a:	74 0c                	je     80100538 <cprintf+0x19e>
    release(&cons.lock);
8010052c:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100533:	e8 0c 4a 00 00       	call   80104f44 <release>
}
80100538:	c9                   	leave  
80100539:	c3                   	ret    

8010053a <panic>:

void
panic(char *s)
{
8010053a:	55                   	push   %ebp
8010053b:	89 e5                	mov    %esp,%ebp
8010053d:	83 ec 48             	sub    $0x48,%esp
  int i;
  uint pcs[10];
  
  cli();
80100540:	e8 aa fd ff ff       	call   801002ef <cli>
  cons.locking = 0;
80100545:	c7 05 14 b6 10 80 00 	movl   $0x0,0x8010b614
8010054c:	00 00 00 
  cprintf("cpu%d: panic: ", cpu->id);
8010054f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80100555:	0f b6 00             	movzbl (%eax),%eax
80100558:	0f b6 c0             	movzbl %al,%eax
8010055b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010055f:	c7 04 24 ae 85 10 80 	movl   $0x801085ae,(%esp)
80100566:	e8 2f fe ff ff       	call   8010039a <cprintf>
  cprintf(s);
8010056b:	8b 45 08             	mov    0x8(%ebp),%eax
8010056e:	89 04 24             	mov    %eax,(%esp)
80100571:	e8 24 fe ff ff       	call   8010039a <cprintf>
  cprintf("\n");
80100576:	c7 04 24 bd 85 10 80 	movl   $0x801085bd,(%esp)
8010057d:	e8 18 fe ff ff       	call   8010039a <cprintf>
  getcallerpcs(&s, pcs);
80100582:	8d 45 cc             	lea    -0x34(%ebp),%eax
80100585:	89 44 24 04          	mov    %eax,0x4(%esp)
80100589:	8d 45 08             	lea    0x8(%ebp),%eax
8010058c:	89 04 24             	mov    %eax,(%esp)
8010058f:	e8 ff 49 00 00       	call   80104f93 <getcallerpcs>
  for(i=0; i<10; i++)
80100594:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
8010059b:	eb 1b                	jmp    801005b8 <panic+0x7e>
    cprintf(" %p", pcs[i]);
8010059d:	8b 45 f4             	mov    -0xc(%ebp),%eax
801005a0:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
801005a4:	89 44 24 04          	mov    %eax,0x4(%esp)
801005a8:	c7 04 24 bf 85 10 80 	movl   $0x801085bf,(%esp)
801005af:	e8 e6 fd ff ff       	call   8010039a <cprintf>
  cons.locking = 0;
  cprintf("cpu%d: panic: ", cpu->id);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801005b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801005b8:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
801005bc:	7e df                	jle    8010059d <panic+0x63>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801005be:	c7 05 c0 b5 10 80 01 	movl   $0x1,0x8010b5c0
801005c5:	00 00 00 
  for(;;)
    ;
801005c8:	eb fe                	jmp    801005c8 <panic+0x8e>

801005ca <cgaputc>:
#define CRTPORT 0x3d4
static ushort *crt = (ushort*)P2V(0xb8000);  // CGA memory

static void
cgaputc(int c)
{
801005ca:	55                   	push   %ebp
801005cb:	89 e5                	mov    %esp,%ebp
801005cd:	83 ec 28             	sub    $0x28,%esp
  int pos;
  
  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
801005d0:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
801005d7:	00 
801005d8:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
801005df:	e8 ed fc ff ff       	call   801002d1 <outb>
  pos = inb(CRTPORT+1) << 8;
801005e4:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
801005eb:	e8 c4 fc ff ff       	call   801002b4 <inb>
801005f0:	0f b6 c0             	movzbl %al,%eax
801005f3:	c1 e0 08             	shl    $0x8,%eax
801005f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  outb(CRTPORT, 15);
801005f9:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
80100600:	00 
80100601:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
80100608:	e8 c4 fc ff ff       	call   801002d1 <outb>
  pos |= inb(CRTPORT+1);
8010060d:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
80100614:	e8 9b fc ff ff       	call   801002b4 <inb>
80100619:	0f b6 c0             	movzbl %al,%eax
8010061c:	09 45 f4             	or     %eax,-0xc(%ebp)

  if(c == '\n')
8010061f:	83 7d 08 0a          	cmpl   $0xa,0x8(%ebp)
80100623:	75 30                	jne    80100655 <cgaputc+0x8b>
    pos += 80 - pos%80;
80100625:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80100628:	ba 67 66 66 66       	mov    $0x66666667,%edx
8010062d:	89 c8                	mov    %ecx,%eax
8010062f:	f7 ea                	imul   %edx
80100631:	c1 fa 05             	sar    $0x5,%edx
80100634:	89 c8                	mov    %ecx,%eax
80100636:	c1 f8 1f             	sar    $0x1f,%eax
80100639:	29 c2                	sub    %eax,%edx
8010063b:	89 d0                	mov    %edx,%eax
8010063d:	c1 e0 02             	shl    $0x2,%eax
80100640:	01 d0                	add    %edx,%eax
80100642:	c1 e0 04             	shl    $0x4,%eax
80100645:	89 ca                	mov    %ecx,%edx
80100647:	29 c2                	sub    %eax,%edx
80100649:	b8 50 00 00 00       	mov    $0x50,%eax
8010064e:	29 d0                	sub    %edx,%eax
80100650:	01 45 f4             	add    %eax,-0xc(%ebp)
80100653:	eb 33                	jmp    80100688 <cgaputc+0xbe>
  else if(c == BACKSPACE){
80100655:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
8010065c:	75 0c                	jne    8010066a <cgaputc+0xa0>
    if(pos > 0) --pos;
8010065e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80100662:	7e 24                	jle    80100688 <cgaputc+0xbe>
80100664:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
80100668:	eb 1e                	jmp    80100688 <cgaputc+0xbe>
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
8010066a:	a1 00 90 10 80       	mov    0x80109000,%eax
8010066f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100672:	01 d2                	add    %edx,%edx
80100674:	8d 14 10             	lea    (%eax,%edx,1),%edx
80100677:	8b 45 08             	mov    0x8(%ebp),%eax
8010067a:	66 25 ff 00          	and    $0xff,%ax
8010067e:	80 cc 07             	or     $0x7,%ah
80100681:	66 89 02             	mov    %ax,(%edx)
80100684:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  if((pos/80) >= 24){  // Scroll up.
80100688:	81 7d f4 7f 07 00 00 	cmpl   $0x77f,-0xc(%ebp)
8010068f:	7e 53                	jle    801006e4 <cgaputc+0x11a>
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100691:	a1 00 90 10 80       	mov    0x80109000,%eax
80100696:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
8010069c:	a1 00 90 10 80       	mov    0x80109000,%eax
801006a1:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
801006a8:	00 
801006a9:	89 54 24 04          	mov    %edx,0x4(%esp)
801006ad:	89 04 24             	mov    %eax,(%esp)
801006b0:	e8 50 4b 00 00       	call   80105205 <memmove>
    pos -= 80;
801006b5:	83 6d f4 50          	subl   $0x50,-0xc(%ebp)
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801006b9:	b8 80 07 00 00       	mov    $0x780,%eax
801006be:	2b 45 f4             	sub    -0xc(%ebp),%eax
801006c1:	8d 14 00             	lea    (%eax,%eax,1),%edx
801006c4:	a1 00 90 10 80       	mov    0x80109000,%eax
801006c9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
801006cc:	01 c9                	add    %ecx,%ecx
801006ce:	01 c8                	add    %ecx,%eax
801006d0:	89 54 24 08          	mov    %edx,0x8(%esp)
801006d4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801006db:	00 
801006dc:	89 04 24             	mov    %eax,(%esp)
801006df:	e8 4e 4a 00 00       	call   80105132 <memset>
  }
  
  outb(CRTPORT, 14);
801006e4:	c7 44 24 04 0e 00 00 	movl   $0xe,0x4(%esp)
801006eb:	00 
801006ec:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
801006f3:	e8 d9 fb ff ff       	call   801002d1 <outb>
  outb(CRTPORT+1, pos>>8);
801006f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801006fb:	c1 f8 08             	sar    $0x8,%eax
801006fe:	0f b6 c0             	movzbl %al,%eax
80100701:	89 44 24 04          	mov    %eax,0x4(%esp)
80100705:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
8010070c:	e8 c0 fb ff ff       	call   801002d1 <outb>
  outb(CRTPORT, 15);
80100711:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
80100718:	00 
80100719:	c7 04 24 d4 03 00 00 	movl   $0x3d4,(%esp)
80100720:	e8 ac fb ff ff       	call   801002d1 <outb>
  outb(CRTPORT+1, pos);
80100725:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100728:	0f b6 c0             	movzbl %al,%eax
8010072b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010072f:	c7 04 24 d5 03 00 00 	movl   $0x3d5,(%esp)
80100736:	e8 96 fb ff ff       	call   801002d1 <outb>
  crt[pos] = ' ' | 0x0700;
8010073b:	a1 00 90 10 80       	mov    0x80109000,%eax
80100740:	8b 55 f4             	mov    -0xc(%ebp),%edx
80100743:	01 d2                	add    %edx,%edx
80100745:	01 d0                	add    %edx,%eax
80100747:	66 c7 00 20 07       	movw   $0x720,(%eax)
}
8010074c:	c9                   	leave  
8010074d:	c3                   	ret    

8010074e <consputc>:

void
consputc(int c)
{
8010074e:	55                   	push   %ebp
8010074f:	89 e5                	mov    %esp,%ebp
80100751:	83 ec 18             	sub    $0x18,%esp
  if(panicked){
80100754:	a1 c0 b5 10 80       	mov    0x8010b5c0,%eax
80100759:	85 c0                	test   %eax,%eax
8010075b:	74 07                	je     80100764 <consputc+0x16>
    cli();
8010075d:	e8 8d fb ff ff       	call   801002ef <cli>
    for(;;)
      ;
80100762:	eb fe                	jmp    80100762 <consputc+0x14>
  }

  if(c == BACKSPACE){
80100764:	81 7d 08 00 01 00 00 	cmpl   $0x100,0x8(%ebp)
8010076b:	75 26                	jne    80100793 <consputc+0x45>
    uartputc('\b'); uartputc(' '); uartputc('\b');
8010076d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100774:	e8 4f 64 00 00       	call   80106bc8 <uartputc>
80100779:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100780:	e8 43 64 00 00       	call   80106bc8 <uartputc>
80100785:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010078c:	e8 37 64 00 00       	call   80106bc8 <uartputc>
80100791:	eb 0b                	jmp    8010079e <consputc+0x50>
  } else
    uartputc(c);
80100793:	8b 45 08             	mov    0x8(%ebp),%eax
80100796:	89 04 24             	mov    %eax,(%esp)
80100799:	e8 2a 64 00 00       	call   80106bc8 <uartputc>
  cgaputc(c);
8010079e:	8b 45 08             	mov    0x8(%ebp),%eax
801007a1:	89 04 24             	mov    %eax,(%esp)
801007a4:	e8 21 fe ff ff       	call   801005ca <cgaputc>
}
801007a9:	c9                   	leave  
801007aa:	c3                   	ret    

801007ab <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007ab:	55                   	push   %ebp
801007ac:	89 e5                	mov    %esp,%ebp
801007ae:	83 ec 28             	sub    $0x28,%esp
  int c;

  acquire(&input.lock);
801007b1:	c7 04 24 c0 dd 10 80 	movl   $0x8010ddc0,(%esp)
801007b8:	e8 26 47 00 00       	call   80104ee3 <acquire>
  while((c = getc()) >= 0){
801007bd:	e9 3e 01 00 00       	jmp    80100900 <consoleintr+0x155>
    switch(c){
801007c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801007c5:	83 f8 10             	cmp    $0x10,%eax
801007c8:	74 1e                	je     801007e8 <consoleintr+0x3d>
801007ca:	83 f8 10             	cmp    $0x10,%eax
801007cd:	7f 0a                	jg     801007d9 <consoleintr+0x2e>
801007cf:	83 f8 08             	cmp    $0x8,%eax
801007d2:	74 68                	je     8010083c <consoleintr+0x91>
801007d4:	e9 94 00 00 00       	jmp    8010086d <consoleintr+0xc2>
801007d9:	83 f8 15             	cmp    $0x15,%eax
801007dc:	74 2f                	je     8010080d <consoleintr+0x62>
801007de:	83 f8 7f             	cmp    $0x7f,%eax
801007e1:	74 59                	je     8010083c <consoleintr+0x91>
801007e3:	e9 85 00 00 00       	jmp    8010086d <consoleintr+0xc2>
    case C('P'):  // Process listing.
      procdump();
801007e8:	e8 a0 45 00 00       	call   80104d8d <procdump>
      break;
801007ed:	e9 0e 01 00 00       	jmp    80100900 <consoleintr+0x155>
    case C('U'):  // Kill line.
      while(input.e != input.w &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
801007f2:	a1 7c de 10 80       	mov    0x8010de7c,%eax
801007f7:	83 e8 01             	sub    $0x1,%eax
801007fa:	a3 7c de 10 80       	mov    %eax,0x8010de7c
        consputc(BACKSPACE);
801007ff:	c7 04 24 00 01 00 00 	movl   $0x100,(%esp)
80100806:	e8 43 ff ff ff       	call   8010074e <consputc>
8010080b:	eb 01                	jmp    8010080e <consoleintr+0x63>
    switch(c){
    case C('P'):  // Process listing.
      procdump();
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010080d:	90                   	nop
8010080e:	8b 15 7c de 10 80    	mov    0x8010de7c,%edx
80100814:	a1 78 de 10 80       	mov    0x8010de78,%eax
80100819:	39 c2                	cmp    %eax,%edx
8010081b:	0f 84 db 00 00 00    	je     801008fc <consoleintr+0x151>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100821:	a1 7c de 10 80       	mov    0x8010de7c,%eax
80100826:	83 e8 01             	sub    $0x1,%eax
80100829:	83 e0 7f             	and    $0x7f,%eax
8010082c:	0f b6 80 f4 dd 10 80 	movzbl -0x7fef220c(%eax),%eax
    switch(c){
    case C('P'):  // Process listing.
      procdump();
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100833:	3c 0a                	cmp    $0xa,%al
80100835:	75 bb                	jne    801007f2 <consoleintr+0x47>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
        consputc(BACKSPACE);
      }
      break;
80100837:	e9 c4 00 00 00       	jmp    80100900 <consoleintr+0x155>
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
8010083c:	8b 15 7c de 10 80    	mov    0x8010de7c,%edx
80100842:	a1 78 de 10 80       	mov    0x8010de78,%eax
80100847:	39 c2                	cmp    %eax,%edx
80100849:	0f 84 b0 00 00 00    	je     801008ff <consoleintr+0x154>
        input.e--;
8010084f:	a1 7c de 10 80       	mov    0x8010de7c,%eax
80100854:	83 e8 01             	sub    $0x1,%eax
80100857:	a3 7c de 10 80       	mov    %eax,0x8010de7c
        consputc(BACKSPACE);
8010085c:	c7 04 24 00 01 00 00 	movl   $0x100,(%esp)
80100863:	e8 e6 fe ff ff       	call   8010074e <consputc>
      }
      break;
80100868:	e9 93 00 00 00       	jmp    80100900 <consoleintr+0x155>
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
8010086d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80100871:	0f 84 89 00 00 00    	je     80100900 <consoleintr+0x155>
80100877:	8b 15 7c de 10 80    	mov    0x8010de7c,%edx
8010087d:	a1 74 de 10 80       	mov    0x8010de74,%eax
80100882:	89 d1                	mov    %edx,%ecx
80100884:	29 c1                	sub    %eax,%ecx
80100886:	89 c8                	mov    %ecx,%eax
80100888:	83 f8 7f             	cmp    $0x7f,%eax
8010088b:	77 73                	ja     80100900 <consoleintr+0x155>
        c = (c == '\r') ? '\n' : c;
8010088d:	83 7d f4 0d          	cmpl   $0xd,-0xc(%ebp)
80100891:	74 05                	je     80100898 <consoleintr+0xed>
80100893:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100896:	eb 05                	jmp    8010089d <consoleintr+0xf2>
80100898:	b8 0a 00 00 00       	mov    $0xa,%eax
8010089d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        input.buf[input.e++ % INPUT_BUF] = c;
801008a0:	a1 7c de 10 80       	mov    0x8010de7c,%eax
801008a5:	89 c1                	mov    %eax,%ecx
801008a7:	83 e1 7f             	and    $0x7f,%ecx
801008aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
801008ad:	88 91 f4 dd 10 80    	mov    %dl,-0x7fef220c(%ecx)
801008b3:	83 c0 01             	add    $0x1,%eax
801008b6:	a3 7c de 10 80       	mov    %eax,0x8010de7c
        consputc(c);
801008bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801008be:	89 04 24             	mov    %eax,(%esp)
801008c1:	e8 88 fe ff ff       	call   8010074e <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c6:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
801008ca:	74 18                	je     801008e4 <consoleintr+0x139>
801008cc:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
801008d0:	74 12                	je     801008e4 <consoleintr+0x139>
801008d2:	a1 7c de 10 80       	mov    0x8010de7c,%eax
801008d7:	8b 15 74 de 10 80    	mov    0x8010de74,%edx
801008dd:	83 ea 80             	sub    $0xffffff80,%edx
801008e0:	39 d0                	cmp    %edx,%eax
801008e2:	75 1c                	jne    80100900 <consoleintr+0x155>
          input.w = input.e;
801008e4:	a1 7c de 10 80       	mov    0x8010de7c,%eax
801008e9:	a3 78 de 10 80       	mov    %eax,0x8010de78
          wakeup(&input.r);
801008ee:	c7 04 24 74 de 10 80 	movl   $0x8010de74,(%esp)
801008f5:	e8 ec 43 00 00       	call   80104ce6 <wakeup>
801008fa:	eb 04                	jmp    80100900 <consoleintr+0x155>
      while(input.e != input.w &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
        consputc(BACKSPACE);
      }
      break;
801008fc:	90                   	nop
801008fd:	eb 01                	jmp    80100900 <consoleintr+0x155>
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
        input.e--;
        consputc(BACKSPACE);
      }
      break;
801008ff:	90                   	nop
consoleintr(int (*getc)(void))
{
  int c;

  acquire(&input.lock);
  while((c = getc()) >= 0){
80100900:	8b 45 08             	mov    0x8(%ebp),%eax
80100903:	ff d0                	call   *%eax
80100905:	89 45 f4             	mov    %eax,-0xc(%ebp)
80100908:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010090c:	0f 89 b0 fe ff ff    	jns    801007c2 <consoleintr+0x17>
        }
      }
      break;
    }
  }
  release(&input.lock);
80100912:	c7 04 24 c0 dd 10 80 	movl   $0x8010ddc0,(%esp)
80100919:	e8 26 46 00 00       	call   80104f44 <release>
}
8010091e:	c9                   	leave  
8010091f:	c3                   	ret    

80100920 <consoleread>:

int
consoleread(struct inode *ip, char *dst, int n)
{
80100920:	55                   	push   %ebp
80100921:	89 e5                	mov    %esp,%ebp
80100923:	83 ec 28             	sub    $0x28,%esp
  uint target;
  int c;

  iunlock(ip);
80100926:	8b 45 08             	mov    0x8(%ebp),%eax
80100929:	89 04 24             	mov    %eax,(%esp)
8010092c:	e8 8f 10 00 00       	call   801019c0 <iunlock>
  target = n;
80100931:	8b 45 10             	mov    0x10(%ebp),%eax
80100934:	89 45 f0             	mov    %eax,-0x10(%ebp)
  acquire(&input.lock);
80100937:	c7 04 24 c0 dd 10 80 	movl   $0x8010ddc0,(%esp)
8010093e:	e8 a0 45 00 00       	call   80104ee3 <acquire>
  while(n > 0){
80100943:	e9 a8 00 00 00       	jmp    801009f0 <consoleread+0xd0>
    while(input.r == input.w){
      if(proc->killed){
80100948:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010094e:	8b 40 24             	mov    0x24(%eax),%eax
80100951:	85 c0                	test   %eax,%eax
80100953:	74 21                	je     80100976 <consoleread+0x56>
        release(&input.lock);
80100955:	c7 04 24 c0 dd 10 80 	movl   $0x8010ddc0,(%esp)
8010095c:	e8 e3 45 00 00       	call   80104f44 <release>
        ilock(ip);
80100961:	8b 45 08             	mov    0x8(%ebp),%eax
80100964:	89 04 24             	mov    %eax,(%esp)
80100967:	e8 03 0f 00 00       	call   8010186f <ilock>
        return -1;
8010096c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100971:	e9 a9 00 00 00       	jmp    80100a1f <consoleread+0xff>
      }
      sleep(&input.r, &input.lock);
80100976:	c7 44 24 04 c0 dd 10 	movl   $0x8010ddc0,0x4(%esp)
8010097d:	80 
8010097e:	c7 04 24 74 de 10 80 	movl   $0x8010de74,(%esp)
80100985:	e8 7f 42 00 00       	call   80104c09 <sleep>
8010098a:	eb 01                	jmp    8010098d <consoleread+0x6d>

  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
    while(input.r == input.w){
8010098c:	90                   	nop
8010098d:	8b 15 74 de 10 80    	mov    0x8010de74,%edx
80100993:	a1 78 de 10 80       	mov    0x8010de78,%eax
80100998:	39 c2                	cmp    %eax,%edx
8010099a:	74 ac                	je     80100948 <consoleread+0x28>
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &input.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
8010099c:	a1 74 de 10 80       	mov    0x8010de74,%eax
801009a1:	89 c2                	mov    %eax,%edx
801009a3:	83 e2 7f             	and    $0x7f,%edx
801009a6:	0f b6 92 f4 dd 10 80 	movzbl -0x7fef220c(%edx),%edx
801009ad:	0f be d2             	movsbl %dl,%edx
801009b0:	89 55 f4             	mov    %edx,-0xc(%ebp)
801009b3:	83 c0 01             	add    $0x1,%eax
801009b6:	a3 74 de 10 80       	mov    %eax,0x8010de74
    if(c == C('D')){  // EOF
801009bb:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
801009bf:	75 17                	jne    801009d8 <consoleread+0xb8>
      if(n < target){
801009c1:	8b 45 10             	mov    0x10(%ebp),%eax
801009c4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
801009c7:	73 2f                	jae    801009f8 <consoleread+0xd8>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
801009c9:	a1 74 de 10 80       	mov    0x8010de74,%eax
801009ce:	83 e8 01             	sub    $0x1,%eax
801009d1:	a3 74 de 10 80       	mov    %eax,0x8010de74
      }
      break;
801009d6:	eb 24                	jmp    801009fc <consoleread+0xdc>
    }
    *dst++ = c;
801009d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801009db:	89 c2                	mov    %eax,%edx
801009dd:	8b 45 0c             	mov    0xc(%ebp),%eax
801009e0:	88 10                	mov    %dl,(%eax)
801009e2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    --n;
801009e6:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    if(c == '\n')
801009ea:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
801009ee:	74 0b                	je     801009fb <consoleread+0xdb>
  int c;

  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
801009f0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801009f4:	7f 96                	jg     8010098c <consoleread+0x6c>
801009f6:	eb 04                	jmp    801009fc <consoleread+0xdc>
      if(n < target){
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
801009f8:	90                   	nop
801009f9:	eb 01                	jmp    801009fc <consoleread+0xdc>
    }
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
801009fb:	90                   	nop
  }
  release(&input.lock);
801009fc:	c7 04 24 c0 dd 10 80 	movl   $0x8010ddc0,(%esp)
80100a03:	e8 3c 45 00 00       	call   80104f44 <release>
  ilock(ip);
80100a08:	8b 45 08             	mov    0x8(%ebp),%eax
80100a0b:	89 04 24             	mov    %eax,(%esp)
80100a0e:	e8 5c 0e 00 00       	call   8010186f <ilock>

  return target - n;
80100a13:	8b 45 10             	mov    0x10(%ebp),%eax
80100a16:	8b 55 f0             	mov    -0x10(%ebp),%edx
80100a19:	89 d1                	mov    %edx,%ecx
80100a1b:	29 c1                	sub    %eax,%ecx
80100a1d:	89 c8                	mov    %ecx,%eax
}
80100a1f:	c9                   	leave  
80100a20:	c3                   	ret    

80100a21 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100a21:	55                   	push   %ebp
80100a22:	89 e5                	mov    %esp,%ebp
80100a24:	83 ec 28             	sub    $0x28,%esp
  int i;

  iunlock(ip);
80100a27:	8b 45 08             	mov    0x8(%ebp),%eax
80100a2a:	89 04 24             	mov    %eax,(%esp)
80100a2d:	e8 8e 0f 00 00       	call   801019c0 <iunlock>
  acquire(&cons.lock);
80100a32:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100a39:	e8 a5 44 00 00       	call   80104ee3 <acquire>
  for(i = 0; i < n; i++)
80100a3e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80100a45:	eb 1d                	jmp    80100a64 <consolewrite+0x43>
    consputc(buf[i] & 0xff);
80100a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100a4a:	03 45 0c             	add    0xc(%ebp),%eax
80100a4d:	0f b6 00             	movzbl (%eax),%eax
80100a50:	0f be c0             	movsbl %al,%eax
80100a53:	25 ff 00 00 00       	and    $0xff,%eax
80100a58:	89 04 24             	mov    %eax,(%esp)
80100a5b:	e8 ee fc ff ff       	call   8010074e <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
80100a60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80100a64:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100a67:	3b 45 10             	cmp    0x10(%ebp),%eax
80100a6a:	7c db                	jl     80100a47 <consolewrite+0x26>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
80100a6c:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100a73:	e8 cc 44 00 00       	call   80104f44 <release>
  ilock(ip);
80100a78:	8b 45 08             	mov    0x8(%ebp),%eax
80100a7b:	89 04 24             	mov    %eax,(%esp)
80100a7e:	e8 ec 0d 00 00       	call   8010186f <ilock>

  return n;
80100a83:	8b 45 10             	mov    0x10(%ebp),%eax
}
80100a86:	c9                   	leave  
80100a87:	c3                   	ret    

80100a88 <consoleinit>:

void
consoleinit(void)
{
80100a88:	55                   	push   %ebp
80100a89:	89 e5                	mov    %esp,%ebp
80100a8b:	83 ec 18             	sub    $0x18,%esp
  initlock(&cons.lock, "console");
80100a8e:	c7 44 24 04 c3 85 10 	movl   $0x801085c3,0x4(%esp)
80100a95:	80 
80100a96:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100a9d:	e8 20 44 00 00       	call   80104ec2 <initlock>
  initlock(&input.lock, "input");
80100aa2:	c7 44 24 04 cb 85 10 	movl   $0x801085cb,0x4(%esp)
80100aa9:	80 
80100aaa:	c7 04 24 c0 dd 10 80 	movl   $0x8010ddc0,(%esp)
80100ab1:	e8 0c 44 00 00       	call   80104ec2 <initlock>

  devsw[CONSOLE].write = consolewrite;
80100ab6:	c7 05 2c e8 10 80 21 	movl   $0x80100a21,0x8010e82c
80100abd:	0a 10 80 
  devsw[CONSOLE].read = consoleread;
80100ac0:	c7 05 28 e8 10 80 20 	movl   $0x80100920,0x8010e828
80100ac7:	09 10 80 
  cons.locking = 1;
80100aca:	c7 05 14 b6 10 80 01 	movl   $0x1,0x8010b614
80100ad1:	00 00 00 

  picenable(IRQ_KBD);
80100ad4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80100adb:	e8 a1 2f 00 00       	call   80103a81 <picenable>
  ioapicenable(IRQ_KBD, 0);
80100ae0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100ae7:	00 
80100ae8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80100aef:	e8 7e 1e 00 00       	call   80102972 <ioapicenable>
}
80100af4:	c9                   	leave  
80100af5:	c3                   	ret    
	...

80100af8 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100af8:	55                   	push   %ebp
80100af9:	89 e5                	mov    %esp,%ebp
80100afb:	81 ec 38 01 00 00    	sub    $0x138,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  if((ip = namei(path)) == 0)
80100b01:	8b 45 08             	mov    0x8(%ebp),%eax
80100b04:	89 04 24             	mov    %eax,(%esp)
80100b07:	e8 0b 19 00 00       	call   80102417 <namei>
80100b0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
80100b0f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80100b13:	75 0a                	jne    80100b1f <exec+0x27>
    return -1;
80100b15:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b1a:	e9 d8 03 00 00       	jmp    80100ef7 <exec+0x3ff>
  ilock(ip);
80100b1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100b22:	89 04 24             	mov    %eax,(%esp)
80100b25:	e8 45 0d 00 00       	call   8010186f <ilock>
  pgdir = 0;
80100b2a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
80100b31:	8d 85 0c ff ff ff    	lea    -0xf4(%ebp),%eax
80100b37:	c7 44 24 0c 34 00 00 	movl   $0x34,0xc(%esp)
80100b3e:	00 
80100b3f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80100b46:	00 
80100b47:	89 44 24 04          	mov    %eax,0x4(%esp)
80100b4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100b4e:	89 04 24             	mov    %eax,(%esp)
80100b51:	e8 12 12 00 00       	call   80101d68 <readi>
80100b56:	83 f8 33             	cmp    $0x33,%eax
80100b59:	0f 86 52 03 00 00    	jbe    80100eb1 <exec+0x3b9>
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100b5f:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b65:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
80100b6a:	0f 85 44 03 00 00    	jne    80100eb4 <exec+0x3bc>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100b70:	e8 98 71 00 00       	call   80107d0d <setupkvm>
80100b75:	89 45 f0             	mov    %eax,-0x10(%ebp)
80100b78:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80100b7c:	0f 84 35 03 00 00    	je     80100eb7 <exec+0x3bf>
    goto bad;

  // Load program into memory.
  sz = 0;
80100b82:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b89:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
80100b90:	8b 85 28 ff ff ff    	mov    -0xd8(%ebp),%eax
80100b96:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100b99:	e9 ca 00 00 00       	jmp    80100c68 <exec+0x170>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100b9e:	8b 55 dc             	mov    -0x24(%ebp),%edx
80100ba1:	8d 85 ec fe ff ff    	lea    -0x114(%ebp),%eax
80100ba7:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
80100bae:	00 
80100baf:	89 54 24 08          	mov    %edx,0x8(%esp)
80100bb3:	89 44 24 04          	mov    %eax,0x4(%esp)
80100bb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100bba:	89 04 24             	mov    %eax,(%esp)
80100bbd:	e8 a6 11 00 00       	call   80101d68 <readi>
80100bc2:	83 f8 20             	cmp    $0x20,%eax
80100bc5:	0f 85 ef 02 00 00    	jne    80100eba <exec+0x3c2>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100bcb:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100bd1:	83 f8 01             	cmp    $0x1,%eax
80100bd4:	0f 85 80 00 00 00    	jne    80100c5a <exec+0x162>
      continue;
    if(ph.memsz < ph.filesz)
80100bda:	8b 95 00 ff ff ff    	mov    -0x100(%ebp),%edx
80100be0:	8b 85 fc fe ff ff    	mov    -0x104(%ebp),%eax
80100be6:	39 c2                	cmp    %eax,%edx
80100be8:	0f 82 cf 02 00 00    	jb     80100ebd <exec+0x3c5>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100bee:	8b 95 f4 fe ff ff    	mov    -0x10c(%ebp),%edx
80100bf4:	8b 85 00 ff ff ff    	mov    -0x100(%ebp),%eax
80100bfa:	8d 04 02             	lea    (%edx,%eax,1),%eax
80100bfd:	89 44 24 08          	mov    %eax,0x8(%esp)
80100c01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100c04:	89 44 24 04          	mov    %eax,0x4(%esp)
80100c08:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100c0b:	89 04 24             	mov    %eax,(%esp)
80100c0e:	e8 ce 74 00 00       	call   801080e1 <allocuvm>
80100c13:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100c16:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80100c1a:	0f 84 a0 02 00 00    	je     80100ec0 <exec+0x3c8>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100c20:	8b 8d fc fe ff ff    	mov    -0x104(%ebp),%ecx
80100c26:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
80100c2c:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100c32:	89 4c 24 10          	mov    %ecx,0x10(%esp)
80100c36:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100c3a:	8b 55 ec             	mov    -0x14(%ebp),%edx
80100c3d:	89 54 24 08          	mov    %edx,0x8(%esp)
80100c41:	89 44 24 04          	mov    %eax,0x4(%esp)
80100c45:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100c48:	89 04 24             	mov    %eax,(%esp)
80100c4b:	e8 a1 73 00 00       	call   80107ff1 <loaduvm>
80100c50:	85 c0                	test   %eax,%eax
80100c52:	0f 88 6b 02 00 00    	js     80100ec3 <exec+0x3cb>
80100c58:	eb 01                	jmp    80100c5b <exec+0x163>
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
      continue;
80100c5a:	90                   	nop
  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100c5b:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
80100c5f:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100c62:	83 c0 20             	add    $0x20,%eax
80100c65:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100c68:	0f b7 85 38 ff ff ff 	movzwl -0xc8(%ebp),%eax
80100c6f:	0f b7 c0             	movzwl %ax,%eax
80100c72:	3b 45 d8             	cmp    -0x28(%ebp),%eax
80100c75:	0f 8f 23 ff ff ff    	jg     80100b9e <exec+0xa6>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100c7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100c7e:	89 04 24             	mov    %eax,(%esp)
80100c81:	e8 70 0e 00 00       	call   80101af6 <iunlockput>
  ip = 0;
80100c86:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100c8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100c90:	05 ff 0f 00 00       	add    $0xfff,%eax
80100c95:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100c9a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ca0:	05 00 20 00 00       	add    $0x2000,%eax
80100ca5:	89 44 24 08          	mov    %eax,0x8(%esp)
80100ca9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100cac:	89 44 24 04          	mov    %eax,0x4(%esp)
80100cb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100cb3:	89 04 24             	mov    %eax,(%esp)
80100cb6:	e8 26 74 00 00       	call   801080e1 <allocuvm>
80100cbb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100cbe:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80100cc2:	0f 84 fe 01 00 00    	je     80100ec6 <exec+0x3ce>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100cc8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ccb:	2d 00 20 00 00       	sub    $0x2000,%eax
80100cd0:	89 44 24 04          	mov    %eax,0x4(%esp)
80100cd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100cd7:	89 04 24             	mov    %eax,(%esp)
80100cda:	e8 26 76 00 00       	call   80108305 <clearpteu>
  sp = sz;
80100cdf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ce2:	89 45 e8             	mov    %eax,-0x18(%ebp)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100ce5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80100cec:	e9 81 00 00 00       	jmp    80100d72 <exec+0x27a>
    if(argc >= MAXARG)
80100cf1:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
80100cf5:	0f 87 ce 01 00 00    	ja     80100ec9 <exec+0x3d1>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100cfb:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100cfe:	c1 e0 02             	shl    $0x2,%eax
80100d01:	03 45 0c             	add    0xc(%ebp),%eax
80100d04:	8b 00                	mov    (%eax),%eax
80100d06:	89 04 24             	mov    %eax,(%esp)
80100d09:	e8 a5 46 00 00       	call   801053b3 <strlen>
80100d0e:	f7 d0                	not    %eax
80100d10:	03 45 e8             	add    -0x18(%ebp),%eax
80100d13:	83 e0 fc             	and    $0xfffffffc,%eax
80100d16:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100d19:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d1c:	c1 e0 02             	shl    $0x2,%eax
80100d1f:	03 45 0c             	add    0xc(%ebp),%eax
80100d22:	8b 00                	mov    (%eax),%eax
80100d24:	89 04 24             	mov    %eax,(%esp)
80100d27:	e8 87 46 00 00       	call   801053b3 <strlen>
80100d2c:	83 c0 01             	add    $0x1,%eax
80100d2f:	89 c2                	mov    %eax,%edx
80100d31:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d34:	c1 e0 02             	shl    $0x2,%eax
80100d37:	03 45 0c             	add    0xc(%ebp),%eax
80100d3a:	8b 00                	mov    (%eax),%eax
80100d3c:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100d40:	89 44 24 08          	mov    %eax,0x8(%esp)
80100d44:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100d47:	89 44 24 04          	mov    %eax,0x4(%esp)
80100d4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100d4e:	89 04 24             	mov    %eax,(%esp)
80100d51:	e8 74 77 00 00       	call   801084ca <copyout>
80100d56:	85 c0                	test   %eax,%eax
80100d58:	0f 88 6e 01 00 00    	js     80100ecc <exec+0x3d4>
      goto bad;
    ustack[3+argc] = sp;
80100d5e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d61:	8d 50 03             	lea    0x3(%eax),%edx
80100d64:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100d67:	89 84 95 40 ff ff ff 	mov    %eax,-0xc0(%ebp,%edx,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100d6e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
80100d72:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d75:	c1 e0 02             	shl    $0x2,%eax
80100d78:	03 45 0c             	add    0xc(%ebp),%eax
80100d7b:	8b 00                	mov    (%eax),%eax
80100d7d:	85 c0                	test   %eax,%eax
80100d7f:	0f 85 6c ff ff ff    	jne    80100cf1 <exec+0x1f9>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100d85:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100d88:	83 c0 03             	add    $0x3,%eax
80100d8b:	c7 84 85 40 ff ff ff 	movl   $0x0,-0xc0(%ebp,%eax,4)
80100d92:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100d96:	c7 85 40 ff ff ff ff 	movl   $0xffffffff,-0xc0(%ebp)
80100d9d:	ff ff ff 
  ustack[1] = argc;
80100da0:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100da3:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100da9:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100dac:	83 c0 01             	add    $0x1,%eax
80100daf:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80100db6:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100db9:	29 d0                	sub    %edx,%eax
80100dbb:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%ebp)

  sp -= (3+argc+1) * 4;
80100dc1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100dc4:	83 c0 04             	add    $0x4,%eax
80100dc7:	c1 e0 02             	shl    $0x2,%eax
80100dca:	29 45 e8             	sub    %eax,-0x18(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100dcd:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100dd0:	83 c0 04             	add    $0x4,%eax
80100dd3:	c1 e0 02             	shl    $0x2,%eax
80100dd6:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100dda:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
80100de0:	89 44 24 08          	mov    %eax,0x8(%esp)
80100de4:	8b 45 e8             	mov    -0x18(%ebp),%eax
80100de7:	89 44 24 04          	mov    %eax,0x4(%esp)
80100deb:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100dee:	89 04 24             	mov    %eax,(%esp)
80100df1:	e8 d4 76 00 00       	call   801084ca <copyout>
80100df6:	85 c0                	test   %eax,%eax
80100df8:	0f 88 d1 00 00 00    	js     80100ecf <exec+0x3d7>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100dfe:	8b 45 08             	mov    0x8(%ebp),%eax
80100e01:	89 45 d0             	mov    %eax,-0x30(%ebp)
80100e04:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100e07:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80100e0a:	eb 17                	jmp    80100e23 <exec+0x32b>
    if(*s == '/')
80100e0c:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100e0f:	0f b6 00             	movzbl (%eax),%eax
80100e12:	3c 2f                	cmp    $0x2f,%al
80100e14:	75 09                	jne    80100e1f <exec+0x327>
      last = s+1;
80100e16:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100e19:	83 c0 01             	add    $0x1,%eax
80100e1c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100e1f:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
80100e23:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100e26:	0f b6 00             	movzbl (%eax),%eax
80100e29:	84 c0                	test   %al,%al
80100e2b:	75 df                	jne    80100e0c <exec+0x314>
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
80100e2d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e33:	8d 50 6c             	lea    0x6c(%eax),%edx
80100e36:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80100e3d:	00 
80100e3e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80100e41:	89 44 24 04          	mov    %eax,0x4(%esp)
80100e45:	89 14 24             	mov    %edx,(%esp)
80100e48:	e8 18 45 00 00       	call   80105365 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100e4d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e53:	8b 40 04             	mov    0x4(%eax),%eax
80100e56:	89 45 f4             	mov    %eax,-0xc(%ebp)
  proc->pgdir = pgdir;
80100e59:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e5f:	8b 55 f0             	mov    -0x10(%ebp),%edx
80100e62:	89 50 04             	mov    %edx,0x4(%eax)
  proc->sz = sz;
80100e65:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e6b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100e6e:	89 10                	mov    %edx,(%eax)
  proc->tf->eip = elf.entry;  // main
80100e70:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e76:	8b 40 18             	mov    0x18(%eax),%eax
80100e79:	8b 95 24 ff ff ff    	mov    -0xdc(%ebp),%edx
80100e7f:	89 50 38             	mov    %edx,0x38(%eax)
  proc->tf->esp = sp;
80100e82:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e88:	8b 40 18             	mov    0x18(%eax),%eax
80100e8b:	8b 55 e8             	mov    -0x18(%ebp),%edx
80100e8e:	89 50 44             	mov    %edx,0x44(%eax)
  switchuvm(proc);
80100e91:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e97:	89 04 24             	mov    %eax,(%esp)
80100e9a:	e8 60 6f 00 00       	call   80107dff <switchuvm>
  freevm(oldpgdir);
80100e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100ea2:	89 04 24             	mov    %eax,(%esp)
80100ea5:	e8 cd 73 00 00       	call   80108277 <freevm>
  return 0;
80100eaa:	b8 00 00 00 00       	mov    $0x0,%eax
80100eaf:	eb 46                	jmp    80100ef7 <exec+0x3ff>
  ilock(ip);
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
    goto bad;
80100eb1:	90                   	nop
80100eb2:	eb 1c                	jmp    80100ed0 <exec+0x3d8>
  if(elf.magic != ELF_MAGIC)
    goto bad;
80100eb4:	90                   	nop
80100eb5:	eb 19                	jmp    80100ed0 <exec+0x3d8>

  if((pgdir = setupkvm()) == 0)
    goto bad;
80100eb7:	90                   	nop
80100eb8:	eb 16                	jmp    80100ed0 <exec+0x3d8>

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
80100eba:	90                   	nop
80100ebb:	eb 13                	jmp    80100ed0 <exec+0x3d8>
    if(ph.type != ELF_PROG_LOAD)
      continue;
    if(ph.memsz < ph.filesz)
      goto bad;
80100ebd:	90                   	nop
80100ebe:	eb 10                	jmp    80100ed0 <exec+0x3d8>
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
      goto bad;
80100ec0:	90                   	nop
80100ec1:	eb 0d                	jmp    80100ed0 <exec+0x3d8>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
80100ec3:	90                   	nop
80100ec4:	eb 0a                	jmp    80100ed0 <exec+0x3d8>

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
80100ec6:	90                   	nop
80100ec7:	eb 07                	jmp    80100ed0 <exec+0x3d8>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
80100ec9:	90                   	nop
80100eca:	eb 04                	jmp    80100ed0 <exec+0x3d8>
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
80100ecc:	90                   	nop
80100ecd:	eb 01                	jmp    80100ed0 <exec+0x3d8>
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;
80100ecf:	90                   	nop
  switchuvm(proc);
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
80100ed0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80100ed4:	74 0b                	je     80100ee1 <exec+0x3e9>
    freevm(pgdir);
80100ed6:	8b 45 f0             	mov    -0x10(%ebp),%eax
80100ed9:	89 04 24             	mov    %eax,(%esp)
80100edc:	e8 96 73 00 00       	call   80108277 <freevm>
  if(ip)
80100ee1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80100ee5:	74 0b                	je     80100ef2 <exec+0x3fa>
    iunlockput(ip);
80100ee7:	8b 45 ec             	mov    -0x14(%ebp),%eax
80100eea:	89 04 24             	mov    %eax,(%esp)
80100eed:	e8 04 0c 00 00       	call   80101af6 <iunlockput>
  return -1;
80100ef2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100ef7:	c9                   	leave  
80100ef8:	c3                   	ret    
80100ef9:	00 00                	add    %al,(%eax)
	...

80100efc <fileinit>:
80100efc:	55                   	push   %ebp
80100efd:	89 e5                	mov    %esp,%ebp
80100eff:	83 ec 18             	sub    $0x18,%esp
80100f02:	c7 44 24 04 d1 85 10 	movl   $0x801085d1,0x4(%esp)
80100f09:	80 
80100f0a:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100f11:	e8 ac 3f 00 00       	call   80104ec2 <initlock>
80100f16:	c9                   	leave  
80100f17:	c3                   	ret    

80100f18 <filealloc>:
80100f18:	55                   	push   %ebp
80100f19:	89 e5                	mov    %esp,%ebp
80100f1b:	83 ec 28             	sub    $0x28,%esp
80100f1e:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100f25:	e8 b9 3f 00 00       	call   80104ee3 <acquire>
80100f2a:	c7 45 f4 b4 de 10 80 	movl   $0x8010deb4,-0xc(%ebp)
80100f31:	eb 29                	jmp    80100f5c <filealloc+0x44>
80100f33:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f36:	8b 40 04             	mov    0x4(%eax),%eax
80100f39:	85 c0                	test   %eax,%eax
80100f3b:	75 1b                	jne    80100f58 <filealloc+0x40>
80100f3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f40:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
80100f47:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100f4e:	e8 f1 3f 00 00       	call   80104f44 <release>
80100f53:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f56:	eb 1f                	jmp    80100f77 <filealloc+0x5f>
80100f58:	83 45 f4 18          	addl   $0x18,-0xc(%ebp)
80100f5c:	b8 14 e8 10 80       	mov    $0x8010e814,%eax
80100f61:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80100f64:	72 cd                	jb     80100f33 <filealloc+0x1b>
80100f66:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100f6d:	e8 d2 3f 00 00       	call   80104f44 <release>
80100f72:	b8 00 00 00 00       	mov    $0x0,%eax
80100f77:	c9                   	leave  
80100f78:	c3                   	ret    

80100f79 <filedup>:
80100f79:	55                   	push   %ebp
80100f7a:	89 e5                	mov    %esp,%ebp
80100f7c:	83 ec 18             	sub    $0x18,%esp
80100f7f:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100f86:	e8 58 3f 00 00       	call   80104ee3 <acquire>
80100f8b:	8b 45 08             	mov    0x8(%ebp),%eax
80100f8e:	8b 40 04             	mov    0x4(%eax),%eax
80100f91:	85 c0                	test   %eax,%eax
80100f93:	7f 0c                	jg     80100fa1 <filedup+0x28>
80100f95:	c7 04 24 d8 85 10 80 	movl   $0x801085d8,(%esp)
80100f9c:	e8 99 f5 ff ff       	call   8010053a <panic>
80100fa1:	8b 45 08             	mov    0x8(%ebp),%eax
80100fa4:	8b 40 04             	mov    0x4(%eax),%eax
80100fa7:	8d 50 01             	lea    0x1(%eax),%edx
80100faa:	8b 45 08             	mov    0x8(%ebp),%eax
80100fad:	89 50 04             	mov    %edx,0x4(%eax)
80100fb0:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100fb7:	e8 88 3f 00 00       	call   80104f44 <release>
80100fbc:	8b 45 08             	mov    0x8(%ebp),%eax
80100fbf:	c9                   	leave  
80100fc0:	c3                   	ret    

80100fc1 <fileclose>:
80100fc1:	55                   	push   %ebp
80100fc2:	89 e5                	mov    %esp,%ebp
80100fc4:	83 ec 38             	sub    $0x38,%esp
80100fc7:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100fce:	e8 10 3f 00 00       	call   80104ee3 <acquire>
80100fd3:	8b 45 08             	mov    0x8(%ebp),%eax
80100fd6:	8b 40 04             	mov    0x4(%eax),%eax
80100fd9:	85 c0                	test   %eax,%eax
80100fdb:	7f 0c                	jg     80100fe9 <fileclose+0x28>
80100fdd:	c7 04 24 e0 85 10 80 	movl   $0x801085e0,(%esp)
80100fe4:	e8 51 f5 ff ff       	call   8010053a <panic>
80100fe9:	8b 45 08             	mov    0x8(%ebp),%eax
80100fec:	8b 40 04             	mov    0x4(%eax),%eax
80100fef:	8d 50 ff             	lea    -0x1(%eax),%edx
80100ff2:	8b 45 08             	mov    0x8(%ebp),%eax
80100ff5:	89 50 04             	mov    %edx,0x4(%eax)
80100ff8:	8b 45 08             	mov    0x8(%ebp),%eax
80100ffb:	8b 40 04             	mov    0x4(%eax),%eax
80100ffe:	85 c0                	test   %eax,%eax
80101000:	7e 11                	jle    80101013 <fileclose+0x52>
80101002:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80101009:	e8 36 3f 00 00       	call   80104f44 <release>
8010100e:	e9 82 00 00 00       	jmp    80101095 <fileclose+0xd4>
80101013:	8b 45 08             	mov    0x8(%ebp),%eax
80101016:	8b 10                	mov    (%eax),%edx
80101018:	89 55 e0             	mov    %edx,-0x20(%ebp)
8010101b:	8b 50 04             	mov    0x4(%eax),%edx
8010101e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101021:	8b 50 08             	mov    0x8(%eax),%edx
80101024:	89 55 e8             	mov    %edx,-0x18(%ebp)
80101027:	8b 50 0c             	mov    0xc(%eax),%edx
8010102a:	89 55 ec             	mov    %edx,-0x14(%ebp)
8010102d:	8b 50 10             	mov    0x10(%eax),%edx
80101030:	89 55 f0             	mov    %edx,-0x10(%ebp)
80101033:	8b 40 14             	mov    0x14(%eax),%eax
80101036:	89 45 f4             	mov    %eax,-0xc(%ebp)
80101039:	8b 45 08             	mov    0x8(%ebp),%eax
8010103c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
80101043:	8b 45 08             	mov    0x8(%ebp),%eax
80101046:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010104c:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80101053:	e8 ec 3e 00 00       	call   80104f44 <release>
80101058:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010105b:	83 f8 01             	cmp    $0x1,%eax
8010105e:	75 18                	jne    80101078 <fileclose+0xb7>
80101060:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
80101064:	0f be d0             	movsbl %al,%edx
80101067:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010106a:	89 54 24 04          	mov    %edx,0x4(%esp)
8010106e:	89 04 24             	mov    %eax,(%esp)
80101071:	e8 c5 2c 00 00       	call   80103d3b <pipeclose>
80101076:	eb 1d                	jmp    80101095 <fileclose+0xd4>
80101078:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010107b:	83 f8 02             	cmp    $0x2,%eax
8010107e:	75 15                	jne    80101095 <fileclose+0xd4>
80101080:	e8 81 21 00 00       	call   80103206 <begin_trans>
80101085:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101088:	89 04 24             	mov    %eax,(%esp)
8010108b:	e8 95 09 00 00       	call   80101a25 <iput>
80101090:	e8 ba 21 00 00       	call   8010324f <commit_trans>
80101095:	c9                   	leave  
80101096:	c3                   	ret    

80101097 <filestat>:
80101097:	55                   	push   %ebp
80101098:	89 e5                	mov    %esp,%ebp
8010109a:	83 ec 18             	sub    $0x18,%esp
8010109d:	8b 45 08             	mov    0x8(%ebp),%eax
801010a0:	8b 00                	mov    (%eax),%eax
801010a2:	83 f8 02             	cmp    $0x2,%eax
801010a5:	75 38                	jne    801010df <filestat+0x48>
801010a7:	8b 45 08             	mov    0x8(%ebp),%eax
801010aa:	8b 40 10             	mov    0x10(%eax),%eax
801010ad:	89 04 24             	mov    %eax,(%esp)
801010b0:	e8 ba 07 00 00       	call   8010186f <ilock>
801010b5:	8b 45 08             	mov    0x8(%ebp),%eax
801010b8:	8b 40 10             	mov    0x10(%eax),%eax
801010bb:	8b 55 0c             	mov    0xc(%ebp),%edx
801010be:	89 54 24 04          	mov    %edx,0x4(%esp)
801010c2:	89 04 24             	mov    %eax,(%esp)
801010c5:	e8 59 0c 00 00       	call   80101d23 <stati>
801010ca:	8b 45 08             	mov    0x8(%ebp),%eax
801010cd:	8b 40 10             	mov    0x10(%eax),%eax
801010d0:	89 04 24             	mov    %eax,(%esp)
801010d3:	e8 e8 08 00 00       	call   801019c0 <iunlock>
801010d8:	b8 00 00 00 00       	mov    $0x0,%eax
801010dd:	eb 05                	jmp    801010e4 <filestat+0x4d>
801010df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010e4:	c9                   	leave  
801010e5:	c3                   	ret    

801010e6 <fileread>:
801010e6:	55                   	push   %ebp
801010e7:	89 e5                	mov    %esp,%ebp
801010e9:	83 ec 28             	sub    $0x28,%esp
801010ec:	8b 45 08             	mov    0x8(%ebp),%eax
801010ef:	0f b6 40 08          	movzbl 0x8(%eax),%eax
801010f3:	84 c0                	test   %al,%al
801010f5:	75 0a                	jne    80101101 <fileread+0x1b>
801010f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010fc:	e9 9f 00 00 00       	jmp    801011a0 <fileread+0xba>
80101101:	8b 45 08             	mov    0x8(%ebp),%eax
80101104:	8b 00                	mov    (%eax),%eax
80101106:	83 f8 01             	cmp    $0x1,%eax
80101109:	75 1e                	jne    80101129 <fileread+0x43>
8010110b:	8b 45 08             	mov    0x8(%ebp),%eax
8010110e:	8b 40 0c             	mov    0xc(%eax),%eax
80101111:	8b 55 10             	mov    0x10(%ebp),%edx
80101114:	89 54 24 08          	mov    %edx,0x8(%esp)
80101118:	8b 55 0c             	mov    0xc(%ebp),%edx
8010111b:	89 54 24 04          	mov    %edx,0x4(%esp)
8010111f:	89 04 24             	mov    %eax,(%esp)
80101122:	e8 96 2d 00 00       	call   80103ebd <piperead>
80101127:	eb 77                	jmp    801011a0 <fileread+0xba>
80101129:	8b 45 08             	mov    0x8(%ebp),%eax
8010112c:	8b 00                	mov    (%eax),%eax
8010112e:	83 f8 02             	cmp    $0x2,%eax
80101131:	75 61                	jne    80101194 <fileread+0xae>
80101133:	8b 45 08             	mov    0x8(%ebp),%eax
80101136:	8b 40 10             	mov    0x10(%eax),%eax
80101139:	89 04 24             	mov    %eax,(%esp)
8010113c:	e8 2e 07 00 00       	call   8010186f <ilock>
80101141:	8b 4d 10             	mov    0x10(%ebp),%ecx
80101144:	8b 45 08             	mov    0x8(%ebp),%eax
80101147:	8b 50 14             	mov    0x14(%eax),%edx
8010114a:	8b 45 08             	mov    0x8(%ebp),%eax
8010114d:	8b 40 10             	mov    0x10(%eax),%eax
80101150:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
80101154:	89 54 24 08          	mov    %edx,0x8(%esp)
80101158:	8b 55 0c             	mov    0xc(%ebp),%edx
8010115b:	89 54 24 04          	mov    %edx,0x4(%esp)
8010115f:	89 04 24             	mov    %eax,(%esp)
80101162:	e8 01 0c 00 00       	call   80101d68 <readi>
80101167:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010116a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010116e:	7e 11                	jle    80101181 <fileread+0x9b>
80101170:	8b 45 08             	mov    0x8(%ebp),%eax
80101173:	8b 50 14             	mov    0x14(%eax),%edx
80101176:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101179:	01 c2                	add    %eax,%edx
8010117b:	8b 45 08             	mov    0x8(%ebp),%eax
8010117e:	89 50 14             	mov    %edx,0x14(%eax)
80101181:	8b 45 08             	mov    0x8(%ebp),%eax
80101184:	8b 40 10             	mov    0x10(%eax),%eax
80101187:	89 04 24             	mov    %eax,(%esp)
8010118a:	e8 31 08 00 00       	call   801019c0 <iunlock>
8010118f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101192:	eb 0c                	jmp    801011a0 <fileread+0xba>
80101194:	c7 04 24 ea 85 10 80 	movl   $0x801085ea,(%esp)
8010119b:	e8 9a f3 ff ff       	call   8010053a <panic>
801011a0:	c9                   	leave  
801011a1:	c3                   	ret    

801011a2 <filewrite>:
801011a2:	55                   	push   %ebp
801011a3:	89 e5                	mov    %esp,%ebp
801011a5:	53                   	push   %ebx
801011a6:	83 ec 24             	sub    $0x24,%esp
801011a9:	8b 45 08             	mov    0x8(%ebp),%eax
801011ac:	0f b6 40 09          	movzbl 0x9(%eax),%eax
801011b0:	84 c0                	test   %al,%al
801011b2:	75 0a                	jne    801011be <filewrite+0x1c>
801011b4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801011b9:	e9 23 01 00 00       	jmp    801012e1 <filewrite+0x13f>
801011be:	8b 45 08             	mov    0x8(%ebp),%eax
801011c1:	8b 00                	mov    (%eax),%eax
801011c3:	83 f8 01             	cmp    $0x1,%eax
801011c6:	75 21                	jne    801011e9 <filewrite+0x47>
801011c8:	8b 45 08             	mov    0x8(%ebp),%eax
801011cb:	8b 40 0c             	mov    0xc(%eax),%eax
801011ce:	8b 55 10             	mov    0x10(%ebp),%edx
801011d1:	89 54 24 08          	mov    %edx,0x8(%esp)
801011d5:	8b 55 0c             	mov    0xc(%ebp),%edx
801011d8:	89 54 24 04          	mov    %edx,0x4(%esp)
801011dc:	89 04 24             	mov    %eax,(%esp)
801011df:	e8 e9 2b 00 00       	call   80103dcd <pipewrite>
801011e4:	e9 f8 00 00 00       	jmp    801012e1 <filewrite+0x13f>
801011e9:	8b 45 08             	mov    0x8(%ebp),%eax
801011ec:	8b 00                	mov    (%eax),%eax
801011ee:	83 f8 02             	cmp    $0x2,%eax
801011f1:	0f 85 de 00 00 00    	jne    801012d5 <filewrite+0x133>
801011f7:	c7 45 ec 00 06 00 00 	movl   $0x600,-0x14(%ebp)
801011fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
80101205:	e9 a8 00 00 00       	jmp    801012b2 <filewrite+0x110>
8010120a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010120d:	8b 55 10             	mov    0x10(%ebp),%edx
80101210:	89 d1                	mov    %edx,%ecx
80101212:	29 c1                	sub    %eax,%ecx
80101214:	89 c8                	mov    %ecx,%eax
80101216:	89 45 f4             	mov    %eax,-0xc(%ebp)
80101219:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010121c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
8010121f:	7e 06                	jle    80101227 <filewrite+0x85>
80101221:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101224:	89 45 f4             	mov    %eax,-0xc(%ebp)
80101227:	e8 da 1f 00 00       	call   80103206 <begin_trans>
8010122c:	8b 45 08             	mov    0x8(%ebp),%eax
8010122f:	8b 40 10             	mov    0x10(%eax),%eax
80101232:	89 04 24             	mov    %eax,(%esp)
80101235:	e8 35 06 00 00       	call   8010186f <ilock>
8010123a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010123d:	8b 45 08             	mov    0x8(%ebp),%eax
80101240:	8b 48 14             	mov    0x14(%eax),%ecx
80101243:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101246:	89 c2                	mov    %eax,%edx
80101248:	03 55 0c             	add    0xc(%ebp),%edx
8010124b:	8b 45 08             	mov    0x8(%ebp),%eax
8010124e:	8b 40 10             	mov    0x10(%eax),%eax
80101251:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
80101255:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80101259:	89 54 24 04          	mov    %edx,0x4(%esp)
8010125d:	89 04 24             	mov    %eax,(%esp)
80101260:	e8 6f 0c 00 00       	call   80101ed4 <writei>
80101265:	89 45 e8             	mov    %eax,-0x18(%ebp)
80101268:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
8010126c:	7e 11                	jle    8010127f <filewrite+0xdd>
8010126e:	8b 45 08             	mov    0x8(%ebp),%eax
80101271:	8b 50 14             	mov    0x14(%eax),%edx
80101274:	8b 45 e8             	mov    -0x18(%ebp),%eax
80101277:	01 c2                	add    %eax,%edx
80101279:	8b 45 08             	mov    0x8(%ebp),%eax
8010127c:	89 50 14             	mov    %edx,0x14(%eax)
8010127f:	8b 45 08             	mov    0x8(%ebp),%eax
80101282:	8b 40 10             	mov    0x10(%eax),%eax
80101285:	89 04 24             	mov    %eax,(%esp)
80101288:	e8 33 07 00 00       	call   801019c0 <iunlock>
8010128d:	e8 bd 1f 00 00       	call   8010324f <commit_trans>
80101292:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80101296:	78 28                	js     801012c0 <filewrite+0x11e>
80101298:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010129b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010129e:	74 0c                	je     801012ac <filewrite+0x10a>
801012a0:	c7 04 24 f3 85 10 80 	movl   $0x801085f3,(%esp)
801012a7:	e8 8e f2 ff ff       	call   8010053a <panic>
801012ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
801012af:	01 45 f0             	add    %eax,-0x10(%ebp)
801012b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801012b5:	3b 45 10             	cmp    0x10(%ebp),%eax
801012b8:	0f 8c 4c ff ff ff    	jl     8010120a <filewrite+0x68>
801012be:	eb 01                	jmp    801012c1 <filewrite+0x11f>
801012c0:	90                   	nop
801012c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801012c4:	3b 45 10             	cmp    0x10(%ebp),%eax
801012c7:	75 05                	jne    801012ce <filewrite+0x12c>
801012c9:	8b 45 10             	mov    0x10(%ebp),%eax
801012cc:	eb 05                	jmp    801012d3 <filewrite+0x131>
801012ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801012d3:	eb 0c                	jmp    801012e1 <filewrite+0x13f>
801012d5:	c7 04 24 03 86 10 80 	movl   $0x80108603,(%esp)
801012dc:	e8 59 f2 ff ff       	call   8010053a <panic>
801012e1:	83 c4 24             	add    $0x24,%esp
801012e4:	5b                   	pop    %ebx
801012e5:	5d                   	pop    %ebp
801012e6:	c3                   	ret    
	...

801012e8 <readsb>:
static void itrunc(struct inode*);

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801012e8:	55                   	push   %ebp
801012e9:	89 e5                	mov    %esp,%ebp
801012eb:	83 ec 28             	sub    $0x28,%esp
  struct buf *bp;
  
  bp = bread(dev, 1);
801012ee:	8b 45 08             	mov    0x8(%ebp),%eax
801012f1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801012f8:	00 
801012f9:	89 04 24             	mov    %eax,(%esp)
801012fc:	e8 a6 ee ff ff       	call   801001a7 <bread>
80101301:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memmove(sb, bp->data, sizeof(*sb));
80101304:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101307:	83 c0 18             	add    $0x18,%eax
8010130a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80101311:	00 
80101312:	89 44 24 04          	mov    %eax,0x4(%esp)
80101316:	8b 45 0c             	mov    0xc(%ebp),%eax
80101319:	89 04 24             	mov    %eax,(%esp)
8010131c:	e8 e4 3e 00 00       	call   80105205 <memmove>
  brelse(bp);
80101321:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101324:	89 04 24             	mov    %eax,(%esp)
80101327:	e8 ec ee ff ff       	call   80100218 <brelse>
}
8010132c:	c9                   	leave  
8010132d:	c3                   	ret    

8010132e <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
8010132e:	55                   	push   %ebp
8010132f:	89 e5                	mov    %esp,%ebp
80101331:	83 ec 28             	sub    $0x28,%esp
  struct buf *bp;
  
  bp = bread(dev, bno);
80101334:	8b 55 0c             	mov    0xc(%ebp),%edx
80101337:	8b 45 08             	mov    0x8(%ebp),%eax
8010133a:	89 54 24 04          	mov    %edx,0x4(%esp)
8010133e:	89 04 24             	mov    %eax,(%esp)
80101341:	e8 61 ee ff ff       	call   801001a7 <bread>
80101346:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(bp->data, 0, BSIZE);
80101349:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010134c:	83 c0 18             	add    $0x18,%eax
8010134f:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80101356:	00 
80101357:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010135e:	00 
8010135f:	89 04 24             	mov    %eax,(%esp)
80101362:	e8 cb 3d 00 00       	call   80105132 <memset>
  log_write(bp);
80101367:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010136a:	89 04 24             	mov    %eax,(%esp)
8010136d:	e8 35 1f 00 00       	call   801032a7 <log_write>
  brelse(bp);
80101372:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101375:	89 04 24             	mov    %eax,(%esp)
80101378:	e8 9b ee ff ff       	call   80100218 <brelse>
}
8010137d:	c9                   	leave  
8010137e:	c3                   	ret    

8010137f <balloc>:
// Blocks. 

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
8010137f:	55                   	push   %ebp
80101380:	89 e5                	mov    %esp,%ebp
80101382:	53                   	push   %ebx
80101383:	83 ec 34             	sub    $0x34,%esp
  int b, bi, m;
  struct buf *bp;
  struct superblock sb;

  bp = 0;
80101386:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  readsb(dev, &sb);
8010138d:	8b 45 08             	mov    0x8(%ebp),%eax
80101390:	8d 55 d8             	lea    -0x28(%ebp),%edx
80101393:	89 54 24 04          	mov    %edx,0x4(%esp)
80101397:	89 04 24             	mov    %eax,(%esp)
8010139a:	e8 49 ff ff ff       	call   801012e8 <readsb>
  for(b = 0; b < sb.size; b += BPB){
8010139f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
801013a6:	e9 15 01 00 00       	jmp    801014c0 <balloc+0x141>
    bp = bread(dev, BBLOCK(b, sb.ninodes));
801013ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
801013ae:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
801013b4:	85 c0                	test   %eax,%eax
801013b6:	0f 48 c2             	cmovs  %edx,%eax
801013b9:	c1 f8 0c             	sar    $0xc,%eax
801013bc:	8b 55 e0             	mov    -0x20(%ebp),%edx
801013bf:	c1 ea 03             	shr    $0x3,%edx
801013c2:	01 d0                	add    %edx,%eax
801013c4:	83 c0 03             	add    $0x3,%eax
801013c7:	89 44 24 04          	mov    %eax,0x4(%esp)
801013cb:	8b 45 08             	mov    0x8(%ebp),%eax
801013ce:	89 04 24             	mov    %eax,(%esp)
801013d1:	e8 d1 ed ff ff       	call   801001a7 <bread>
801013d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801013d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
801013e0:	e9 aa 00 00 00       	jmp    8010148f <balloc+0x110>
      m = 1 << (bi % 8);
801013e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
801013e8:	89 c2                	mov    %eax,%edx
801013ea:	c1 fa 1f             	sar    $0x1f,%edx
801013ed:	c1 ea 1d             	shr    $0x1d,%edx
801013f0:	01 d0                	add    %edx,%eax
801013f2:	83 e0 07             	and    $0x7,%eax
801013f5:	29 d0                	sub    %edx,%eax
801013f7:	ba 01 00 00 00       	mov    $0x1,%edx
801013fc:	89 d3                	mov    %edx,%ebx
801013fe:	89 c1                	mov    %eax,%ecx
80101400:	d3 e3                	shl    %cl,%ebx
80101402:	89 d8                	mov    %ebx,%eax
80101404:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101407:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010140a:	8d 50 07             	lea    0x7(%eax),%edx
8010140d:	85 c0                	test   %eax,%eax
8010140f:	0f 48 c2             	cmovs  %edx,%eax
80101412:	c1 f8 03             	sar    $0x3,%eax
80101415:	8b 55 f4             	mov    -0xc(%ebp),%edx
80101418:	0f b6 44 02 18       	movzbl 0x18(%edx,%eax,1),%eax
8010141d:	0f b6 c0             	movzbl %al,%eax
80101420:	23 45 f0             	and    -0x10(%ebp),%eax
80101423:	85 c0                	test   %eax,%eax
80101425:	75 64                	jne    8010148b <balloc+0x10c>
        bp->data[bi/8] |= m;  // Mark block in use.
80101427:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010142a:	8d 50 07             	lea    0x7(%eax),%edx
8010142d:	85 c0                	test   %eax,%eax
8010142f:	0f 48 c2             	cmovs  %edx,%eax
80101432:	c1 f8 03             	sar    $0x3,%eax
80101435:	89 c2                	mov    %eax,%edx
80101437:	8b 4d f4             	mov    -0xc(%ebp),%ecx
8010143a:	0f b6 44 01 18       	movzbl 0x18(%ecx,%eax,1),%eax
8010143f:	89 c1                	mov    %eax,%ecx
80101441:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101444:	09 c8                	or     %ecx,%eax
80101446:	89 c1                	mov    %eax,%ecx
80101448:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010144b:	88 4c 10 18          	mov    %cl,0x18(%eax,%edx,1)
        log_write(bp);
8010144f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101452:	89 04 24             	mov    %eax,(%esp)
80101455:	e8 4d 1e 00 00       	call   801032a7 <log_write>
        brelse(bp);
8010145a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010145d:	89 04 24             	mov    %eax,(%esp)
80101460:	e8 b3 ed ff ff       	call   80100218 <brelse>
        bzero(dev, b + bi);
80101465:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101468:	8b 55 e8             	mov    -0x18(%ebp),%edx
8010146b:	01 c2                	add    %eax,%edx
8010146d:	8b 45 08             	mov    0x8(%ebp),%eax
80101470:	89 54 24 04          	mov    %edx,0x4(%esp)
80101474:	89 04 24             	mov    %eax,(%esp)
80101477:	e8 b2 fe ff ff       	call   8010132e <bzero>
        return b + bi;
8010147c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010147f:	8b 55 e8             	mov    -0x18(%ebp),%edx
80101482:	8d 04 02             	lea    (%edx,%eax,1),%eax
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
80101485:	83 c4 34             	add    $0x34,%esp
80101488:	5b                   	pop    %ebx
80101489:	5d                   	pop    %ebp
8010148a:	c3                   	ret    

  bp = 0;
  readsb(dev, &sb);
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb.ninodes));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010148b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
8010148f:	81 7d ec ff 0f 00 00 	cmpl   $0xfff,-0x14(%ebp)
80101496:	7f 16                	jg     801014ae <balloc+0x12f>
80101498:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010149b:	8b 55 e8             	mov    -0x18(%ebp),%edx
8010149e:	8d 04 02             	lea    (%edx,%eax,1),%eax
801014a1:	89 c2                	mov    %eax,%edx
801014a3:	8b 45 d8             	mov    -0x28(%ebp),%eax
801014a6:	39 c2                	cmp    %eax,%edx
801014a8:	0f 82 37 ff ff ff    	jb     801013e5 <balloc+0x66>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
801014ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
801014b1:	89 04 24             	mov    %eax,(%esp)
801014b4:	e8 5f ed ff ff       	call   80100218 <brelse>
  struct buf *bp;
  struct superblock sb;

  bp = 0;
  readsb(dev, &sb);
  for(b = 0; b < sb.size; b += BPB){
801014b9:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
801014c0:	8b 55 e8             	mov    -0x18(%ebp),%edx
801014c3:	8b 45 d8             	mov    -0x28(%ebp),%eax
801014c6:	39 c2                	cmp    %eax,%edx
801014c8:	0f 82 dd fe ff ff    	jb     801013ab <balloc+0x2c>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
801014ce:	c7 04 24 0d 86 10 80 	movl   $0x8010860d,(%esp)
801014d5:	e8 60 f0 ff ff       	call   8010053a <panic>

801014da <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801014da:	55                   	push   %ebp
801014db:	89 e5                	mov    %esp,%ebp
801014dd:	53                   	push   %ebx
801014de:	83 ec 34             	sub    $0x34,%esp
  struct buf *bp;
  struct superblock sb;
  int bi, m;

  readsb(dev, &sb);
801014e1:	8d 45 dc             	lea    -0x24(%ebp),%eax
801014e4:	89 44 24 04          	mov    %eax,0x4(%esp)
801014e8:	8b 45 08             	mov    0x8(%ebp),%eax
801014eb:	89 04 24             	mov    %eax,(%esp)
801014ee:	e8 f5 fd ff ff       	call   801012e8 <readsb>
  bp = bread(dev, BBLOCK(b, sb.ninodes));
801014f3:	8b 45 0c             	mov    0xc(%ebp),%eax
801014f6:	89 c2                	mov    %eax,%edx
801014f8:	c1 ea 0c             	shr    $0xc,%edx
801014fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801014fe:	c1 e8 03             	shr    $0x3,%eax
80101501:	8d 04 02             	lea    (%edx,%eax,1),%eax
80101504:	8d 50 03             	lea    0x3(%eax),%edx
80101507:	8b 45 08             	mov    0x8(%ebp),%eax
8010150a:	89 54 24 04          	mov    %edx,0x4(%esp)
8010150e:	89 04 24             	mov    %eax,(%esp)
80101511:	e8 91 ec ff ff       	call   801001a7 <bread>
80101516:	89 45 ec             	mov    %eax,-0x14(%ebp)
  bi = b % BPB;
80101519:	8b 45 0c             	mov    0xc(%ebp),%eax
8010151c:	25 ff 0f 00 00       	and    $0xfff,%eax
80101521:	89 45 f0             	mov    %eax,-0x10(%ebp)
  m = 1 << (bi % 8);
80101524:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101527:	89 c2                	mov    %eax,%edx
80101529:	c1 fa 1f             	sar    $0x1f,%edx
8010152c:	c1 ea 1d             	shr    $0x1d,%edx
8010152f:	01 d0                	add    %edx,%eax
80101531:	83 e0 07             	and    $0x7,%eax
80101534:	29 d0                	sub    %edx,%eax
80101536:	ba 01 00 00 00       	mov    $0x1,%edx
8010153b:	89 d3                	mov    %edx,%ebx
8010153d:	89 c1                	mov    %eax,%ecx
8010153f:	d3 e3                	shl    %cl,%ebx
80101541:	89 d8                	mov    %ebx,%eax
80101543:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((bp->data[bi/8] & m) == 0)
80101546:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101549:	8d 50 07             	lea    0x7(%eax),%edx
8010154c:	85 c0                	test   %eax,%eax
8010154e:	0f 48 c2             	cmovs  %edx,%eax
80101551:	c1 f8 03             	sar    $0x3,%eax
80101554:	8b 55 ec             	mov    -0x14(%ebp),%edx
80101557:	0f b6 44 02 18       	movzbl 0x18(%edx,%eax,1),%eax
8010155c:	0f b6 c0             	movzbl %al,%eax
8010155f:	23 45 f4             	and    -0xc(%ebp),%eax
80101562:	85 c0                	test   %eax,%eax
80101564:	75 0c                	jne    80101572 <bfree+0x98>
    panic("freeing free block");
80101566:	c7 04 24 23 86 10 80 	movl   $0x80108623,(%esp)
8010156d:	e8 c8 ef ff ff       	call   8010053a <panic>
  bp->data[bi/8] &= ~m;
80101572:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101575:	8d 50 07             	lea    0x7(%eax),%edx
80101578:	85 c0                	test   %eax,%eax
8010157a:	0f 48 c2             	cmovs  %edx,%eax
8010157d:	c1 f8 03             	sar    $0x3,%eax
80101580:	89 c2                	mov    %eax,%edx
80101582:	8b 4d ec             	mov    -0x14(%ebp),%ecx
80101585:	0f b6 44 01 18       	movzbl 0x18(%ecx,%eax,1),%eax
8010158a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
8010158d:	f7 d1                	not    %ecx
8010158f:	21 c8                	and    %ecx,%eax
80101591:	89 c1                	mov    %eax,%ecx
80101593:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101596:	88 4c 10 18          	mov    %cl,0x18(%eax,%edx,1)
  log_write(bp);
8010159a:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010159d:	89 04 24             	mov    %eax,(%esp)
801015a0:	e8 02 1d 00 00       	call   801032a7 <log_write>
  brelse(bp);
801015a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
801015a8:	89 04 24             	mov    %eax,(%esp)
801015ab:	e8 68 ec ff ff       	call   80100218 <brelse>
}
801015b0:	83 c4 34             	add    $0x34,%esp
801015b3:	5b                   	pop    %ebx
801015b4:	5d                   	pop    %ebp
801015b5:	c3                   	ret    

801015b6 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(void)
{
801015b6:	55                   	push   %ebp
801015b7:	89 e5                	mov    %esp,%ebp
801015b9:	83 ec 18             	sub    $0x18,%esp
  initlock(&icache.lock, "icache");
801015bc:	c7 44 24 04 36 86 10 	movl   $0x80108636,0x4(%esp)
801015c3:	80 
801015c4:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
801015cb:	e8 f2 38 00 00       	call   80104ec2 <initlock>
}
801015d0:	c9                   	leave  
801015d1:	c3                   	ret    

801015d2 <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
801015d2:	55                   	push   %ebp
801015d3:	89 e5                	mov    %esp,%ebp
801015d5:	83 ec 48             	sub    $0x48,%esp
801015d8:	8b 45 0c             	mov    0xc(%ebp),%eax
801015db:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;
  struct superblock sb;

  readsb(dev, &sb);
801015df:	8b 45 08             	mov    0x8(%ebp),%eax
801015e2:	8d 55 dc             	lea    -0x24(%ebp),%edx
801015e5:	89 54 24 04          	mov    %edx,0x4(%esp)
801015e9:	89 04 24             	mov    %eax,(%esp)
801015ec:	e8 f7 fc ff ff       	call   801012e8 <readsb>

  for(inum = 1; inum < sb.ninodes; inum++){
801015f1:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
801015f8:	e9 98 00 00 00       	jmp    80101695 <ialloc+0xc3>
    bp = bread(dev, IBLOCK(inum));
801015fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101600:	c1 e8 03             	shr    $0x3,%eax
80101603:	83 c0 02             	add    $0x2,%eax
80101606:	89 44 24 04          	mov    %eax,0x4(%esp)
8010160a:	8b 45 08             	mov    0x8(%ebp),%eax
8010160d:	89 04 24             	mov    %eax,(%esp)
80101610:	e8 92 eb ff ff       	call   801001a7 <bread>
80101615:	89 45 f0             	mov    %eax,-0x10(%ebp)
    dip = (struct dinode*)bp->data + inum%IPB;
80101618:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010161b:	83 c0 18             	add    $0x18,%eax
8010161e:	8b 55 ec             	mov    -0x14(%ebp),%edx
80101621:	83 e2 07             	and    $0x7,%edx
80101624:	c1 e2 06             	shl    $0x6,%edx
80101627:	01 d0                	add    %edx,%eax
80101629:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(dip->type == 0){  // a free inode
8010162c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010162f:	0f b7 00             	movzwl (%eax),%eax
80101632:	66 85 c0             	test   %ax,%ax
80101635:	75 4f                	jne    80101686 <ialloc+0xb4>
      memset(dip, 0, sizeof(*dip));
80101637:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
8010163e:	00 
8010163f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80101646:	00 
80101647:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010164a:	89 04 24             	mov    %eax,(%esp)
8010164d:	e8 e0 3a 00 00       	call   80105132 <memset>
      dip->type = type;
80101652:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101655:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
80101659:	66 89 10             	mov    %dx,(%eax)
      log_write(bp);   // mark it allocated on the disk
8010165c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010165f:	89 04 24             	mov    %eax,(%esp)
80101662:	e8 40 1c 00 00       	call   801032a7 <log_write>
      brelse(bp);
80101667:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010166a:	89 04 24             	mov    %eax,(%esp)
8010166d:	e8 a6 eb ff ff       	call   80100218 <brelse>
      return iget(dev, inum);
80101672:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101675:	89 44 24 04          	mov    %eax,0x4(%esp)
80101679:	8b 45 08             	mov    0x8(%ebp),%eax
8010167c:	89 04 24             	mov    %eax,(%esp)
8010167f:	e8 e6 00 00 00       	call   8010176a <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
80101684:	c9                   	leave  
80101685:	c3                   	ret    
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101686:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101689:	89 04 24             	mov    %eax,(%esp)
8010168c:	e8 87 eb ff ff       	call   80100218 <brelse>
  struct dinode *dip;
  struct superblock sb;

  readsb(dev, &sb);

  for(inum = 1; inum < sb.ninodes; inum++){
80101691:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
80101695:	8b 55 ec             	mov    -0x14(%ebp),%edx
80101698:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010169b:	39 c2                	cmp    %eax,%edx
8010169d:	0f 82 5a ff ff ff    	jb     801015fd <ialloc+0x2b>
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801016a3:	c7 04 24 3d 86 10 80 	movl   $0x8010863d,(%esp)
801016aa:	e8 8b ee ff ff       	call   8010053a <panic>

801016af <iupdate>:
}

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
801016af:	55                   	push   %ebp
801016b0:	89 e5                	mov    %esp,%ebp
801016b2:	83 ec 28             	sub    $0x28,%esp
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum));
801016b5:	8b 45 08             	mov    0x8(%ebp),%eax
801016b8:	8b 40 04             	mov    0x4(%eax),%eax
801016bb:	c1 e8 03             	shr    $0x3,%eax
801016be:	8d 50 02             	lea    0x2(%eax),%edx
801016c1:	8b 45 08             	mov    0x8(%ebp),%eax
801016c4:	8b 00                	mov    (%eax),%eax
801016c6:	89 54 24 04          	mov    %edx,0x4(%esp)
801016ca:	89 04 24             	mov    %eax,(%esp)
801016cd:	e8 d5 ea ff ff       	call   801001a7 <bread>
801016d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801016d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
801016d8:	83 c0 18             	add    $0x18,%eax
801016db:	89 c2                	mov    %eax,%edx
801016dd:	8b 45 08             	mov    0x8(%ebp),%eax
801016e0:	8b 40 04             	mov    0x4(%eax),%eax
801016e3:	83 e0 07             	and    $0x7,%eax
801016e6:	c1 e0 06             	shl    $0x6,%eax
801016e9:	8d 04 02             	lea    (%edx,%eax,1),%eax
801016ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
  dip->type = ip->type;
801016ef:	8b 45 08             	mov    0x8(%ebp),%eax
801016f2:	0f b7 50 10          	movzwl 0x10(%eax),%edx
801016f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801016f9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801016fc:	8b 45 08             	mov    0x8(%ebp),%eax
801016ff:	0f b7 50 12          	movzwl 0x12(%eax),%edx
80101703:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101706:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
8010170a:	8b 45 08             	mov    0x8(%ebp),%eax
8010170d:	0f b7 50 14          	movzwl 0x14(%eax),%edx
80101711:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101714:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
80101718:	8b 45 08             	mov    0x8(%ebp),%eax
8010171b:	0f b7 50 16          	movzwl 0x16(%eax),%edx
8010171f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101722:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
80101726:	8b 45 08             	mov    0x8(%ebp),%eax
80101729:	8b 50 18             	mov    0x18(%eax),%edx
8010172c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010172f:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101732:	8b 45 08             	mov    0x8(%ebp),%eax
80101735:	8d 50 1c             	lea    0x1c(%eax),%edx
80101738:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010173b:	83 c0 0c             	add    $0xc,%eax
8010173e:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101745:	00 
80101746:	89 54 24 04          	mov    %edx,0x4(%esp)
8010174a:	89 04 24             	mov    %eax,(%esp)
8010174d:	e8 b3 3a 00 00       	call   80105205 <memmove>
  log_write(bp);
80101752:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101755:	89 04 24             	mov    %eax,(%esp)
80101758:	e8 4a 1b 00 00       	call   801032a7 <log_write>
  brelse(bp);
8010175d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101760:	89 04 24             	mov    %eax,(%esp)
80101763:	e8 b0 ea ff ff       	call   80100218 <brelse>
}
80101768:	c9                   	leave  
80101769:	c3                   	ret    

8010176a <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010176a:	55                   	push   %ebp
8010176b:	89 e5                	mov    %esp,%ebp
8010176d:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101770:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101777:	e8 67 37 00 00       	call   80104ee3 <acquire>

  // Is the inode already cached?
  empty = 0;
8010177c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101783:	c7 45 f0 b4 e8 10 80 	movl   $0x8010e8b4,-0x10(%ebp)
8010178a:	eb 59                	jmp    801017e5 <iget+0x7b>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
8010178c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010178f:	8b 40 08             	mov    0x8(%eax),%eax
80101792:	85 c0                	test   %eax,%eax
80101794:	7e 35                	jle    801017cb <iget+0x61>
80101796:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101799:	8b 00                	mov    (%eax),%eax
8010179b:	3b 45 08             	cmp    0x8(%ebp),%eax
8010179e:	75 2b                	jne    801017cb <iget+0x61>
801017a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017a3:	8b 40 04             	mov    0x4(%eax),%eax
801017a6:	3b 45 0c             	cmp    0xc(%ebp),%eax
801017a9:	75 20                	jne    801017cb <iget+0x61>
      ip->ref++;
801017ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017ae:	8b 40 08             	mov    0x8(%eax),%eax
801017b1:	8d 50 01             	lea    0x1(%eax),%edx
801017b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017b7:	89 50 08             	mov    %edx,0x8(%eax)
      release(&icache.lock);
801017ba:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
801017c1:	e8 7e 37 00 00       	call   80104f44 <release>
      return ip;
801017c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017c9:	eb 70                	jmp    8010183b <iget+0xd1>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801017cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801017cf:	75 10                	jne    801017e1 <iget+0x77>
801017d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017d4:	8b 40 08             	mov    0x8(%eax),%eax
801017d7:	85 c0                	test   %eax,%eax
801017d9:	75 06                	jne    801017e1 <iget+0x77>
      empty = ip;
801017db:	8b 45 f0             	mov    -0x10(%ebp),%eax
801017de:	89 45 f4             	mov    %eax,-0xc(%ebp)

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801017e1:	83 45 f0 50          	addl   $0x50,-0x10(%ebp)
801017e5:	b8 54 f8 10 80       	mov    $0x8010f854,%eax
801017ea:	39 45 f0             	cmp    %eax,-0x10(%ebp)
801017ed:	72 9d                	jb     8010178c <iget+0x22>
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801017ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801017f3:	75 0c                	jne    80101801 <iget+0x97>
    panic("iget: no inodes");
801017f5:	c7 04 24 4f 86 10 80 	movl   $0x8010864f,(%esp)
801017fc:	e8 39 ed ff ff       	call   8010053a <panic>

  ip = empty;
80101801:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101804:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ip->dev = dev;
80101807:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010180a:	8b 55 08             	mov    0x8(%ebp),%edx
8010180d:	89 10                	mov    %edx,(%eax)
  ip->inum = inum;
8010180f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101812:	8b 55 0c             	mov    0xc(%ebp),%edx
80101815:	89 50 04             	mov    %edx,0x4(%eax)
  ip->ref = 1;
80101818:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010181b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  ip->flags = 0;
80101822:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101825:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  release(&icache.lock);
8010182c:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101833:	e8 0c 37 00 00       	call   80104f44 <release>

  return ip;
80101838:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
8010183b:	c9                   	leave  
8010183c:	c3                   	ret    

8010183d <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
8010183d:	55                   	push   %ebp
8010183e:	89 e5                	mov    %esp,%ebp
80101840:	83 ec 18             	sub    $0x18,%esp
  acquire(&icache.lock);
80101843:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
8010184a:	e8 94 36 00 00       	call   80104ee3 <acquire>
  ip->ref++;
8010184f:	8b 45 08             	mov    0x8(%ebp),%eax
80101852:	8b 40 08             	mov    0x8(%eax),%eax
80101855:	8d 50 01             	lea    0x1(%eax),%edx
80101858:	8b 45 08             	mov    0x8(%ebp),%eax
8010185b:	89 50 08             	mov    %edx,0x8(%eax)
  release(&icache.lock);
8010185e:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101865:	e8 da 36 00 00       	call   80104f44 <release>
  return ip;
8010186a:	8b 45 08             	mov    0x8(%ebp),%eax
}
8010186d:	c9                   	leave  
8010186e:	c3                   	ret    

8010186f <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
8010186f:	55                   	push   %ebp
80101870:	89 e5                	mov    %esp,%ebp
80101872:	83 ec 28             	sub    $0x28,%esp
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101875:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80101879:	74 0a                	je     80101885 <ilock+0x16>
8010187b:	8b 45 08             	mov    0x8(%ebp),%eax
8010187e:	8b 40 08             	mov    0x8(%eax),%eax
80101881:	85 c0                	test   %eax,%eax
80101883:	7f 0c                	jg     80101891 <ilock+0x22>
    panic("ilock");
80101885:	c7 04 24 5f 86 10 80 	movl   $0x8010865f,(%esp)
8010188c:	e8 a9 ec ff ff       	call   8010053a <panic>

  acquire(&icache.lock);
80101891:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101898:	e8 46 36 00 00       	call   80104ee3 <acquire>
  while(ip->flags & I_BUSY)
8010189d:	eb 13                	jmp    801018b2 <ilock+0x43>
    sleep(ip, &icache.lock);
8010189f:	c7 44 24 04 80 e8 10 	movl   $0x8010e880,0x4(%esp)
801018a6:	80 
801018a7:	8b 45 08             	mov    0x8(%ebp),%eax
801018aa:	89 04 24             	mov    %eax,(%esp)
801018ad:	e8 57 33 00 00       	call   80104c09 <sleep>

  if(ip == 0 || ip->ref < 1)
    panic("ilock");

  acquire(&icache.lock);
  while(ip->flags & I_BUSY)
801018b2:	8b 45 08             	mov    0x8(%ebp),%eax
801018b5:	8b 40 0c             	mov    0xc(%eax),%eax
801018b8:	83 e0 01             	and    $0x1,%eax
801018bb:	84 c0                	test   %al,%al
801018bd:	75 e0                	jne    8010189f <ilock+0x30>
    sleep(ip, &icache.lock);
  ip->flags |= I_BUSY;
801018bf:	8b 45 08             	mov    0x8(%ebp),%eax
801018c2:	8b 40 0c             	mov    0xc(%eax),%eax
801018c5:	89 c2                	mov    %eax,%edx
801018c7:	83 ca 01             	or     $0x1,%edx
801018ca:	8b 45 08             	mov    0x8(%ebp),%eax
801018cd:	89 50 0c             	mov    %edx,0xc(%eax)
  release(&icache.lock);
801018d0:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
801018d7:	e8 68 36 00 00       	call   80104f44 <release>

  if(!(ip->flags & I_VALID)){
801018dc:	8b 45 08             	mov    0x8(%ebp),%eax
801018df:	8b 40 0c             	mov    0xc(%eax),%eax
801018e2:	83 e0 02             	and    $0x2,%eax
801018e5:	85 c0                	test   %eax,%eax
801018e7:	0f 85 d1 00 00 00    	jne    801019be <ilock+0x14f>
    bp = bread(ip->dev, IBLOCK(ip->inum));
801018ed:	8b 45 08             	mov    0x8(%ebp),%eax
801018f0:	8b 40 04             	mov    0x4(%eax),%eax
801018f3:	c1 e8 03             	shr    $0x3,%eax
801018f6:	8d 50 02             	lea    0x2(%eax),%edx
801018f9:	8b 45 08             	mov    0x8(%ebp),%eax
801018fc:	8b 00                	mov    (%eax),%eax
801018fe:	89 54 24 04          	mov    %edx,0x4(%esp)
80101902:	89 04 24             	mov    %eax,(%esp)
80101905:	e8 9d e8 ff ff       	call   801001a7 <bread>
8010190a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
8010190d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101910:	83 c0 18             	add    $0x18,%eax
80101913:	89 c2                	mov    %eax,%edx
80101915:	8b 45 08             	mov    0x8(%ebp),%eax
80101918:	8b 40 04             	mov    0x4(%eax),%eax
8010191b:	83 e0 07             	and    $0x7,%eax
8010191e:	c1 e0 06             	shl    $0x6,%eax
80101921:	8d 04 02             	lea    (%edx,%eax,1),%eax
80101924:	89 45 f4             	mov    %eax,-0xc(%ebp)
    ip->type = dip->type;
80101927:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010192a:	0f b7 10             	movzwl (%eax),%edx
8010192d:	8b 45 08             	mov    0x8(%ebp),%eax
80101930:	66 89 50 10          	mov    %dx,0x10(%eax)
    ip->major = dip->major;
80101934:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101937:	0f b7 50 02          	movzwl 0x2(%eax),%edx
8010193b:	8b 45 08             	mov    0x8(%ebp),%eax
8010193e:	66 89 50 12          	mov    %dx,0x12(%eax)
    ip->minor = dip->minor;
80101942:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101945:	0f b7 50 04          	movzwl 0x4(%eax),%edx
80101949:	8b 45 08             	mov    0x8(%ebp),%eax
8010194c:	66 89 50 14          	mov    %dx,0x14(%eax)
    ip->nlink = dip->nlink;
80101950:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101953:	0f b7 50 06          	movzwl 0x6(%eax),%edx
80101957:	8b 45 08             	mov    0x8(%ebp),%eax
8010195a:	66 89 50 16          	mov    %dx,0x16(%eax)
    ip->size = dip->size;
8010195e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101961:	8b 50 08             	mov    0x8(%eax),%edx
80101964:	8b 45 08             	mov    0x8(%ebp),%eax
80101967:	89 50 18             	mov    %edx,0x18(%eax)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010196a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010196d:	8d 50 0c             	lea    0xc(%eax),%edx
80101970:	8b 45 08             	mov    0x8(%ebp),%eax
80101973:	83 c0 1c             	add    $0x1c,%eax
80101976:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
8010197d:	00 
8010197e:	89 54 24 04          	mov    %edx,0x4(%esp)
80101982:	89 04 24             	mov    %eax,(%esp)
80101985:	e8 7b 38 00 00       	call   80105205 <memmove>
    brelse(bp);
8010198a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010198d:	89 04 24             	mov    %eax,(%esp)
80101990:	e8 83 e8 ff ff       	call   80100218 <brelse>
    ip->flags |= I_VALID;
80101995:	8b 45 08             	mov    0x8(%ebp),%eax
80101998:	8b 40 0c             	mov    0xc(%eax),%eax
8010199b:	89 c2                	mov    %eax,%edx
8010199d:	83 ca 02             	or     $0x2,%edx
801019a0:	8b 45 08             	mov    0x8(%ebp),%eax
801019a3:	89 50 0c             	mov    %edx,0xc(%eax)
    if(ip->type == 0)
801019a6:	8b 45 08             	mov    0x8(%ebp),%eax
801019a9:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801019ad:	66 85 c0             	test   %ax,%ax
801019b0:	75 0c                	jne    801019be <ilock+0x14f>
      panic("ilock: no type");
801019b2:	c7 04 24 65 86 10 80 	movl   $0x80108665,(%esp)
801019b9:	e8 7c eb ff ff       	call   8010053a <panic>
  }
}
801019be:	c9                   	leave  
801019bf:	c3                   	ret    

801019c0 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
801019c0:	55                   	push   %ebp
801019c1:	89 e5                	mov    %esp,%ebp
801019c3:	83 ec 18             	sub    $0x18,%esp
  if(ip == 0 || !(ip->flags & I_BUSY) || ip->ref < 1)
801019c6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801019ca:	74 17                	je     801019e3 <iunlock+0x23>
801019cc:	8b 45 08             	mov    0x8(%ebp),%eax
801019cf:	8b 40 0c             	mov    0xc(%eax),%eax
801019d2:	83 e0 01             	and    $0x1,%eax
801019d5:	85 c0                	test   %eax,%eax
801019d7:	74 0a                	je     801019e3 <iunlock+0x23>
801019d9:	8b 45 08             	mov    0x8(%ebp),%eax
801019dc:	8b 40 08             	mov    0x8(%eax),%eax
801019df:	85 c0                	test   %eax,%eax
801019e1:	7f 0c                	jg     801019ef <iunlock+0x2f>
    panic("iunlock");
801019e3:	c7 04 24 74 86 10 80 	movl   $0x80108674,(%esp)
801019ea:	e8 4b eb ff ff       	call   8010053a <panic>

  acquire(&icache.lock);
801019ef:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
801019f6:	e8 e8 34 00 00       	call   80104ee3 <acquire>
  ip->flags &= ~I_BUSY;
801019fb:	8b 45 08             	mov    0x8(%ebp),%eax
801019fe:	8b 40 0c             	mov    0xc(%eax),%eax
80101a01:	89 c2                	mov    %eax,%edx
80101a03:	83 e2 fe             	and    $0xfffffffe,%edx
80101a06:	8b 45 08             	mov    0x8(%ebp),%eax
80101a09:	89 50 0c             	mov    %edx,0xc(%eax)
  wakeup(ip);
80101a0c:	8b 45 08             	mov    0x8(%ebp),%eax
80101a0f:	89 04 24             	mov    %eax,(%esp)
80101a12:	e8 cf 32 00 00       	call   80104ce6 <wakeup>
  release(&icache.lock);
80101a17:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101a1e:	e8 21 35 00 00       	call   80104f44 <release>
}
80101a23:	c9                   	leave  
80101a24:	c3                   	ret    

80101a25 <iput>:
// be recycled.
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
void
iput(struct inode *ip)
{
80101a25:	55                   	push   %ebp
80101a26:	89 e5                	mov    %esp,%ebp
80101a28:	83 ec 18             	sub    $0x18,%esp
  acquire(&icache.lock);
80101a2b:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101a32:	e8 ac 34 00 00       	call   80104ee3 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
80101a37:	8b 45 08             	mov    0x8(%ebp),%eax
80101a3a:	8b 40 08             	mov    0x8(%eax),%eax
80101a3d:	83 f8 01             	cmp    $0x1,%eax
80101a40:	0f 85 93 00 00 00    	jne    80101ad9 <iput+0xb4>
80101a46:	8b 45 08             	mov    0x8(%ebp),%eax
80101a49:	8b 40 0c             	mov    0xc(%eax),%eax
80101a4c:	83 e0 02             	and    $0x2,%eax
80101a4f:	85 c0                	test   %eax,%eax
80101a51:	0f 84 82 00 00 00    	je     80101ad9 <iput+0xb4>
80101a57:	8b 45 08             	mov    0x8(%ebp),%eax
80101a5a:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80101a5e:	66 85 c0             	test   %ax,%ax
80101a61:	75 76                	jne    80101ad9 <iput+0xb4>
    // inode has no links: truncate and free inode.
    if(ip->flags & I_BUSY)
80101a63:	8b 45 08             	mov    0x8(%ebp),%eax
80101a66:	8b 40 0c             	mov    0xc(%eax),%eax
80101a69:	83 e0 01             	and    $0x1,%eax
80101a6c:	84 c0                	test   %al,%al
80101a6e:	74 0c                	je     80101a7c <iput+0x57>
      panic("iput busy");
80101a70:	c7 04 24 7c 86 10 80 	movl   $0x8010867c,(%esp)
80101a77:	e8 be ea ff ff       	call   8010053a <panic>
    ip->flags |= I_BUSY;
80101a7c:	8b 45 08             	mov    0x8(%ebp),%eax
80101a7f:	8b 40 0c             	mov    0xc(%eax),%eax
80101a82:	89 c2                	mov    %eax,%edx
80101a84:	83 ca 01             	or     $0x1,%edx
80101a87:	8b 45 08             	mov    0x8(%ebp),%eax
80101a8a:	89 50 0c             	mov    %edx,0xc(%eax)
    release(&icache.lock);
80101a8d:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101a94:	e8 ab 34 00 00       	call   80104f44 <release>
    itrunc(ip);
80101a99:	8b 45 08             	mov    0x8(%ebp),%eax
80101a9c:	89 04 24             	mov    %eax,(%esp)
80101a9f:	e8 72 01 00 00       	call   80101c16 <itrunc>
    ip->type = 0;
80101aa4:	8b 45 08             	mov    0x8(%ebp),%eax
80101aa7:	66 c7 40 10 00 00    	movw   $0x0,0x10(%eax)
    iupdate(ip);
80101aad:	8b 45 08             	mov    0x8(%ebp),%eax
80101ab0:	89 04 24             	mov    %eax,(%esp)
80101ab3:	e8 f7 fb ff ff       	call   801016af <iupdate>
    acquire(&icache.lock);
80101ab8:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101abf:	e8 1f 34 00 00       	call   80104ee3 <acquire>
    ip->flags = 0;
80101ac4:	8b 45 08             	mov    0x8(%ebp),%eax
80101ac7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    wakeup(ip);
80101ace:	8b 45 08             	mov    0x8(%ebp),%eax
80101ad1:	89 04 24             	mov    %eax,(%esp)
80101ad4:	e8 0d 32 00 00       	call   80104ce6 <wakeup>
  }
  ip->ref--;
80101ad9:	8b 45 08             	mov    0x8(%ebp),%eax
80101adc:	8b 40 08             	mov    0x8(%eax),%eax
80101adf:	8d 50 ff             	lea    -0x1(%eax),%edx
80101ae2:	8b 45 08             	mov    0x8(%ebp),%eax
80101ae5:	89 50 08             	mov    %edx,0x8(%eax)
  release(&icache.lock);
80101ae8:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101aef:	e8 50 34 00 00       	call   80104f44 <release>
}
80101af4:	c9                   	leave  
80101af5:	c3                   	ret    

80101af6 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101af6:	55                   	push   %ebp
80101af7:	89 e5                	mov    %esp,%ebp
80101af9:	83 ec 18             	sub    $0x18,%esp
  iunlock(ip);
80101afc:	8b 45 08             	mov    0x8(%ebp),%eax
80101aff:	89 04 24             	mov    %eax,(%esp)
80101b02:	e8 b9 fe ff ff       	call   801019c0 <iunlock>
  iput(ip);
80101b07:	8b 45 08             	mov    0x8(%ebp),%eax
80101b0a:	89 04 24             	mov    %eax,(%esp)
80101b0d:	e8 13 ff ff ff       	call   80101a25 <iput>
}
80101b12:	c9                   	leave  
80101b13:	c3                   	ret    

80101b14 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101b14:	55                   	push   %ebp
80101b15:	89 e5                	mov    %esp,%ebp
80101b17:	53                   	push   %ebx
80101b18:	83 ec 24             	sub    $0x24,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
80101b1b:	83 7d 0c 0b          	cmpl   $0xb,0xc(%ebp)
80101b1f:	77 3e                	ja     80101b5f <bmap+0x4b>
    if((addr = ip->addrs[bn]) == 0)
80101b21:	8b 55 0c             	mov    0xc(%ebp),%edx
80101b24:	8b 45 08             	mov    0x8(%ebp),%eax
80101b27:	83 c2 04             	add    $0x4,%edx
80101b2a:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
80101b2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101b31:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80101b35:	75 20                	jne    80101b57 <bmap+0x43>
      ip->addrs[bn] = addr = balloc(ip->dev);
80101b37:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80101b3a:	8b 45 08             	mov    0x8(%ebp),%eax
80101b3d:	8b 00                	mov    (%eax),%eax
80101b3f:	89 04 24             	mov    %eax,(%esp)
80101b42:	e8 38 f8 ff ff       	call   8010137f <balloc>
80101b47:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101b4a:	8b 45 08             	mov    0x8(%ebp),%eax
80101b4d:	8d 4b 04             	lea    0x4(%ebx),%ecx
80101b50:	8b 55 ec             	mov    -0x14(%ebp),%edx
80101b53:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    return addr;
80101b57:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101b5a:	e9 b1 00 00 00       	jmp    80101c10 <bmap+0xfc>
  }
  bn -= NDIRECT;
80101b5f:	83 6d 0c 0c          	subl   $0xc,0xc(%ebp)

  if(bn < NINDIRECT){
80101b63:	83 7d 0c 7f          	cmpl   $0x7f,0xc(%ebp)
80101b67:	0f 87 97 00 00 00    	ja     80101c04 <bmap+0xf0>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101b6d:	8b 45 08             	mov    0x8(%ebp),%eax
80101b70:	8b 40 4c             	mov    0x4c(%eax),%eax
80101b73:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101b76:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80101b7a:	75 19                	jne    80101b95 <bmap+0x81>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101b7c:	8b 45 08             	mov    0x8(%ebp),%eax
80101b7f:	8b 00                	mov    (%eax),%eax
80101b81:	89 04 24             	mov    %eax,(%esp)
80101b84:	e8 f6 f7 ff ff       	call   8010137f <balloc>
80101b89:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101b8c:	8b 45 08             	mov    0x8(%ebp),%eax
80101b8f:	8b 55 ec             	mov    -0x14(%ebp),%edx
80101b92:	89 50 4c             	mov    %edx,0x4c(%eax)
    bp = bread(ip->dev, addr);
80101b95:	8b 45 08             	mov    0x8(%ebp),%eax
80101b98:	8b 00                	mov    (%eax),%eax
80101b9a:	8b 55 ec             	mov    -0x14(%ebp),%edx
80101b9d:	89 54 24 04          	mov    %edx,0x4(%esp)
80101ba1:	89 04 24             	mov    %eax,(%esp)
80101ba4:	e8 fe e5 ff ff       	call   801001a7 <bread>
80101ba9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    a = (uint*)bp->data;
80101bac:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101baf:	83 c0 18             	add    $0x18,%eax
80101bb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((addr = a[bn]) == 0){
80101bb5:	8b 45 0c             	mov    0xc(%ebp),%eax
80101bb8:	c1 e0 02             	shl    $0x2,%eax
80101bbb:	03 45 f0             	add    -0x10(%ebp),%eax
80101bbe:	8b 00                	mov    (%eax),%eax
80101bc0:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101bc3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80101bc7:	75 2b                	jne    80101bf4 <bmap+0xe0>
      a[bn] = addr = balloc(ip->dev);
80101bc9:	8b 45 0c             	mov    0xc(%ebp),%eax
80101bcc:	c1 e0 02             	shl    $0x2,%eax
80101bcf:	89 c3                	mov    %eax,%ebx
80101bd1:	03 5d f0             	add    -0x10(%ebp),%ebx
80101bd4:	8b 45 08             	mov    0x8(%ebp),%eax
80101bd7:	8b 00                	mov    (%eax),%eax
80101bd9:	89 04 24             	mov    %eax,(%esp)
80101bdc:	e8 9e f7 ff ff       	call   8010137f <balloc>
80101be1:	89 45 ec             	mov    %eax,-0x14(%ebp)
80101be4:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101be7:	89 03                	mov    %eax,(%ebx)
      log_write(bp);
80101be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101bec:	89 04 24             	mov    %eax,(%esp)
80101bef:	e8 b3 16 00 00       	call   801032a7 <log_write>
    }
    brelse(bp);
80101bf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101bf7:	89 04 24             	mov    %eax,(%esp)
80101bfa:	e8 19 e6 ff ff       	call   80100218 <brelse>
    return addr;
80101bff:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101c02:	eb 0c                	jmp    80101c10 <bmap+0xfc>
  }

  panic("bmap: out of range");
80101c04:	c7 04 24 86 86 10 80 	movl   $0x80108686,(%esp)
80101c0b:	e8 2a e9 ff ff       	call   8010053a <panic>
}
80101c10:	83 c4 24             	add    $0x24,%esp
80101c13:	5b                   	pop    %ebx
80101c14:	5d                   	pop    %ebp
80101c15:	c3                   	ret    

80101c16 <itrunc>:
// to it (no directory entries referring to it)
// and has no in-memory reference to it (is
// not an open file or current directory).
static void
itrunc(struct inode *ip)
{
80101c16:	55                   	push   %ebp
80101c17:	89 e5                	mov    %esp,%ebp
80101c19:	83 ec 28             	sub    $0x28,%esp
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101c1c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
80101c23:	eb 44                	jmp    80101c69 <itrunc+0x53>
    if(ip->addrs[i]){
80101c25:	8b 55 e8             	mov    -0x18(%ebp),%edx
80101c28:	8b 45 08             	mov    0x8(%ebp),%eax
80101c2b:	83 c2 04             	add    $0x4,%edx
80101c2e:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
80101c32:	85 c0                	test   %eax,%eax
80101c34:	74 2f                	je     80101c65 <itrunc+0x4f>
      bfree(ip->dev, ip->addrs[i]);
80101c36:	8b 55 e8             	mov    -0x18(%ebp),%edx
80101c39:	8b 45 08             	mov    0x8(%ebp),%eax
80101c3c:	83 c2 04             	add    $0x4,%edx
80101c3f:	8b 54 90 0c          	mov    0xc(%eax,%edx,4),%edx
80101c43:	8b 45 08             	mov    0x8(%ebp),%eax
80101c46:	8b 00                	mov    (%eax),%eax
80101c48:	89 54 24 04          	mov    %edx,0x4(%esp)
80101c4c:	89 04 24             	mov    %eax,(%esp)
80101c4f:	e8 86 f8 ff ff       	call   801014da <bfree>
      ip->addrs[i] = 0;
80101c54:	8b 55 e8             	mov    -0x18(%ebp),%edx
80101c57:	8b 45 08             	mov    0x8(%ebp),%eax
80101c5a:	83 c2 04             	add    $0x4,%edx
80101c5d:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
80101c64:	00 
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101c65:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
80101c69:	83 7d e8 0b          	cmpl   $0xb,-0x18(%ebp)
80101c6d:	7e b6                	jle    80101c25 <itrunc+0xf>
      bfree(ip->dev, ip->addrs[i]);
      ip->addrs[i] = 0;
    }
  }
  
  if(ip->addrs[NDIRECT]){
80101c6f:	8b 45 08             	mov    0x8(%ebp),%eax
80101c72:	8b 40 4c             	mov    0x4c(%eax),%eax
80101c75:	85 c0                	test   %eax,%eax
80101c77:	0f 84 8f 00 00 00    	je     80101d0c <itrunc+0xf6>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101c7d:	8b 45 08             	mov    0x8(%ebp),%eax
80101c80:	8b 50 4c             	mov    0x4c(%eax),%edx
80101c83:	8b 45 08             	mov    0x8(%ebp),%eax
80101c86:	8b 00                	mov    (%eax),%eax
80101c88:	89 54 24 04          	mov    %edx,0x4(%esp)
80101c8c:	89 04 24             	mov    %eax,(%esp)
80101c8f:	e8 13 e5 ff ff       	call   801001a7 <bread>
80101c94:	89 45 f0             	mov    %eax,-0x10(%ebp)
    a = (uint*)bp->data;
80101c97:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101c9a:	83 c0 18             	add    $0x18,%eax
80101c9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    for(j = 0; j < NINDIRECT; j++){
80101ca0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80101ca7:	eb 2f                	jmp    80101cd8 <itrunc+0xc2>
      if(a[j])
80101ca9:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101cac:	c1 e0 02             	shl    $0x2,%eax
80101caf:	03 45 f4             	add    -0xc(%ebp),%eax
80101cb2:	8b 00                	mov    (%eax),%eax
80101cb4:	85 c0                	test   %eax,%eax
80101cb6:	74 1c                	je     80101cd4 <itrunc+0xbe>
        bfree(ip->dev, a[j]);
80101cb8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101cbb:	c1 e0 02             	shl    $0x2,%eax
80101cbe:	03 45 f4             	add    -0xc(%ebp),%eax
80101cc1:	8b 10                	mov    (%eax),%edx
80101cc3:	8b 45 08             	mov    0x8(%ebp),%eax
80101cc6:	8b 00                	mov    (%eax),%eax
80101cc8:	89 54 24 04          	mov    %edx,0x4(%esp)
80101ccc:	89 04 24             	mov    %eax,(%esp)
80101ccf:	e8 06 f8 ff ff       	call   801014da <bfree>
  }
  
  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    a = (uint*)bp->data;
    for(j = 0; j < NINDIRECT; j++){
80101cd4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
80101cd8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101cdb:	83 f8 7f             	cmp    $0x7f,%eax
80101cde:	76 c9                	jbe    80101ca9 <itrunc+0x93>
      if(a[j])
        bfree(ip->dev, a[j]);
    }
    brelse(bp);
80101ce0:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101ce3:	89 04 24             	mov    %eax,(%esp)
80101ce6:	e8 2d e5 ff ff       	call   80100218 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
80101ceb:	8b 45 08             	mov    0x8(%ebp),%eax
80101cee:	8b 50 4c             	mov    0x4c(%eax),%edx
80101cf1:	8b 45 08             	mov    0x8(%ebp),%eax
80101cf4:	8b 00                	mov    (%eax),%eax
80101cf6:	89 54 24 04          	mov    %edx,0x4(%esp)
80101cfa:	89 04 24             	mov    %eax,(%esp)
80101cfd:	e8 d8 f7 ff ff       	call   801014da <bfree>
    ip->addrs[NDIRECT] = 0;
80101d02:	8b 45 08             	mov    0x8(%ebp),%eax
80101d05:	c7 40 4c 00 00 00 00 	movl   $0x0,0x4c(%eax)
  }

  ip->size = 0;
80101d0c:	8b 45 08             	mov    0x8(%ebp),%eax
80101d0f:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
  iupdate(ip);
80101d16:	8b 45 08             	mov    0x8(%ebp),%eax
80101d19:	89 04 24             	mov    %eax,(%esp)
80101d1c:	e8 8e f9 ff ff       	call   801016af <iupdate>
}
80101d21:	c9                   	leave  
80101d22:	c3                   	ret    

80101d23 <stati>:

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
80101d23:	55                   	push   %ebp
80101d24:	89 e5                	mov    %esp,%ebp
  st->dev = ip->dev;
80101d26:	8b 45 08             	mov    0x8(%ebp),%eax
80101d29:	8b 00                	mov    (%eax),%eax
80101d2b:	89 c2                	mov    %eax,%edx
80101d2d:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d30:	89 50 04             	mov    %edx,0x4(%eax)
  st->ino = ip->inum;
80101d33:	8b 45 08             	mov    0x8(%ebp),%eax
80101d36:	8b 50 04             	mov    0x4(%eax),%edx
80101d39:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d3c:	89 50 08             	mov    %edx,0x8(%eax)
  st->type = ip->type;
80101d3f:	8b 45 08             	mov    0x8(%ebp),%eax
80101d42:	0f b7 50 10          	movzwl 0x10(%eax),%edx
80101d46:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d49:	66 89 10             	mov    %dx,(%eax)
  st->nlink = ip->nlink;
80101d4c:	8b 45 08             	mov    0x8(%ebp),%eax
80101d4f:	0f b7 50 16          	movzwl 0x16(%eax),%edx
80101d53:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d56:	66 89 50 0c          	mov    %dx,0xc(%eax)
  st->size = ip->size;
80101d5a:	8b 45 08             	mov    0x8(%ebp),%eax
80101d5d:	8b 50 18             	mov    0x18(%eax),%edx
80101d60:	8b 45 0c             	mov    0xc(%ebp),%eax
80101d63:	89 50 10             	mov    %edx,0x10(%eax)
}
80101d66:	5d                   	pop    %ebp
80101d67:	c3                   	ret    

80101d68 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101d68:	55                   	push   %ebp
80101d69:	89 e5                	mov    %esp,%ebp
80101d6b:	53                   	push   %ebx
80101d6c:	83 ec 24             	sub    $0x24,%esp
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101d6f:	8b 45 08             	mov    0x8(%ebp),%eax
80101d72:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80101d76:	66 83 f8 03          	cmp    $0x3,%ax
80101d7a:	75 60                	jne    80101ddc <readi+0x74>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101d7c:	8b 45 08             	mov    0x8(%ebp),%eax
80101d7f:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101d83:	66 85 c0             	test   %ax,%ax
80101d86:	78 20                	js     80101da8 <readi+0x40>
80101d88:	8b 45 08             	mov    0x8(%ebp),%eax
80101d8b:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101d8f:	66 83 f8 09          	cmp    $0x9,%ax
80101d93:	7f 13                	jg     80101da8 <readi+0x40>
80101d95:	8b 45 08             	mov    0x8(%ebp),%eax
80101d98:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101d9c:	98                   	cwtl   
80101d9d:	8b 04 c5 20 e8 10 80 	mov    -0x7fef17e0(,%eax,8),%eax
80101da4:	85 c0                	test   %eax,%eax
80101da6:	75 0a                	jne    80101db2 <readi+0x4a>
      return -1;
80101da8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101dad:	e9 1c 01 00 00       	jmp    80101ece <readi+0x166>
    return devsw[ip->major].read(ip, dst, n);
80101db2:	8b 45 08             	mov    0x8(%ebp),%eax
80101db5:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101db9:	98                   	cwtl   
80101dba:	8b 14 c5 20 e8 10 80 	mov    -0x7fef17e0(,%eax,8),%edx
80101dc1:	8b 45 14             	mov    0x14(%ebp),%eax
80101dc4:	89 44 24 08          	mov    %eax,0x8(%esp)
80101dc8:	8b 45 0c             	mov    0xc(%ebp),%eax
80101dcb:	89 44 24 04          	mov    %eax,0x4(%esp)
80101dcf:	8b 45 08             	mov    0x8(%ebp),%eax
80101dd2:	89 04 24             	mov    %eax,(%esp)
80101dd5:	ff d2                	call   *%edx
80101dd7:	e9 f2 00 00 00       	jmp    80101ece <readi+0x166>
  }

  if(off > ip->size || off + n < off)
80101ddc:	8b 45 08             	mov    0x8(%ebp),%eax
80101ddf:	8b 40 18             	mov    0x18(%eax),%eax
80101de2:	3b 45 10             	cmp    0x10(%ebp),%eax
80101de5:	72 0e                	jb     80101df5 <readi+0x8d>
80101de7:	8b 45 14             	mov    0x14(%ebp),%eax
80101dea:	8b 55 10             	mov    0x10(%ebp),%edx
80101ded:	8d 04 02             	lea    (%edx,%eax,1),%eax
80101df0:	3b 45 10             	cmp    0x10(%ebp),%eax
80101df3:	73 0a                	jae    80101dff <readi+0x97>
    return -1;
80101df5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101dfa:	e9 cf 00 00 00       	jmp    80101ece <readi+0x166>
  if(off + n > ip->size)
80101dff:	8b 45 14             	mov    0x14(%ebp),%eax
80101e02:	8b 55 10             	mov    0x10(%ebp),%edx
80101e05:	01 c2                	add    %eax,%edx
80101e07:	8b 45 08             	mov    0x8(%ebp),%eax
80101e0a:	8b 40 18             	mov    0x18(%eax),%eax
80101e0d:	39 c2                	cmp    %eax,%edx
80101e0f:	76 0c                	jbe    80101e1d <readi+0xb5>
    n = ip->size - off;
80101e11:	8b 45 08             	mov    0x8(%ebp),%eax
80101e14:	8b 40 18             	mov    0x18(%eax),%eax
80101e17:	2b 45 10             	sub    0x10(%ebp),%eax
80101e1a:	89 45 14             	mov    %eax,0x14(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101e1d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80101e24:	e9 96 00 00 00       	jmp    80101ebf <readi+0x157>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101e29:	8b 45 10             	mov    0x10(%ebp),%eax
80101e2c:	c1 e8 09             	shr    $0x9,%eax
80101e2f:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e33:	8b 45 08             	mov    0x8(%ebp),%eax
80101e36:	89 04 24             	mov    %eax,(%esp)
80101e39:	e8 d6 fc ff ff       	call   80101b14 <bmap>
80101e3e:	8b 55 08             	mov    0x8(%ebp),%edx
80101e41:	8b 12                	mov    (%edx),%edx
80101e43:	89 44 24 04          	mov    %eax,0x4(%esp)
80101e47:	89 14 24             	mov    %edx,(%esp)
80101e4a:	e8 58 e3 ff ff       	call   801001a7 <bread>
80101e4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101e52:	8b 45 10             	mov    0x10(%ebp),%eax
80101e55:	89 c2                	mov    %eax,%edx
80101e57:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80101e5d:	b8 00 02 00 00       	mov    $0x200,%eax
80101e62:	89 c1                	mov    %eax,%ecx
80101e64:	29 d1                	sub    %edx,%ecx
80101e66:	89 ca                	mov    %ecx,%edx
80101e68:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101e6b:	8b 4d 14             	mov    0x14(%ebp),%ecx
80101e6e:	89 cb                	mov    %ecx,%ebx
80101e70:	29 c3                	sub    %eax,%ebx
80101e72:	89 d8                	mov    %ebx,%eax
80101e74:	39 c2                	cmp    %eax,%edx
80101e76:	0f 46 c2             	cmovbe %edx,%eax
80101e79:	89 45 f0             	mov    %eax,-0x10(%ebp)
    memmove(dst, bp->data + off%BSIZE, m);
80101e7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101e7f:	8d 50 18             	lea    0x18(%eax),%edx
80101e82:	8b 45 10             	mov    0x10(%ebp),%eax
80101e85:	25 ff 01 00 00       	and    $0x1ff,%eax
80101e8a:	01 c2                	add    %eax,%edx
80101e8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101e8f:	89 44 24 08          	mov    %eax,0x8(%esp)
80101e93:	89 54 24 04          	mov    %edx,0x4(%esp)
80101e97:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e9a:	89 04 24             	mov    %eax,(%esp)
80101e9d:	e8 63 33 00 00       	call   80105205 <memmove>
    brelse(bp);
80101ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101ea5:	89 04 24             	mov    %eax,(%esp)
80101ea8:	e8 6b e3 ff ff       	call   80100218 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101ead:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101eb0:	01 45 ec             	add    %eax,-0x14(%ebp)
80101eb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101eb6:	01 45 10             	add    %eax,0x10(%ebp)
80101eb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101ebc:	01 45 0c             	add    %eax,0xc(%ebp)
80101ebf:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101ec2:	3b 45 14             	cmp    0x14(%ebp),%eax
80101ec5:	0f 82 5e ff ff ff    	jb     80101e29 <readi+0xc1>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101ecb:	8b 45 14             	mov    0x14(%ebp),%eax
}
80101ece:	83 c4 24             	add    $0x24,%esp
80101ed1:	5b                   	pop    %ebx
80101ed2:	5d                   	pop    %ebp
80101ed3:	c3                   	ret    

80101ed4 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101ed4:	55                   	push   %ebp
80101ed5:	89 e5                	mov    %esp,%ebp
80101ed7:	53                   	push   %ebx
80101ed8:	83 ec 24             	sub    $0x24,%esp
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101edb:	8b 45 08             	mov    0x8(%ebp),%eax
80101ede:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80101ee2:	66 83 f8 03          	cmp    $0x3,%ax
80101ee6:	75 60                	jne    80101f48 <writei+0x74>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101ee8:	8b 45 08             	mov    0x8(%ebp),%eax
80101eeb:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101eef:	66 85 c0             	test   %ax,%ax
80101ef2:	78 20                	js     80101f14 <writei+0x40>
80101ef4:	8b 45 08             	mov    0x8(%ebp),%eax
80101ef7:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101efb:	66 83 f8 09          	cmp    $0x9,%ax
80101eff:	7f 13                	jg     80101f14 <writei+0x40>
80101f01:	8b 45 08             	mov    0x8(%ebp),%eax
80101f04:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101f08:	98                   	cwtl   
80101f09:	8b 04 c5 24 e8 10 80 	mov    -0x7fef17dc(,%eax,8),%eax
80101f10:	85 c0                	test   %eax,%eax
80101f12:	75 0a                	jne    80101f1e <writei+0x4a>
      return -1;
80101f14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101f19:	e9 48 01 00 00       	jmp    80102066 <writei+0x192>
    return devsw[ip->major].write(ip, src, n);
80101f1e:	8b 45 08             	mov    0x8(%ebp),%eax
80101f21:	0f b7 40 12          	movzwl 0x12(%eax),%eax
80101f25:	98                   	cwtl   
80101f26:	8b 14 c5 24 e8 10 80 	mov    -0x7fef17dc(,%eax,8),%edx
80101f2d:	8b 45 14             	mov    0x14(%ebp),%eax
80101f30:	89 44 24 08          	mov    %eax,0x8(%esp)
80101f34:	8b 45 0c             	mov    0xc(%ebp),%eax
80101f37:	89 44 24 04          	mov    %eax,0x4(%esp)
80101f3b:	8b 45 08             	mov    0x8(%ebp),%eax
80101f3e:	89 04 24             	mov    %eax,(%esp)
80101f41:	ff d2                	call   *%edx
80101f43:	e9 1e 01 00 00       	jmp    80102066 <writei+0x192>
  }

  if(off > ip->size || off + n < off)
80101f48:	8b 45 08             	mov    0x8(%ebp),%eax
80101f4b:	8b 40 18             	mov    0x18(%eax),%eax
80101f4e:	3b 45 10             	cmp    0x10(%ebp),%eax
80101f51:	72 0e                	jb     80101f61 <writei+0x8d>
80101f53:	8b 45 14             	mov    0x14(%ebp),%eax
80101f56:	8b 55 10             	mov    0x10(%ebp),%edx
80101f59:	8d 04 02             	lea    (%edx,%eax,1),%eax
80101f5c:	3b 45 10             	cmp    0x10(%ebp),%eax
80101f5f:	73 0a                	jae    80101f6b <writei+0x97>
    return -1;
80101f61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101f66:	e9 fb 00 00 00       	jmp    80102066 <writei+0x192>
  if(off + n > MAXFILE*BSIZE)
80101f6b:	8b 45 14             	mov    0x14(%ebp),%eax
80101f6e:	8b 55 10             	mov    0x10(%ebp),%edx
80101f71:	8d 04 02             	lea    (%edx,%eax,1),%eax
80101f74:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101f79:	76 0a                	jbe    80101f85 <writei+0xb1>
    return -1;
80101f7b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101f80:	e9 e1 00 00 00       	jmp    80102066 <writei+0x192>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101f85:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80101f8c:	e9 a1 00 00 00       	jmp    80102032 <writei+0x15e>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101f91:	8b 45 10             	mov    0x10(%ebp),%eax
80101f94:	c1 e8 09             	shr    $0x9,%eax
80101f97:	89 44 24 04          	mov    %eax,0x4(%esp)
80101f9b:	8b 45 08             	mov    0x8(%ebp),%eax
80101f9e:	89 04 24             	mov    %eax,(%esp)
80101fa1:	e8 6e fb ff ff       	call   80101b14 <bmap>
80101fa6:	8b 55 08             	mov    0x8(%ebp),%edx
80101fa9:	8b 12                	mov    (%edx),%edx
80101fab:	89 44 24 04          	mov    %eax,0x4(%esp)
80101faf:	89 14 24             	mov    %edx,(%esp)
80101fb2:	e8 f0 e1 ff ff       	call   801001a7 <bread>
80101fb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
80101fba:	8b 45 10             	mov    0x10(%ebp),%eax
80101fbd:	89 c2                	mov    %eax,%edx
80101fbf:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80101fc5:	b8 00 02 00 00       	mov    $0x200,%eax
80101fca:	89 c1                	mov    %eax,%ecx
80101fcc:	29 d1                	sub    %edx,%ecx
80101fce:	89 ca                	mov    %ecx,%edx
80101fd0:	8b 45 ec             	mov    -0x14(%ebp),%eax
80101fd3:	8b 4d 14             	mov    0x14(%ebp),%ecx
80101fd6:	89 cb                	mov    %ecx,%ebx
80101fd8:	29 c3                	sub    %eax,%ebx
80101fda:	89 d8                	mov    %ebx,%eax
80101fdc:	39 c2                	cmp    %eax,%edx
80101fde:	0f 46 c2             	cmovbe %edx,%eax
80101fe1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    memmove(bp->data + off%BSIZE, src, m);
80101fe4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80101fe7:	8d 50 18             	lea    0x18(%eax),%edx
80101fea:	8b 45 10             	mov    0x10(%ebp),%eax
80101fed:	25 ff 01 00 00       	and    $0x1ff,%eax
80101ff2:	01 c2                	add    %eax,%edx
80101ff4:	8b 45 f0             	mov    -0x10(%ebp),%eax
80101ff7:	89 44 24 08          	mov    %eax,0x8(%esp)
80101ffb:	8b 45 0c             	mov    0xc(%ebp),%eax
80101ffe:	89 44 24 04          	mov    %eax,0x4(%esp)
80102002:	89 14 24             	mov    %edx,(%esp)
80102005:	e8 fb 31 00 00       	call   80105205 <memmove>
    log_write(bp);
8010200a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010200d:	89 04 24             	mov    %eax,(%esp)
80102010:	e8 92 12 00 00       	call   801032a7 <log_write>
    brelse(bp);
80102015:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102018:	89 04 24             	mov    %eax,(%esp)
8010201b:	e8 f8 e1 ff ff       	call   80100218 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80102020:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102023:	01 45 ec             	add    %eax,-0x14(%ebp)
80102026:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102029:	01 45 10             	add    %eax,0x10(%ebp)
8010202c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010202f:	01 45 0c             	add    %eax,0xc(%ebp)
80102032:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102035:	3b 45 14             	cmp    0x14(%ebp),%eax
80102038:	0f 82 53 ff ff ff    	jb     80101f91 <writei+0xbd>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
8010203e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
80102042:	74 1f                	je     80102063 <writei+0x18f>
80102044:	8b 45 08             	mov    0x8(%ebp),%eax
80102047:	8b 40 18             	mov    0x18(%eax),%eax
8010204a:	3b 45 10             	cmp    0x10(%ebp),%eax
8010204d:	73 14                	jae    80102063 <writei+0x18f>
    ip->size = off;
8010204f:	8b 45 08             	mov    0x8(%ebp),%eax
80102052:	8b 55 10             	mov    0x10(%ebp),%edx
80102055:	89 50 18             	mov    %edx,0x18(%eax)
    iupdate(ip);
80102058:	8b 45 08             	mov    0x8(%ebp),%eax
8010205b:	89 04 24             	mov    %eax,(%esp)
8010205e:	e8 4c f6 ff ff       	call   801016af <iupdate>
  }
  return n;
80102063:	8b 45 14             	mov    0x14(%ebp),%eax
}
80102066:	83 c4 24             	add    $0x24,%esp
80102069:	5b                   	pop    %ebx
8010206a:	5d                   	pop    %ebp
8010206b:	c3                   	ret    

8010206c <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
8010206c:	55                   	push   %ebp
8010206d:	89 e5                	mov    %esp,%ebp
8010206f:	83 ec 18             	sub    $0x18,%esp
  return strncmp(s, t, DIRSIZ);
80102072:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80102079:	00 
8010207a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010207d:	89 44 24 04          	mov    %eax,0x4(%esp)
80102081:	8b 45 08             	mov    0x8(%ebp),%eax
80102084:	89 04 24             	mov    %eax,(%esp)
80102087:	e8 21 32 00 00       	call   801052ad <strncmp>
}
8010208c:	c9                   	leave  
8010208d:	c3                   	ret    

8010208e <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
8010208e:	55                   	push   %ebp
8010208f:	89 e5                	mov    %esp,%ebp
80102091:	83 ec 38             	sub    $0x38,%esp
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80102094:	8b 45 08             	mov    0x8(%ebp),%eax
80102097:	0f b7 40 10          	movzwl 0x10(%eax),%eax
8010209b:	66 83 f8 01          	cmp    $0x1,%ax
8010209f:	74 0c                	je     801020ad <dirlookup+0x1f>
    panic("dirlookup not DIR");
801020a1:	c7 04 24 99 86 10 80 	movl   $0x80108699,(%esp)
801020a8:	e8 8d e4 ff ff       	call   8010053a <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
801020ad:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
801020b4:	e9 87 00 00 00       	jmp    80102140 <dirlookup+0xb2>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801020b9:	8d 45 e0             	lea    -0x20(%ebp),%eax
801020bc:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
801020c3:	00 
801020c4:	8b 55 f0             	mov    -0x10(%ebp),%edx
801020c7:	89 54 24 08          	mov    %edx,0x8(%esp)
801020cb:	89 44 24 04          	mov    %eax,0x4(%esp)
801020cf:	8b 45 08             	mov    0x8(%ebp),%eax
801020d2:	89 04 24             	mov    %eax,(%esp)
801020d5:	e8 8e fc ff ff       	call   80101d68 <readi>
801020da:	83 f8 10             	cmp    $0x10,%eax
801020dd:	74 0c                	je     801020eb <dirlookup+0x5d>
      panic("dirlink read");
801020df:	c7 04 24 ab 86 10 80 	movl   $0x801086ab,(%esp)
801020e6:	e8 4f e4 ff ff       	call   8010053a <panic>
    if(de.inum == 0)
801020eb:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
801020ef:	66 85 c0             	test   %ax,%ax
801020f2:	74 47                	je     8010213b <dirlookup+0xad>
      continue;
    if(namecmp(name, de.name) == 0){
801020f4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801020f7:	83 c0 02             	add    $0x2,%eax
801020fa:	89 44 24 04          	mov    %eax,0x4(%esp)
801020fe:	8b 45 0c             	mov    0xc(%ebp),%eax
80102101:	89 04 24             	mov    %eax,(%esp)
80102104:	e8 63 ff ff ff       	call   8010206c <namecmp>
80102109:	85 c0                	test   %eax,%eax
8010210b:	75 2f                	jne    8010213c <dirlookup+0xae>
      // entry matches path element
      if(poff)
8010210d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80102111:	74 08                	je     8010211b <dirlookup+0x8d>
        *poff = off;
80102113:	8b 45 10             	mov    0x10(%ebp),%eax
80102116:	8b 55 f0             	mov    -0x10(%ebp),%edx
80102119:	89 10                	mov    %edx,(%eax)
      inum = de.inum;
8010211b:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
8010211f:	0f b7 c0             	movzwl %ax,%eax
80102122:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return iget(dp->dev, inum);
80102125:	8b 45 08             	mov    0x8(%ebp),%eax
80102128:	8b 00                	mov    (%eax),%eax
8010212a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010212d:	89 54 24 04          	mov    %edx,0x4(%esp)
80102131:	89 04 24             	mov    %eax,(%esp)
80102134:	e8 31 f6 ff ff       	call   8010176a <iget>
80102139:	eb 19                	jmp    80102154 <dirlookup+0xc6>

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
8010213b:	90                   	nop
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
8010213c:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
80102140:	8b 45 08             	mov    0x8(%ebp),%eax
80102143:	8b 40 18             	mov    0x18(%eax),%eax
80102146:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80102149:	0f 87 6a ff ff ff    	ja     801020b9 <dirlookup+0x2b>
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
8010214f:	b8 00 00 00 00       	mov    $0x0,%eax
}
80102154:	c9                   	leave  
80102155:	c3                   	ret    

80102156 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80102156:	55                   	push   %ebp
80102157:	89 e5                	mov    %esp,%ebp
80102159:	83 ec 38             	sub    $0x38,%esp
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
8010215c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80102163:	00 
80102164:	8b 45 0c             	mov    0xc(%ebp),%eax
80102167:	89 44 24 04          	mov    %eax,0x4(%esp)
8010216b:	8b 45 08             	mov    0x8(%ebp),%eax
8010216e:	89 04 24             	mov    %eax,(%esp)
80102171:	e8 18 ff ff ff       	call   8010208e <dirlookup>
80102176:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102179:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010217d:	74 15                	je     80102194 <dirlink+0x3e>
    iput(ip);
8010217f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102182:	89 04 24             	mov    %eax,(%esp)
80102185:	e8 9b f8 ff ff       	call   80101a25 <iput>
    return -1;
8010218a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010218f:	e9 b8 00 00 00       	jmp    8010224c <dirlink+0xf6>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80102194:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
8010219b:	eb 44                	jmp    801021e1 <dirlink+0x8b>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
8010219d:	8b 55 f0             	mov    -0x10(%ebp),%edx
801021a0:	8d 45 e0             	lea    -0x20(%ebp),%eax
801021a3:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
801021aa:	00 
801021ab:	89 54 24 08          	mov    %edx,0x8(%esp)
801021af:	89 44 24 04          	mov    %eax,0x4(%esp)
801021b3:	8b 45 08             	mov    0x8(%ebp),%eax
801021b6:	89 04 24             	mov    %eax,(%esp)
801021b9:	e8 aa fb ff ff       	call   80101d68 <readi>
801021be:	83 f8 10             	cmp    $0x10,%eax
801021c1:	74 0c                	je     801021cf <dirlink+0x79>
      panic("dirlink read");
801021c3:	c7 04 24 ab 86 10 80 	movl   $0x801086ab,(%esp)
801021ca:	e8 6b e3 ff ff       	call   8010053a <panic>
    if(de.inum == 0)
801021cf:	0f b7 45 e0          	movzwl -0x20(%ebp),%eax
801021d3:	66 85 c0             	test   %ax,%ax
801021d6:	74 18                	je     801021f0 <dirlink+0x9a>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
801021d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
801021db:	83 c0 10             	add    $0x10,%eax
801021de:	89 45 f0             	mov    %eax,-0x10(%ebp)
801021e1:	8b 55 f0             	mov    -0x10(%ebp),%edx
801021e4:	8b 45 08             	mov    0x8(%ebp),%eax
801021e7:	8b 40 18             	mov    0x18(%eax),%eax
801021ea:	39 c2                	cmp    %eax,%edx
801021ec:	72 af                	jb     8010219d <dirlink+0x47>
801021ee:	eb 01                	jmp    801021f1 <dirlink+0x9b>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      break;
801021f0:	90                   	nop
  }

  strncpy(de.name, name, DIRSIZ);
801021f1:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
801021f8:	00 
801021f9:	8b 45 0c             	mov    0xc(%ebp),%eax
801021fc:	89 44 24 04          	mov    %eax,0x4(%esp)
80102200:	8d 45 e0             	lea    -0x20(%ebp),%eax
80102203:	83 c0 02             	add    $0x2,%eax
80102206:	89 04 24             	mov    %eax,(%esp)
80102209:	e8 f7 30 00 00       	call   80105305 <strncpy>
  de.inum = inum;
8010220e:	8b 45 10             	mov    0x10(%ebp),%eax
80102211:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80102215:	8b 55 f0             	mov    -0x10(%ebp),%edx
80102218:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010221b:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80102222:	00 
80102223:	89 54 24 08          	mov    %edx,0x8(%esp)
80102227:	89 44 24 04          	mov    %eax,0x4(%esp)
8010222b:	8b 45 08             	mov    0x8(%ebp),%eax
8010222e:	89 04 24             	mov    %eax,(%esp)
80102231:	e8 9e fc ff ff       	call   80101ed4 <writei>
80102236:	83 f8 10             	cmp    $0x10,%eax
80102239:	74 0c                	je     80102247 <dirlink+0xf1>
    panic("dirlink");
8010223b:	c7 04 24 b8 86 10 80 	movl   $0x801086b8,(%esp)
80102242:	e8 f3 e2 ff ff       	call   8010053a <panic>
  
  return 0;
80102247:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010224c:	c9                   	leave  
8010224d:	c3                   	ret    

8010224e <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
8010224e:	55                   	push   %ebp
8010224f:	89 e5                	mov    %esp,%ebp
80102251:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int len;

  while(*path == '/')
80102254:	eb 04                	jmp    8010225a <skipelem+0xc>
    path++;
80102256:	83 45 08 01          	addl   $0x1,0x8(%ebp)
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
8010225a:	8b 45 08             	mov    0x8(%ebp),%eax
8010225d:	0f b6 00             	movzbl (%eax),%eax
80102260:	3c 2f                	cmp    $0x2f,%al
80102262:	74 f2                	je     80102256 <skipelem+0x8>
    path++;
  if(*path == 0)
80102264:	8b 45 08             	mov    0x8(%ebp),%eax
80102267:	0f b6 00             	movzbl (%eax),%eax
8010226a:	84 c0                	test   %al,%al
8010226c:	75 0a                	jne    80102278 <skipelem+0x2a>
    return 0;
8010226e:	b8 00 00 00 00       	mov    $0x0,%eax
80102273:	e9 86 00 00 00       	jmp    801022fe <skipelem+0xb0>
  s = path;
80102278:	8b 45 08             	mov    0x8(%ebp),%eax
8010227b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(*path != '/' && *path != 0)
8010227e:	eb 04                	jmp    80102284 <skipelem+0x36>
    path++;
80102280:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80102284:	8b 45 08             	mov    0x8(%ebp),%eax
80102287:	0f b6 00             	movzbl (%eax),%eax
8010228a:	3c 2f                	cmp    $0x2f,%al
8010228c:	74 0a                	je     80102298 <skipelem+0x4a>
8010228e:	8b 45 08             	mov    0x8(%ebp),%eax
80102291:	0f b6 00             	movzbl (%eax),%eax
80102294:	84 c0                	test   %al,%al
80102296:	75 e8                	jne    80102280 <skipelem+0x32>
    path++;
  len = path - s;
80102298:	8b 55 08             	mov    0x8(%ebp),%edx
8010229b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010229e:	89 d1                	mov    %edx,%ecx
801022a0:	29 c1                	sub    %eax,%ecx
801022a2:	89 c8                	mov    %ecx,%eax
801022a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(len >= DIRSIZ)
801022a7:	83 7d f4 0d          	cmpl   $0xd,-0xc(%ebp)
801022ab:	7e 1c                	jle    801022c9 <skipelem+0x7b>
    memmove(name, s, DIRSIZ);
801022ad:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
801022b4:	00 
801022b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
801022b8:	89 44 24 04          	mov    %eax,0x4(%esp)
801022bc:	8b 45 0c             	mov    0xc(%ebp),%eax
801022bf:	89 04 24             	mov    %eax,(%esp)
801022c2:	e8 3e 2f 00 00       	call   80105205 <memmove>
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
801022c7:	eb 28                	jmp    801022f1 <skipelem+0xa3>
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
801022c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801022cc:	89 44 24 08          	mov    %eax,0x8(%esp)
801022d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
801022d3:	89 44 24 04          	mov    %eax,0x4(%esp)
801022d7:	8b 45 0c             	mov    0xc(%ebp),%eax
801022da:	89 04 24             	mov    %eax,(%esp)
801022dd:	e8 23 2f 00 00       	call   80105205 <memmove>
    name[len] = 0;
801022e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801022e5:	03 45 0c             	add    0xc(%ebp),%eax
801022e8:	c6 00 00             	movb   $0x0,(%eax)
  }
  while(*path == '/')
801022eb:	eb 04                	jmp    801022f1 <skipelem+0xa3>
    path++;
801022ed:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
801022f1:	8b 45 08             	mov    0x8(%ebp),%eax
801022f4:	0f b6 00             	movzbl (%eax),%eax
801022f7:	3c 2f                	cmp    $0x2f,%al
801022f9:	74 f2                	je     801022ed <skipelem+0x9f>
    path++;
  return path;
801022fb:	8b 45 08             	mov    0x8(%ebp),%eax
}
801022fe:	c9                   	leave  
801022ff:	c3                   	ret    

80102300 <namex>:
// Look up and return the inode for a path name.
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80102300:	55                   	push   %ebp
80102301:	89 e5                	mov    %esp,%ebp
80102303:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip, *next;

  if(*path == '/')
80102306:	8b 45 08             	mov    0x8(%ebp),%eax
80102309:	0f b6 00             	movzbl (%eax),%eax
8010230c:	3c 2f                	cmp    $0x2f,%al
8010230e:	75 1c                	jne    8010232c <namex+0x2c>
    ip = iget(ROOTDEV, ROOTINO);
80102310:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102317:	00 
80102318:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010231f:	e8 46 f4 ff ff       	call   8010176a <iget>
80102324:	89 45 f0             	mov    %eax,-0x10(%ebp)
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
80102327:	e9 af 00 00 00       	jmp    801023db <namex+0xdb>
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
8010232c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80102332:	8b 40 68             	mov    0x68(%eax),%eax
80102335:	89 04 24             	mov    %eax,(%esp)
80102338:	e8 00 f5 ff ff       	call   8010183d <idup>
8010233d:	89 45 f0             	mov    %eax,-0x10(%ebp)

  while((path = skipelem(path, name)) != 0){
80102340:	e9 96 00 00 00       	jmp    801023db <namex+0xdb>
    ilock(ip);
80102345:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102348:	89 04 24             	mov    %eax,(%esp)
8010234b:	e8 1f f5 ff ff       	call   8010186f <ilock>
    if(ip->type != T_DIR){
80102350:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102353:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80102357:	66 83 f8 01          	cmp    $0x1,%ax
8010235b:	74 15                	je     80102372 <namex+0x72>
      iunlockput(ip);
8010235d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102360:	89 04 24             	mov    %eax,(%esp)
80102363:	e8 8e f7 ff ff       	call   80101af6 <iunlockput>
      return 0;
80102368:	b8 00 00 00 00       	mov    $0x0,%eax
8010236d:	e9 a3 00 00 00       	jmp    80102415 <namex+0x115>
    }
    if(nameiparent && *path == '\0'){
80102372:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80102376:	74 1d                	je     80102395 <namex+0x95>
80102378:	8b 45 08             	mov    0x8(%ebp),%eax
8010237b:	0f b6 00             	movzbl (%eax),%eax
8010237e:	84 c0                	test   %al,%al
80102380:	75 13                	jne    80102395 <namex+0x95>
      // Stop one level early.
      iunlock(ip);
80102382:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102385:	89 04 24             	mov    %eax,(%esp)
80102388:	e8 33 f6 ff ff       	call   801019c0 <iunlock>
      return ip;
8010238d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102390:	e9 80 00 00 00       	jmp    80102415 <namex+0x115>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80102395:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
8010239c:	00 
8010239d:	8b 45 10             	mov    0x10(%ebp),%eax
801023a0:	89 44 24 04          	mov    %eax,0x4(%esp)
801023a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801023a7:	89 04 24             	mov    %eax,(%esp)
801023aa:	e8 df fc ff ff       	call   8010208e <dirlookup>
801023af:	89 45 f4             	mov    %eax,-0xc(%ebp)
801023b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801023b6:	75 12                	jne    801023ca <namex+0xca>
      iunlockput(ip);
801023b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
801023bb:	89 04 24             	mov    %eax,(%esp)
801023be:	e8 33 f7 ff ff       	call   80101af6 <iunlockput>
      return 0;
801023c3:	b8 00 00 00 00       	mov    $0x0,%eax
801023c8:	eb 4b                	jmp    80102415 <namex+0x115>
    }
    iunlockput(ip);
801023ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
801023cd:	89 04 24             	mov    %eax,(%esp)
801023d0:	e8 21 f7 ff ff       	call   80101af6 <iunlockput>
    ip = next;
801023d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801023d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
801023db:	8b 45 10             	mov    0x10(%ebp),%eax
801023de:	89 44 24 04          	mov    %eax,0x4(%esp)
801023e2:	8b 45 08             	mov    0x8(%ebp),%eax
801023e5:	89 04 24             	mov    %eax,(%esp)
801023e8:	e8 61 fe ff ff       	call   8010224e <skipelem>
801023ed:	89 45 08             	mov    %eax,0x8(%ebp)
801023f0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801023f4:	0f 85 4b ff ff ff    	jne    80102345 <namex+0x45>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
801023fa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
801023fe:	74 12                	je     80102412 <namex+0x112>
    iput(ip);
80102400:	8b 45 f0             	mov    -0x10(%ebp),%eax
80102403:	89 04 24             	mov    %eax,(%esp)
80102406:	e8 1a f6 ff ff       	call   80101a25 <iput>
    return 0;
8010240b:	b8 00 00 00 00       	mov    $0x0,%eax
80102410:	eb 03                	jmp    80102415 <namex+0x115>
  }
  return ip;
80102412:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80102415:	c9                   	leave  
80102416:	c3                   	ret    

80102417 <namei>:

struct inode*
namei(char *path)
{
80102417:	55                   	push   %ebp
80102418:	89 e5                	mov    %esp,%ebp
8010241a:	83 ec 28             	sub    $0x28,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
8010241d:	8d 45 ea             	lea    -0x16(%ebp),%eax
80102420:	89 44 24 08          	mov    %eax,0x8(%esp)
80102424:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010242b:	00 
8010242c:	8b 45 08             	mov    0x8(%ebp),%eax
8010242f:	89 04 24             	mov    %eax,(%esp)
80102432:	e8 c9 fe ff ff       	call   80102300 <namex>
}
80102437:	c9                   	leave  
80102438:	c3                   	ret    

80102439 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80102439:	55                   	push   %ebp
8010243a:	89 e5                	mov    %esp,%ebp
8010243c:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 1, name);
8010243f:	8b 45 0c             	mov    0xc(%ebp),%eax
80102442:	89 44 24 08          	mov    %eax,0x8(%esp)
80102446:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
8010244d:	00 
8010244e:	8b 45 08             	mov    0x8(%ebp),%eax
80102451:	89 04 24             	mov    %eax,(%esp)
80102454:	e8 a7 fe ff ff       	call   80102300 <namex>
}
80102459:	c9                   	leave  
8010245a:	c3                   	ret    
	...

8010245c <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
8010245c:	55                   	push   %ebp
8010245d:	89 e5                	mov    %esp,%ebp
8010245f:	83 ec 14             	sub    $0x14,%esp
80102462:	8b 45 08             	mov    0x8(%ebp),%eax
80102465:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102469:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
8010246d:	89 c2                	mov    %eax,%edx
8010246f:	ec                   	in     (%dx),%al
80102470:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
80102473:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
80102477:	c9                   	leave  
80102478:	c3                   	ret    

80102479 <insl>:

static inline void
insl(int port, void *addr, int cnt)
{
80102479:	55                   	push   %ebp
8010247a:	89 e5                	mov    %esp,%ebp
8010247c:	57                   	push   %edi
8010247d:	53                   	push   %ebx
  asm volatile("cld; rep insl" :
8010247e:	8b 55 08             	mov    0x8(%ebp),%edx
80102481:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102484:	8b 45 10             	mov    0x10(%ebp),%eax
80102487:	89 cb                	mov    %ecx,%ebx
80102489:	89 df                	mov    %ebx,%edi
8010248b:	89 c1                	mov    %eax,%ecx
8010248d:	fc                   	cld    
8010248e:	f3 6d                	rep insl (%dx),%es:(%edi)
80102490:	89 c8                	mov    %ecx,%eax
80102492:	89 fb                	mov    %edi,%ebx
80102494:	89 5d 0c             	mov    %ebx,0xc(%ebp)
80102497:	89 45 10             	mov    %eax,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "d" (port), "0" (addr), "1" (cnt) :
               "memory", "cc");
}
8010249a:	5b                   	pop    %ebx
8010249b:	5f                   	pop    %edi
8010249c:	5d                   	pop    %ebp
8010249d:	c3                   	ret    

8010249e <outb>:

static inline void
outb(ushort port, uchar data)
{
8010249e:	55                   	push   %ebp
8010249f:	89 e5                	mov    %esp,%ebp
801024a1:	83 ec 08             	sub    $0x8,%esp
801024a4:	8b 55 08             	mov    0x8(%ebp),%edx
801024a7:	8b 45 0c             	mov    0xc(%ebp),%eax
801024aa:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
801024ae:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801024b1:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
801024b5:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
801024b9:	ee                   	out    %al,(%dx)
}
801024ba:	c9                   	leave  
801024bb:	c3                   	ret    

801024bc <outsl>:
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
}

static inline void
outsl(int port, const void *addr, int cnt)
{
801024bc:	55                   	push   %ebp
801024bd:	89 e5                	mov    %esp,%ebp
801024bf:	56                   	push   %esi
801024c0:	53                   	push   %ebx
  asm volatile("cld; rep outsl" :
801024c1:	8b 55 08             	mov    0x8(%ebp),%edx
801024c4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801024c7:	8b 45 10             	mov    0x10(%ebp),%eax
801024ca:	89 cb                	mov    %ecx,%ebx
801024cc:	89 de                	mov    %ebx,%esi
801024ce:	89 c1                	mov    %eax,%ecx
801024d0:	fc                   	cld    
801024d1:	f3 6f                	rep outsl %ds:(%esi),(%dx)
801024d3:	89 c8                	mov    %ecx,%eax
801024d5:	89 f3                	mov    %esi,%ebx
801024d7:	89 5d 0c             	mov    %ebx,0xc(%ebp)
801024da:	89 45 10             	mov    %eax,0x10(%ebp)
               "=S" (addr), "=c" (cnt) :
               "d" (port), "0" (addr), "1" (cnt) :
               "cc");
}
801024dd:	5b                   	pop    %ebx
801024de:	5e                   	pop    %esi
801024df:	5d                   	pop    %ebp
801024e0:	c3                   	ret    

801024e1 <idewait>:
static void idestart(struct buf*);

// Wait for IDE disk to become ready.
static int
idewait(int checkerr)
{
801024e1:	55                   	push   %ebp
801024e2:	89 e5                	mov    %esp,%ebp
801024e4:	83 ec 14             	sub    $0x14,%esp
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY) 
801024e7:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
801024ee:	e8 69 ff ff ff       	call   8010245c <inb>
801024f3:	0f b6 c0             	movzbl %al,%eax
801024f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
801024f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
801024fc:	25 c0 00 00 00       	and    $0xc0,%eax
80102501:	83 f8 40             	cmp    $0x40,%eax
80102504:	75 e1                	jne    801024e7 <idewait+0x6>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
80102506:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
8010250a:	74 11                	je     8010251d <idewait+0x3c>
8010250c:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010250f:	83 e0 21             	and    $0x21,%eax
80102512:	85 c0                	test   %eax,%eax
80102514:	74 07                	je     8010251d <idewait+0x3c>
    return -1;
80102516:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010251b:	eb 05                	jmp    80102522 <idewait+0x41>
  return 0;
8010251d:	b8 00 00 00 00       	mov    $0x0,%eax
}
80102522:	c9                   	leave  
80102523:	c3                   	ret    

80102524 <ideinit>:

void
ideinit(void)
{
80102524:	55                   	push   %ebp
80102525:	89 e5                	mov    %esp,%ebp
80102527:	83 ec 28             	sub    $0x28,%esp
  int i;

  initlock(&idelock, "ide");
8010252a:	c7 44 24 04 c0 86 10 	movl   $0x801086c0,0x4(%esp)
80102531:	80 
80102532:	c7 04 24 20 b6 10 80 	movl   $0x8010b620,(%esp)
80102539:	e8 84 29 00 00       	call   80104ec2 <initlock>
  picenable(IRQ_IDE);
8010253e:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102545:	e8 37 15 00 00       	call   80103a81 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
8010254a:	a1 20 ff 10 80       	mov    0x8010ff20,%eax
8010254f:	83 e8 01             	sub    $0x1,%eax
80102552:	89 44 24 04          	mov    %eax,0x4(%esp)
80102556:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
8010255d:	e8 10 04 00 00       	call   80102972 <ioapicenable>
  idewait(0);
80102562:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80102569:	e8 73 ff ff ff       	call   801024e1 <idewait>
  
  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
8010256e:	c7 44 24 04 f0 00 00 	movl   $0xf0,0x4(%esp)
80102575:	00 
80102576:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
8010257d:	e8 1c ff ff ff       	call   8010249e <outb>
  for(i=0; i<1000; i++){
80102582:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80102589:	eb 20                	jmp    801025ab <ideinit+0x87>
    if(inb(0x1f7) != 0){
8010258b:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
80102592:	e8 c5 fe ff ff       	call   8010245c <inb>
80102597:	84 c0                	test   %al,%al
80102599:	74 0c                	je     801025a7 <ideinit+0x83>
      havedisk1 = 1;
8010259b:	c7 05 58 b6 10 80 01 	movl   $0x1,0x8010b658
801025a2:	00 00 00 
      break;
801025a5:	eb 0d                	jmp    801025b4 <ideinit+0x90>
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);
  
  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
801025a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801025ab:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
801025b2:	7e d7                	jle    8010258b <ideinit+0x67>
      break;
    }
  }
  
  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
801025b4:	c7 44 24 04 e0 00 00 	movl   $0xe0,0x4(%esp)
801025bb:	00 
801025bc:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
801025c3:	e8 d6 fe ff ff       	call   8010249e <outb>
}
801025c8:	c9                   	leave  
801025c9:	c3                   	ret    

801025ca <idestart>:

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
801025ca:	55                   	push   %ebp
801025cb:	89 e5                	mov    %esp,%ebp
801025cd:	83 ec 18             	sub    $0x18,%esp
  if(b == 0)
801025d0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801025d4:	75 0c                	jne    801025e2 <idestart+0x18>
    panic("idestart");
801025d6:	c7 04 24 c4 86 10 80 	movl   $0x801086c4,(%esp)
801025dd:	e8 58 df ff ff       	call   8010053a <panic>

  idewait(0);
801025e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801025e9:	e8 f3 fe ff ff       	call   801024e1 <idewait>
  outb(0x3f6, 0);  // generate interrupt
801025ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801025f5:	00 
801025f6:	c7 04 24 f6 03 00 00 	movl   $0x3f6,(%esp)
801025fd:	e8 9c fe ff ff       	call   8010249e <outb>
  outb(0x1f2, 1);  // number of sectors
80102602:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102609:	00 
8010260a:	c7 04 24 f2 01 00 00 	movl   $0x1f2,(%esp)
80102611:	e8 88 fe ff ff       	call   8010249e <outb>
  outb(0x1f3, b->sector & 0xff);
80102616:	8b 45 08             	mov    0x8(%ebp),%eax
80102619:	8b 40 08             	mov    0x8(%eax),%eax
8010261c:	0f b6 c0             	movzbl %al,%eax
8010261f:	89 44 24 04          	mov    %eax,0x4(%esp)
80102623:	c7 04 24 f3 01 00 00 	movl   $0x1f3,(%esp)
8010262a:	e8 6f fe ff ff       	call   8010249e <outb>
  outb(0x1f4, (b->sector >> 8) & 0xff);
8010262f:	8b 45 08             	mov    0x8(%ebp),%eax
80102632:	8b 40 08             	mov    0x8(%eax),%eax
80102635:	c1 e8 08             	shr    $0x8,%eax
80102638:	0f b6 c0             	movzbl %al,%eax
8010263b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010263f:	c7 04 24 f4 01 00 00 	movl   $0x1f4,(%esp)
80102646:	e8 53 fe ff ff       	call   8010249e <outb>
  outb(0x1f5, (b->sector >> 16) & 0xff);
8010264b:	8b 45 08             	mov    0x8(%ebp),%eax
8010264e:	8b 40 08             	mov    0x8(%eax),%eax
80102651:	c1 e8 10             	shr    $0x10,%eax
80102654:	0f b6 c0             	movzbl %al,%eax
80102657:	89 44 24 04          	mov    %eax,0x4(%esp)
8010265b:	c7 04 24 f5 01 00 00 	movl   $0x1f5,(%esp)
80102662:	e8 37 fe ff ff       	call   8010249e <outb>
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((b->sector>>24)&0x0f));
80102667:	8b 45 08             	mov    0x8(%ebp),%eax
8010266a:	8b 40 04             	mov    0x4(%eax),%eax
8010266d:	83 e0 01             	and    $0x1,%eax
80102670:	89 c2                	mov    %eax,%edx
80102672:	c1 e2 04             	shl    $0x4,%edx
80102675:	8b 45 08             	mov    0x8(%ebp),%eax
80102678:	8b 40 08             	mov    0x8(%eax),%eax
8010267b:	c1 e8 18             	shr    $0x18,%eax
8010267e:	83 e0 0f             	and    $0xf,%eax
80102681:	09 d0                	or     %edx,%eax
80102683:	83 c8 e0             	or     $0xffffffe0,%eax
80102686:	0f b6 c0             	movzbl %al,%eax
80102689:	89 44 24 04          	mov    %eax,0x4(%esp)
8010268d:	c7 04 24 f6 01 00 00 	movl   $0x1f6,(%esp)
80102694:	e8 05 fe ff ff       	call   8010249e <outb>
  if(b->flags & B_DIRTY){
80102699:	8b 45 08             	mov    0x8(%ebp),%eax
8010269c:	8b 00                	mov    (%eax),%eax
8010269e:	83 e0 04             	and    $0x4,%eax
801026a1:	85 c0                	test   %eax,%eax
801026a3:	74 34                	je     801026d9 <idestart+0x10f>
    outb(0x1f7, IDE_CMD_WRITE);
801026a5:	c7 44 24 04 30 00 00 	movl   $0x30,0x4(%esp)
801026ac:	00 
801026ad:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
801026b4:	e8 e5 fd ff ff       	call   8010249e <outb>
    outsl(0x1f0, b->data, 512/4);
801026b9:	8b 45 08             	mov    0x8(%ebp),%eax
801026bc:	83 c0 18             	add    $0x18,%eax
801026bf:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
801026c6:	00 
801026c7:	89 44 24 04          	mov    %eax,0x4(%esp)
801026cb:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
801026d2:	e8 e5 fd ff ff       	call   801024bc <outsl>
801026d7:	eb 14                	jmp    801026ed <idestart+0x123>
  } else {
    outb(0x1f7, IDE_CMD_READ);
801026d9:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
801026e0:	00 
801026e1:	c7 04 24 f7 01 00 00 	movl   $0x1f7,(%esp)
801026e8:	e8 b1 fd ff ff       	call   8010249e <outb>
  }
}
801026ed:	c9                   	leave  
801026ee:	c3                   	ret    

801026ef <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
801026ef:	55                   	push   %ebp
801026f0:	89 e5                	mov    %esp,%ebp
801026f2:	83 ec 28             	sub    $0x28,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
801026f5:	c7 04 24 20 b6 10 80 	movl   $0x8010b620,(%esp)
801026fc:	e8 e2 27 00 00       	call   80104ee3 <acquire>
  if((b = idequeue) == 0){
80102701:	a1 54 b6 10 80       	mov    0x8010b654,%eax
80102706:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102709:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010270d:	75 11                	jne    80102720 <ideintr+0x31>
    release(&idelock);
8010270f:	c7 04 24 20 b6 10 80 	movl   $0x8010b620,(%esp)
80102716:	e8 29 28 00 00       	call   80104f44 <release>
    // cprintf("spurious IDE interrupt\n");
    return;
8010271b:	e9 90 00 00 00       	jmp    801027b0 <ideintr+0xc1>
  }
  idequeue = b->qnext;
80102720:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102723:	8b 40 14             	mov    0x14(%eax),%eax
80102726:	a3 54 b6 10 80       	mov    %eax,0x8010b654

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
8010272b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010272e:	8b 00                	mov    (%eax),%eax
80102730:	83 e0 04             	and    $0x4,%eax
80102733:	85 c0                	test   %eax,%eax
80102735:	75 2e                	jne    80102765 <ideintr+0x76>
80102737:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010273e:	e8 9e fd ff ff       	call   801024e1 <idewait>
80102743:	85 c0                	test   %eax,%eax
80102745:	78 1e                	js     80102765 <ideintr+0x76>
    insl(0x1f0, b->data, 512/4);
80102747:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010274a:	83 c0 18             	add    $0x18,%eax
8010274d:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80102754:	00 
80102755:	89 44 24 04          	mov    %eax,0x4(%esp)
80102759:	c7 04 24 f0 01 00 00 	movl   $0x1f0,(%esp)
80102760:	e8 14 fd ff ff       	call   80102479 <insl>
  
  // Wake process waiting for this buf.
  b->flags |= B_VALID;
80102765:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102768:	8b 00                	mov    (%eax),%eax
8010276a:	89 c2                	mov    %eax,%edx
8010276c:	83 ca 02             	or     $0x2,%edx
8010276f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102772:	89 10                	mov    %edx,(%eax)
  b->flags &= ~B_DIRTY;
80102774:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102777:	8b 00                	mov    (%eax),%eax
80102779:	89 c2                	mov    %eax,%edx
8010277b:	83 e2 fb             	and    $0xfffffffb,%edx
8010277e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102781:	89 10                	mov    %edx,(%eax)
  wakeup(b);
80102783:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102786:	89 04 24             	mov    %eax,(%esp)
80102789:	e8 58 25 00 00       	call   80104ce6 <wakeup>
  
  // Start disk on next buf in queue.
  if(idequeue != 0)
8010278e:	a1 54 b6 10 80       	mov    0x8010b654,%eax
80102793:	85 c0                	test   %eax,%eax
80102795:	74 0d                	je     801027a4 <ideintr+0xb5>
    idestart(idequeue);
80102797:	a1 54 b6 10 80       	mov    0x8010b654,%eax
8010279c:	89 04 24             	mov    %eax,(%esp)
8010279f:	e8 26 fe ff ff       	call   801025ca <idestart>

  release(&idelock);
801027a4:	c7 04 24 20 b6 10 80 	movl   $0x8010b620,(%esp)
801027ab:	e8 94 27 00 00       	call   80104f44 <release>
}
801027b0:	c9                   	leave  
801027b1:	c3                   	ret    

801027b2 <iderw>:
// Sync buf with disk. 
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801027b2:	55                   	push   %ebp
801027b3:	89 e5                	mov    %esp,%ebp
801027b5:	83 ec 28             	sub    $0x28,%esp
  struct buf **pp;

  if(!(b->flags & B_BUSY))
801027b8:	8b 45 08             	mov    0x8(%ebp),%eax
801027bb:	8b 00                	mov    (%eax),%eax
801027bd:	83 e0 01             	and    $0x1,%eax
801027c0:	85 c0                	test   %eax,%eax
801027c2:	75 0c                	jne    801027d0 <iderw+0x1e>
    panic("iderw: buf not busy");
801027c4:	c7 04 24 cd 86 10 80 	movl   $0x801086cd,(%esp)
801027cb:	e8 6a dd ff ff       	call   8010053a <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801027d0:	8b 45 08             	mov    0x8(%ebp),%eax
801027d3:	8b 00                	mov    (%eax),%eax
801027d5:	83 e0 06             	and    $0x6,%eax
801027d8:	83 f8 02             	cmp    $0x2,%eax
801027db:	75 0c                	jne    801027e9 <iderw+0x37>
    panic("iderw: nothing to do");
801027dd:	c7 04 24 e1 86 10 80 	movl   $0x801086e1,(%esp)
801027e4:	e8 51 dd ff ff       	call   8010053a <panic>
  if(b->dev != 0 && !havedisk1)
801027e9:	8b 45 08             	mov    0x8(%ebp),%eax
801027ec:	8b 40 04             	mov    0x4(%eax),%eax
801027ef:	85 c0                	test   %eax,%eax
801027f1:	74 15                	je     80102808 <iderw+0x56>
801027f3:	a1 58 b6 10 80       	mov    0x8010b658,%eax
801027f8:	85 c0                	test   %eax,%eax
801027fa:	75 0c                	jne    80102808 <iderw+0x56>
    panic("iderw: ide disk 1 not present");
801027fc:	c7 04 24 f6 86 10 80 	movl   $0x801086f6,(%esp)
80102803:	e8 32 dd ff ff       	call   8010053a <panic>

  acquire(&idelock);  //DOC:acquire-lock
80102808:	c7 04 24 20 b6 10 80 	movl   $0x8010b620,(%esp)
8010280f:	e8 cf 26 00 00       	call   80104ee3 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
80102814:	8b 45 08             	mov    0x8(%ebp),%eax
80102817:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010281e:	c7 45 f4 54 b6 10 80 	movl   $0x8010b654,-0xc(%ebp)
80102825:	eb 0b                	jmp    80102832 <iderw+0x80>
80102827:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010282a:	8b 00                	mov    (%eax),%eax
8010282c:	83 c0 14             	add    $0x14,%eax
8010282f:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102832:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102835:	8b 00                	mov    (%eax),%eax
80102837:	85 c0                	test   %eax,%eax
80102839:	75 ec                	jne    80102827 <iderw+0x75>
    ;
  *pp = b;
8010283b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010283e:	8b 55 08             	mov    0x8(%ebp),%edx
80102841:	89 10                	mov    %edx,(%eax)
  
  // Start disk if necessary.
  if(idequeue == b)
80102843:	a1 54 b6 10 80       	mov    0x8010b654,%eax
80102848:	3b 45 08             	cmp    0x8(%ebp),%eax
8010284b:	75 22                	jne    8010286f <iderw+0xbd>
    idestart(b);
8010284d:	8b 45 08             	mov    0x8(%ebp),%eax
80102850:	89 04 24             	mov    %eax,(%esp)
80102853:	e8 72 fd ff ff       	call   801025ca <idestart>
  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102858:	eb 16                	jmp    80102870 <iderw+0xbe>
    sleep(b, &idelock);
8010285a:	c7 44 24 04 20 b6 10 	movl   $0x8010b620,0x4(%esp)
80102861:	80 
80102862:	8b 45 08             	mov    0x8(%ebp),%eax
80102865:	89 04 24             	mov    %eax,(%esp)
80102868:	e8 9c 23 00 00       	call   80104c09 <sleep>
8010286d:	eb 01                	jmp    80102870 <iderw+0xbe>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010286f:	90                   	nop
80102870:	8b 45 08             	mov    0x8(%ebp),%eax
80102873:	8b 00                	mov    (%eax),%eax
80102875:	83 e0 06             	and    $0x6,%eax
80102878:	83 f8 02             	cmp    $0x2,%eax
8010287b:	75 dd                	jne    8010285a <iderw+0xa8>
    sleep(b, &idelock);
  }

  release(&idelock);
8010287d:	c7 04 24 20 b6 10 80 	movl   $0x8010b620,(%esp)
80102884:	e8 bb 26 00 00       	call   80104f44 <release>
}
80102889:	c9                   	leave  
8010288a:	c3                   	ret    
	...

8010288c <ioapicread>:
8010288c:	55                   	push   %ebp
8010288d:	89 e5                	mov    %esp,%ebp
8010288f:	a1 54 f8 10 80       	mov    0x8010f854,%eax
80102894:	8b 55 08             	mov    0x8(%ebp),%edx
80102897:	89 10                	mov    %edx,(%eax)
80102899:	a1 54 f8 10 80       	mov    0x8010f854,%eax
8010289e:	8b 40 10             	mov    0x10(%eax),%eax
801028a1:	5d                   	pop    %ebp
801028a2:	c3                   	ret    

801028a3 <ioapicwrite>:
801028a3:	55                   	push   %ebp
801028a4:	89 e5                	mov    %esp,%ebp
801028a6:	a1 54 f8 10 80       	mov    0x8010f854,%eax
801028ab:	8b 55 08             	mov    0x8(%ebp),%edx
801028ae:	89 10                	mov    %edx,(%eax)
801028b0:	a1 54 f8 10 80       	mov    0x8010f854,%eax
801028b5:	8b 55 0c             	mov    0xc(%ebp),%edx
801028b8:	89 50 10             	mov    %edx,0x10(%eax)
801028bb:	5d                   	pop    %ebp
801028bc:	c3                   	ret    

801028bd <ioapicinit>:
801028bd:	55                   	push   %ebp
801028be:	89 e5                	mov    %esp,%ebp
801028c0:	83 ec 28             	sub    $0x28,%esp
801028c3:	a1 24 f9 10 80       	mov    0x8010f924,%eax
801028c8:	85 c0                	test   %eax,%eax
801028ca:	0f 84 9f 00 00 00    	je     8010296f <ioapicinit+0xb2>
801028d0:	c7 05 54 f8 10 80 00 	movl   $0xfec00000,0x8010f854
801028d7:	00 c0 fe 
801028da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801028e1:	e8 a6 ff ff ff       	call   8010288c <ioapicread>
801028e6:	c1 e8 10             	shr    $0x10,%eax
801028e9:	25 ff 00 00 00       	and    $0xff,%eax
801028ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
801028f1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801028f8:	e8 8f ff ff ff       	call   8010288c <ioapicread>
801028fd:	c1 e8 18             	shr    $0x18,%eax
80102900:	89 45 f0             	mov    %eax,-0x10(%ebp)
80102903:	0f b6 05 20 f9 10 80 	movzbl 0x8010f920,%eax
8010290a:	0f b6 c0             	movzbl %al,%eax
8010290d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80102910:	74 0c                	je     8010291e <ioapicinit+0x61>
80102912:	c7 04 24 14 87 10 80 	movl   $0x80108714,(%esp)
80102919:	e8 7c da ff ff       	call   8010039a <cprintf>
8010291e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80102925:	eb 3e                	jmp    80102965 <ioapicinit+0xa8>
80102927:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010292a:	83 c0 20             	add    $0x20,%eax
8010292d:	0d 00 00 01 00       	or     $0x10000,%eax
80102932:	8b 55 ec             	mov    -0x14(%ebp),%edx
80102935:	83 c2 08             	add    $0x8,%edx
80102938:	01 d2                	add    %edx,%edx
8010293a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010293e:	89 14 24             	mov    %edx,(%esp)
80102941:	e8 5d ff ff ff       	call   801028a3 <ioapicwrite>
80102946:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102949:	83 c0 08             	add    $0x8,%eax
8010294c:	01 c0                	add    %eax,%eax
8010294e:	83 c0 01             	add    $0x1,%eax
80102951:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102958:	00 
80102959:	89 04 24             	mov    %eax,(%esp)
8010295c:	e8 42 ff ff ff       	call   801028a3 <ioapicwrite>
80102961:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
80102965:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102968:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010296b:	7e ba                	jle    80102927 <ioapicinit+0x6a>
8010296d:	eb 01                	jmp    80102970 <ioapicinit+0xb3>
8010296f:	90                   	nop
80102970:	c9                   	leave  
80102971:	c3                   	ret    

80102972 <ioapicenable>:
80102972:	55                   	push   %ebp
80102973:	89 e5                	mov    %esp,%ebp
80102975:	83 ec 08             	sub    $0x8,%esp
80102978:	a1 24 f9 10 80       	mov    0x8010f924,%eax
8010297d:	85 c0                	test   %eax,%eax
8010297f:	74 39                	je     801029ba <ioapicenable+0x48>
80102981:	8b 45 08             	mov    0x8(%ebp),%eax
80102984:	83 c0 20             	add    $0x20,%eax
80102987:	8b 55 08             	mov    0x8(%ebp),%edx
8010298a:	83 c2 08             	add    $0x8,%edx
8010298d:	01 d2                	add    %edx,%edx
8010298f:	89 44 24 04          	mov    %eax,0x4(%esp)
80102993:	89 14 24             	mov    %edx,(%esp)
80102996:	e8 08 ff ff ff       	call   801028a3 <ioapicwrite>
8010299b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010299e:	c1 e0 18             	shl    $0x18,%eax
801029a1:	8b 55 08             	mov    0x8(%ebp),%edx
801029a4:	83 c2 08             	add    $0x8,%edx
801029a7:	01 d2                	add    %edx,%edx
801029a9:	83 c2 01             	add    $0x1,%edx
801029ac:	89 44 24 04          	mov    %eax,0x4(%esp)
801029b0:	89 14 24             	mov    %edx,(%esp)
801029b3:	e8 eb fe ff ff       	call   801028a3 <ioapicwrite>
801029b8:	eb 01                	jmp    801029bb <ioapicenable+0x49>
801029ba:	90                   	nop
801029bb:	c9                   	leave  
801029bc:	c3                   	ret    
801029bd:	00 00                	add    %al,(%eax)
	...

801029c0 <v2p>:
801029c0:	55                   	push   %ebp
801029c1:	89 e5                	mov    %esp,%ebp
801029c3:	8b 45 08             	mov    0x8(%ebp),%eax
801029c6:	2d 00 00 00 80       	sub    $0x80000000,%eax
801029cb:	5d                   	pop    %ebp
801029cc:	c3                   	ret    

801029cd <kinit1>:
801029cd:	55                   	push   %ebp
801029ce:	89 e5                	mov    %esp,%ebp
801029d0:	83 ec 18             	sub    $0x18,%esp
801029d3:	c7 44 24 04 46 87 10 	movl   $0x80108746,0x4(%esp)
801029da:	80 
801029db:	c7 04 24 60 f8 10 80 	movl   $0x8010f860,(%esp)
801029e2:	e8 db 24 00 00       	call   80104ec2 <initlock>
801029e7:	c7 05 94 f8 10 80 00 	movl   $0x0,0x8010f894
801029ee:	00 00 00 
801029f1:	8b 45 0c             	mov    0xc(%ebp),%eax
801029f4:	89 44 24 04          	mov    %eax,0x4(%esp)
801029f8:	8b 45 08             	mov    0x8(%ebp),%eax
801029fb:	89 04 24             	mov    %eax,(%esp)
801029fe:	e8 26 00 00 00       	call   80102a29 <freerange>
80102a03:	c9                   	leave  
80102a04:	c3                   	ret    

80102a05 <kinit2>:
80102a05:	55                   	push   %ebp
80102a06:	89 e5                	mov    %esp,%ebp
80102a08:	83 ec 18             	sub    $0x18,%esp
80102a0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80102a0e:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a12:	8b 45 08             	mov    0x8(%ebp),%eax
80102a15:	89 04 24             	mov    %eax,(%esp)
80102a18:	e8 0c 00 00 00       	call   80102a29 <freerange>
80102a1d:	c7 05 94 f8 10 80 01 	movl   $0x1,0x8010f894
80102a24:	00 00 00 
80102a27:	c9                   	leave  
80102a28:	c3                   	ret    

80102a29 <freerange>:
80102a29:	55                   	push   %ebp
80102a2a:	89 e5                	mov    %esp,%ebp
80102a2c:	83 ec 28             	sub    $0x28,%esp
80102a2f:	8b 45 08             	mov    0x8(%ebp),%eax
80102a32:	05 ff 0f 00 00       	add    $0xfff,%eax
80102a37:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80102a3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102a3f:	eb 12                	jmp    80102a53 <freerange+0x2a>
80102a41:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102a44:	89 04 24             	mov    %eax,(%esp)
80102a47:	e8 19 00 00 00       	call   80102a65 <kfree>
80102a4c:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
80102a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102a56:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
80102a5c:	8b 45 0c             	mov    0xc(%ebp),%eax
80102a5f:	39 c2                	cmp    %eax,%edx
80102a61:	76 de                	jbe    80102a41 <freerange+0x18>
80102a63:	c9                   	leave  
80102a64:	c3                   	ret    

80102a65 <kfree>:
80102a65:	55                   	push   %ebp
80102a66:	89 e5                	mov    %esp,%ebp
80102a68:	83 ec 28             	sub    $0x28,%esp
80102a6b:	8b 45 08             	mov    0x8(%ebp),%eax
80102a6e:	25 ff 0f 00 00       	and    $0xfff,%eax
80102a73:	85 c0                	test   %eax,%eax
80102a75:	75 1b                	jne    80102a92 <kfree+0x2d>
80102a77:	81 7d 08 1c 8d 11 80 	cmpl   $0x80118d1c,0x8(%ebp)
80102a7e:	72 12                	jb     80102a92 <kfree+0x2d>
80102a80:	8b 45 08             	mov    0x8(%ebp),%eax
80102a83:	89 04 24             	mov    %eax,(%esp)
80102a86:	e8 35 ff ff ff       	call   801029c0 <v2p>
80102a8b:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102a90:	76 0c                	jbe    80102a9e <kfree+0x39>
80102a92:	c7 04 24 4b 87 10 80 	movl   $0x8010874b,(%esp)
80102a99:	e8 9c da ff ff       	call   8010053a <panic>
80102a9e:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80102aa5:	00 
80102aa6:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102aad:	00 
80102aae:	8b 45 08             	mov    0x8(%ebp),%eax
80102ab1:	89 04 24             	mov    %eax,(%esp)
80102ab4:	e8 79 26 00 00       	call   80105132 <memset>
80102ab9:	a1 94 f8 10 80       	mov    0x8010f894,%eax
80102abe:	85 c0                	test   %eax,%eax
80102ac0:	74 0c                	je     80102ace <kfree+0x69>
80102ac2:	c7 04 24 60 f8 10 80 	movl   $0x8010f860,(%esp)
80102ac9:	e8 15 24 00 00       	call   80104ee3 <acquire>
80102ace:	8b 45 08             	mov    0x8(%ebp),%eax
80102ad1:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102ad4:	8b 15 98 f8 10 80    	mov    0x8010f898,%edx
80102ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102add:	89 10                	mov    %edx,(%eax)
80102adf:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102ae2:	a3 98 f8 10 80       	mov    %eax,0x8010f898
80102ae7:	a1 94 f8 10 80       	mov    0x8010f894,%eax
80102aec:	85 c0                	test   %eax,%eax
80102aee:	74 0c                	je     80102afc <kfree+0x97>
80102af0:	c7 04 24 60 f8 10 80 	movl   $0x8010f860,(%esp)
80102af7:	e8 48 24 00 00       	call   80104f44 <release>
80102afc:	c9                   	leave  
80102afd:	c3                   	ret    

80102afe <kalloc>:
80102afe:	55                   	push   %ebp
80102aff:	89 e5                	mov    %esp,%ebp
80102b01:	83 ec 28             	sub    $0x28,%esp
80102b04:	a1 94 f8 10 80       	mov    0x8010f894,%eax
80102b09:	85 c0                	test   %eax,%eax
80102b0b:	74 0c                	je     80102b19 <kalloc+0x1b>
80102b0d:	c7 04 24 60 f8 10 80 	movl   $0x8010f860,(%esp)
80102b14:	e8 ca 23 00 00       	call   80104ee3 <acquire>
80102b19:	a1 98 f8 10 80       	mov    0x8010f898,%eax
80102b1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102b21:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80102b25:	74 0a                	je     80102b31 <kalloc+0x33>
80102b27:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102b2a:	8b 00                	mov    (%eax),%eax
80102b2c:	a3 98 f8 10 80       	mov    %eax,0x8010f898
80102b31:	a1 94 f8 10 80       	mov    0x8010f894,%eax
80102b36:	85 c0                	test   %eax,%eax
80102b38:	74 0c                	je     80102b46 <kalloc+0x48>
80102b3a:	c7 04 24 60 f8 10 80 	movl   $0x8010f860,(%esp)
80102b41:	e8 fe 23 00 00       	call   80104f44 <release>
80102b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102b49:	c9                   	leave  
80102b4a:	c3                   	ret    
	...

80102b4c <inb>:
80102b4c:	55                   	push   %ebp
80102b4d:	89 e5                	mov    %esp,%ebp
80102b4f:	83 ec 14             	sub    $0x14,%esp
80102b52:	8b 45 08             	mov    0x8(%ebp),%eax
80102b55:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
80102b59:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
80102b5d:	89 c2                	mov    %eax,%edx
80102b5f:	ec                   	in     (%dx),%al
80102b60:	88 45 ff             	mov    %al,-0x1(%ebp)
80102b63:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
80102b67:	c9                   	leave  
80102b68:	c3                   	ret    

80102b69 <kbdgetc>:
80102b69:	55                   	push   %ebp
80102b6a:	89 e5                	mov    %esp,%ebp
80102b6c:	83 ec 14             	sub    $0x14,%esp
80102b6f:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
80102b76:	e8 d1 ff ff ff       	call   80102b4c <inb>
80102b7b:	0f b6 c0             	movzbl %al,%eax
80102b7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102b81:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102b84:	83 e0 01             	and    $0x1,%eax
80102b87:	85 c0                	test   %eax,%eax
80102b89:	75 0a                	jne    80102b95 <kbdgetc+0x2c>
80102b8b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102b90:	e9 20 01 00 00       	jmp    80102cb5 <kbdgetc+0x14c>
80102b95:	c7 04 24 60 00 00 00 	movl   $0x60,(%esp)
80102b9c:	e8 ab ff ff ff       	call   80102b4c <inb>
80102ba1:	0f b6 c0             	movzbl %al,%eax
80102ba4:	89 45 f8             	mov    %eax,-0x8(%ebp)
80102ba7:	81 7d f8 e0 00 00 00 	cmpl   $0xe0,-0x8(%ebp)
80102bae:	75 17                	jne    80102bc7 <kbdgetc+0x5e>
80102bb0:	a1 5c b6 10 80       	mov    0x8010b65c,%eax
80102bb5:	83 c8 40             	or     $0x40,%eax
80102bb8:	a3 5c b6 10 80       	mov    %eax,0x8010b65c
80102bbd:	b8 00 00 00 00       	mov    $0x0,%eax
80102bc2:	e9 ee 00 00 00       	jmp    80102cb5 <kbdgetc+0x14c>
80102bc7:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102bca:	25 80 00 00 00       	and    $0x80,%eax
80102bcf:	85 c0                	test   %eax,%eax
80102bd1:	74 44                	je     80102c17 <kbdgetc+0xae>
80102bd3:	a1 5c b6 10 80       	mov    0x8010b65c,%eax
80102bd8:	83 e0 40             	and    $0x40,%eax
80102bdb:	85 c0                	test   %eax,%eax
80102bdd:	75 08                	jne    80102be7 <kbdgetc+0x7e>
80102bdf:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102be2:	83 e0 7f             	and    $0x7f,%eax
80102be5:	eb 03                	jmp    80102bea <kbdgetc+0x81>
80102be7:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102bea:	89 45 f8             	mov    %eax,-0x8(%ebp)
80102bed:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102bf0:	0f b6 80 20 90 10 80 	movzbl -0x7fef6fe0(%eax),%eax
80102bf7:	83 c8 40             	or     $0x40,%eax
80102bfa:	0f b6 c0             	movzbl %al,%eax
80102bfd:	f7 d0                	not    %eax
80102bff:	89 c2                	mov    %eax,%edx
80102c01:	a1 5c b6 10 80       	mov    0x8010b65c,%eax
80102c06:	21 d0                	and    %edx,%eax
80102c08:	a3 5c b6 10 80       	mov    %eax,0x8010b65c
80102c0d:	b8 00 00 00 00       	mov    $0x0,%eax
80102c12:	e9 9e 00 00 00       	jmp    80102cb5 <kbdgetc+0x14c>
80102c17:	a1 5c b6 10 80       	mov    0x8010b65c,%eax
80102c1c:	83 e0 40             	and    $0x40,%eax
80102c1f:	85 c0                	test   %eax,%eax
80102c21:	74 14                	je     80102c37 <kbdgetc+0xce>
80102c23:	81 4d f8 80 00 00 00 	orl    $0x80,-0x8(%ebp)
80102c2a:	a1 5c b6 10 80       	mov    0x8010b65c,%eax
80102c2f:	83 e0 bf             	and    $0xffffffbf,%eax
80102c32:	a3 5c b6 10 80       	mov    %eax,0x8010b65c
80102c37:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102c3a:	0f b6 80 20 90 10 80 	movzbl -0x7fef6fe0(%eax),%eax
80102c41:	0f b6 d0             	movzbl %al,%edx
80102c44:	a1 5c b6 10 80       	mov    0x8010b65c,%eax
80102c49:	09 d0                	or     %edx,%eax
80102c4b:	a3 5c b6 10 80       	mov    %eax,0x8010b65c
80102c50:	8b 45 f8             	mov    -0x8(%ebp),%eax
80102c53:	0f b6 80 20 91 10 80 	movzbl -0x7fef6ee0(%eax),%eax
80102c5a:	0f b6 d0             	movzbl %al,%edx
80102c5d:	a1 5c b6 10 80       	mov    0x8010b65c,%eax
80102c62:	31 d0                	xor    %edx,%eax
80102c64:	a3 5c b6 10 80       	mov    %eax,0x8010b65c
80102c69:	a1 5c b6 10 80       	mov    0x8010b65c,%eax
80102c6e:	83 e0 03             	and    $0x3,%eax
80102c71:	8b 04 85 20 95 10 80 	mov    -0x7fef6ae0(,%eax,4),%eax
80102c78:	03 45 f8             	add    -0x8(%ebp),%eax
80102c7b:	0f b6 00             	movzbl (%eax),%eax
80102c7e:	0f b6 c0             	movzbl %al,%eax
80102c81:	89 45 fc             	mov    %eax,-0x4(%ebp)
80102c84:	a1 5c b6 10 80       	mov    0x8010b65c,%eax
80102c89:	83 e0 08             	and    $0x8,%eax
80102c8c:	85 c0                	test   %eax,%eax
80102c8e:	74 22                	je     80102cb2 <kbdgetc+0x149>
80102c90:	83 7d fc 60          	cmpl   $0x60,-0x4(%ebp)
80102c94:	76 0c                	jbe    80102ca2 <kbdgetc+0x139>
80102c96:	83 7d fc 7a          	cmpl   $0x7a,-0x4(%ebp)
80102c9a:	77 06                	ja     80102ca2 <kbdgetc+0x139>
80102c9c:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
80102ca0:	eb 10                	jmp    80102cb2 <kbdgetc+0x149>
80102ca2:	83 7d fc 40          	cmpl   $0x40,-0x4(%ebp)
80102ca6:	76 0a                	jbe    80102cb2 <kbdgetc+0x149>
80102ca8:	83 7d fc 5a          	cmpl   $0x5a,-0x4(%ebp)
80102cac:	77 04                	ja     80102cb2 <kbdgetc+0x149>
80102cae:	83 45 fc 20          	addl   $0x20,-0x4(%ebp)
80102cb2:	8b 45 fc             	mov    -0x4(%ebp),%eax
80102cb5:	c9                   	leave  
80102cb6:	c3                   	ret    

80102cb7 <kbdintr>:
80102cb7:	55                   	push   %ebp
80102cb8:	89 e5                	mov    %esp,%ebp
80102cba:	83 ec 18             	sub    $0x18,%esp
80102cbd:	c7 04 24 69 2b 10 80 	movl   $0x80102b69,(%esp)
80102cc4:	e8 e2 da ff ff       	call   801007ab <consoleintr>
80102cc9:	c9                   	leave  
80102cca:	c3                   	ret    
	...

80102ccc <outb>:
80102ccc:	55                   	push   %ebp
80102ccd:	89 e5                	mov    %esp,%ebp
80102ccf:	83 ec 08             	sub    $0x8,%esp
80102cd2:	8b 55 08             	mov    0x8(%ebp),%edx
80102cd5:	8b 45 0c             	mov    0xc(%ebp),%eax
80102cd8:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80102cdc:	88 45 f8             	mov    %al,-0x8(%ebp)
80102cdf:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
80102ce3:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80102ce7:	ee                   	out    %al,(%dx)
80102ce8:	c9                   	leave  
80102ce9:	c3                   	ret    

80102cea <readeflags>:
80102cea:	55                   	push   %ebp
80102ceb:	89 e5                	mov    %esp,%ebp
80102ced:	83 ec 10             	sub    $0x10,%esp
80102cf0:	9c                   	pushf  
80102cf1:	58                   	pop    %eax
80102cf2:	89 45 fc             	mov    %eax,-0x4(%ebp)
80102cf5:	8b 45 fc             	mov    -0x4(%ebp),%eax
80102cf8:	c9                   	leave  
80102cf9:	c3                   	ret    

80102cfa <lapicw>:
80102cfa:	55                   	push   %ebp
80102cfb:	89 e5                	mov    %esp,%ebp
80102cfd:	a1 9c f8 10 80       	mov    0x8010f89c,%eax
80102d02:	8b 55 08             	mov    0x8(%ebp),%edx
80102d05:	c1 e2 02             	shl    $0x2,%edx
80102d08:	8d 14 10             	lea    (%eax,%edx,1),%edx
80102d0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80102d0e:	89 02                	mov    %eax,(%edx)
80102d10:	a1 9c f8 10 80       	mov    0x8010f89c,%eax
80102d15:	83 c0 20             	add    $0x20,%eax
80102d18:	8b 00                	mov    (%eax),%eax
80102d1a:	5d                   	pop    %ebp
80102d1b:	c3                   	ret    

80102d1c <lapicinit>:
80102d1c:	55                   	push   %ebp
80102d1d:	89 e5                	mov    %esp,%ebp
80102d1f:	83 ec 08             	sub    $0x8,%esp
80102d22:	a1 9c f8 10 80       	mov    0x8010f89c,%eax
80102d27:	85 c0                	test   %eax,%eax
80102d29:	0f 84 46 01 00 00    	je     80102e75 <lapicinit+0x159>
80102d2f:	c7 44 24 04 3f 01 00 	movl   $0x13f,0x4(%esp)
80102d36:	00 
80102d37:	c7 04 24 3c 00 00 00 	movl   $0x3c,(%esp)
80102d3e:	e8 b7 ff ff ff       	call   80102cfa <lapicw>
80102d43:	c7 44 24 04 0b 00 00 	movl   $0xb,0x4(%esp)
80102d4a:	00 
80102d4b:	c7 04 24 f8 00 00 00 	movl   $0xf8,(%esp)
80102d52:	e8 a3 ff ff ff       	call   80102cfa <lapicw>
80102d57:	c7 44 24 04 20 00 02 	movl   $0x20020,0x4(%esp)
80102d5e:	00 
80102d5f:	c7 04 24 c8 00 00 00 	movl   $0xc8,(%esp)
80102d66:	e8 8f ff ff ff       	call   80102cfa <lapicw>
80102d6b:	c7 44 24 04 80 96 98 	movl   $0x989680,0x4(%esp)
80102d72:	00 
80102d73:	c7 04 24 e0 00 00 00 	movl   $0xe0,(%esp)
80102d7a:	e8 7b ff ff ff       	call   80102cfa <lapicw>
80102d7f:	c7 44 24 04 00 00 01 	movl   $0x10000,0x4(%esp)
80102d86:	00 
80102d87:	c7 04 24 d4 00 00 00 	movl   $0xd4,(%esp)
80102d8e:	e8 67 ff ff ff       	call   80102cfa <lapicw>
80102d93:	c7 44 24 04 00 00 01 	movl   $0x10000,0x4(%esp)
80102d9a:	00 
80102d9b:	c7 04 24 d8 00 00 00 	movl   $0xd8,(%esp)
80102da2:	e8 53 ff ff ff       	call   80102cfa <lapicw>
80102da7:	a1 9c f8 10 80       	mov    0x8010f89c,%eax
80102dac:	83 c0 30             	add    $0x30,%eax
80102daf:	8b 00                	mov    (%eax),%eax
80102db1:	c1 e8 10             	shr    $0x10,%eax
80102db4:	25 ff 00 00 00       	and    $0xff,%eax
80102db9:	83 f8 03             	cmp    $0x3,%eax
80102dbc:	76 14                	jbe    80102dd2 <lapicinit+0xb6>
80102dbe:	c7 44 24 04 00 00 01 	movl   $0x10000,0x4(%esp)
80102dc5:	00 
80102dc6:	c7 04 24 d0 00 00 00 	movl   $0xd0,(%esp)
80102dcd:	e8 28 ff ff ff       	call   80102cfa <lapicw>
80102dd2:	c7 44 24 04 33 00 00 	movl   $0x33,0x4(%esp)
80102dd9:	00 
80102dda:	c7 04 24 dc 00 00 00 	movl   $0xdc,(%esp)
80102de1:	e8 14 ff ff ff       	call   80102cfa <lapicw>
80102de6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102ded:	00 
80102dee:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
80102df5:	e8 00 ff ff ff       	call   80102cfa <lapicw>
80102dfa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102e01:	00 
80102e02:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
80102e09:	e8 ec fe ff ff       	call   80102cfa <lapicw>
80102e0e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102e15:	00 
80102e16:	c7 04 24 2c 00 00 00 	movl   $0x2c,(%esp)
80102e1d:	e8 d8 fe ff ff       	call   80102cfa <lapicw>
80102e22:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102e29:	00 
80102e2a:	c7 04 24 c4 00 00 00 	movl   $0xc4,(%esp)
80102e31:	e8 c4 fe ff ff       	call   80102cfa <lapicw>
80102e36:	c7 44 24 04 00 85 08 	movl   $0x88500,0x4(%esp)
80102e3d:	00 
80102e3e:	c7 04 24 c0 00 00 00 	movl   $0xc0,(%esp)
80102e45:	e8 b0 fe ff ff       	call   80102cfa <lapicw>
80102e4a:	a1 9c f8 10 80       	mov    0x8010f89c,%eax
80102e4f:	05 00 03 00 00       	add    $0x300,%eax
80102e54:	8b 00                	mov    (%eax),%eax
80102e56:	25 00 10 00 00       	and    $0x1000,%eax
80102e5b:	85 c0                	test   %eax,%eax
80102e5d:	75 eb                	jne    80102e4a <lapicinit+0x12e>
80102e5f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102e66:	00 
80102e67:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80102e6e:	e8 87 fe ff ff       	call   80102cfa <lapicw>
80102e73:	eb 01                	jmp    80102e76 <lapicinit+0x15a>
80102e75:	90                   	nop
80102e76:	c9                   	leave  
80102e77:	c3                   	ret    

80102e78 <cpunum>:
80102e78:	55                   	push   %ebp
80102e79:	89 e5                	mov    %esp,%ebp
80102e7b:	83 ec 18             	sub    $0x18,%esp
80102e7e:	e8 67 fe ff ff       	call   80102cea <readeflags>
80102e83:	25 00 02 00 00       	and    $0x200,%eax
80102e88:	85 c0                	test   %eax,%eax
80102e8a:	74 29                	je     80102eb5 <cpunum+0x3d>
80102e8c:	a1 60 b6 10 80       	mov    0x8010b660,%eax
80102e91:	85 c0                	test   %eax,%eax
80102e93:	0f 94 c2             	sete   %dl
80102e96:	83 c0 01             	add    $0x1,%eax
80102e99:	a3 60 b6 10 80       	mov    %eax,0x8010b660
80102e9e:	84 d2                	test   %dl,%dl
80102ea0:	74 13                	je     80102eb5 <cpunum+0x3d>
80102ea2:	8b 45 04             	mov    0x4(%ebp),%eax
80102ea5:	89 44 24 04          	mov    %eax,0x4(%esp)
80102ea9:	c7 04 24 54 87 10 80 	movl   $0x80108754,(%esp)
80102eb0:	e8 e5 d4 ff ff       	call   8010039a <cprintf>
80102eb5:	a1 9c f8 10 80       	mov    0x8010f89c,%eax
80102eba:	85 c0                	test   %eax,%eax
80102ebc:	74 0f                	je     80102ecd <cpunum+0x55>
80102ebe:	a1 9c f8 10 80       	mov    0x8010f89c,%eax
80102ec3:	83 c0 20             	add    $0x20,%eax
80102ec6:	8b 00                	mov    (%eax),%eax
80102ec8:	c1 e8 18             	shr    $0x18,%eax
80102ecb:	eb 05                	jmp    80102ed2 <cpunum+0x5a>
80102ecd:	b8 00 00 00 00       	mov    $0x0,%eax
80102ed2:	c9                   	leave  
80102ed3:	c3                   	ret    

80102ed4 <lapiceoi>:
80102ed4:	55                   	push   %ebp
80102ed5:	89 e5                	mov    %esp,%ebp
80102ed7:	83 ec 08             	sub    $0x8,%esp
80102eda:	a1 9c f8 10 80       	mov    0x8010f89c,%eax
80102edf:	85 c0                	test   %eax,%eax
80102ee1:	74 14                	je     80102ef7 <lapiceoi+0x23>
80102ee3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80102eea:	00 
80102eeb:	c7 04 24 2c 00 00 00 	movl   $0x2c,(%esp)
80102ef2:	e8 03 fe ff ff       	call   80102cfa <lapicw>
80102ef7:	c9                   	leave  
80102ef8:	c3                   	ret    

80102ef9 <microdelay>:
80102ef9:	55                   	push   %ebp
80102efa:	89 e5                	mov    %esp,%ebp
80102efc:	5d                   	pop    %ebp
80102efd:	c3                   	ret    

80102efe <lapicstartap>:
80102efe:	55                   	push   %ebp
80102eff:	89 e5                	mov    %esp,%ebp
80102f01:	83 ec 1c             	sub    $0x1c,%esp
80102f04:	8b 45 08             	mov    0x8(%ebp),%eax
80102f07:	88 45 ec             	mov    %al,-0x14(%ebp)
80102f0a:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
80102f11:	00 
80102f12:	c7 04 24 70 00 00 00 	movl   $0x70,(%esp)
80102f19:	e8 ae fd ff ff       	call   80102ccc <outb>
80102f1e:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
80102f25:	00 
80102f26:	c7 04 24 71 00 00 00 	movl   $0x71,(%esp)
80102f2d:	e8 9a fd ff ff       	call   80102ccc <outb>
80102f32:	c7 45 fc 67 04 00 80 	movl   $0x80000467,-0x4(%ebp)
80102f39:	8b 45 fc             	mov    -0x4(%ebp),%eax
80102f3c:	66 c7 00 00 00       	movw   $0x0,(%eax)
80102f41:	8b 45 fc             	mov    -0x4(%ebp),%eax
80102f44:	8d 50 02             	lea    0x2(%eax),%edx
80102f47:	8b 45 0c             	mov    0xc(%ebp),%eax
80102f4a:	c1 e8 04             	shr    $0x4,%eax
80102f4d:	66 89 02             	mov    %ax,(%edx)
80102f50:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
80102f54:	c1 e0 18             	shl    $0x18,%eax
80102f57:	89 44 24 04          	mov    %eax,0x4(%esp)
80102f5b:	c7 04 24 c4 00 00 00 	movl   $0xc4,(%esp)
80102f62:	e8 93 fd ff ff       	call   80102cfa <lapicw>
80102f67:	c7 44 24 04 00 c5 00 	movl   $0xc500,0x4(%esp)
80102f6e:	00 
80102f6f:	c7 04 24 c0 00 00 00 	movl   $0xc0,(%esp)
80102f76:	e8 7f fd ff ff       	call   80102cfa <lapicw>
80102f7b:	c7 04 24 c8 00 00 00 	movl   $0xc8,(%esp)
80102f82:	e8 72 ff ff ff       	call   80102ef9 <microdelay>
80102f87:	c7 44 24 04 00 85 00 	movl   $0x8500,0x4(%esp)
80102f8e:	00 
80102f8f:	c7 04 24 c0 00 00 00 	movl   $0xc0,(%esp)
80102f96:	e8 5f fd ff ff       	call   80102cfa <lapicw>
80102f9b:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
80102fa2:	e8 52 ff ff ff       	call   80102ef9 <microdelay>
80102fa7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
80102fae:	eb 40                	jmp    80102ff0 <lapicstartap+0xf2>
80102fb0:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
80102fb4:	c1 e0 18             	shl    $0x18,%eax
80102fb7:	89 44 24 04          	mov    %eax,0x4(%esp)
80102fbb:	c7 04 24 c4 00 00 00 	movl   $0xc4,(%esp)
80102fc2:	e8 33 fd ff ff       	call   80102cfa <lapicw>
80102fc7:	8b 45 0c             	mov    0xc(%ebp),%eax
80102fca:	c1 e8 0c             	shr    $0xc,%eax
80102fcd:	80 cc 06             	or     $0x6,%ah
80102fd0:	89 44 24 04          	mov    %eax,0x4(%esp)
80102fd4:	c7 04 24 c0 00 00 00 	movl   $0xc0,(%esp)
80102fdb:	e8 1a fd ff ff       	call   80102cfa <lapicw>
80102fe0:	c7 04 24 c8 00 00 00 	movl   $0xc8,(%esp)
80102fe7:	e8 0d ff ff ff       	call   80102ef9 <microdelay>
80102fec:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
80102ff0:	83 7d f8 01          	cmpl   $0x1,-0x8(%ebp)
80102ff4:	7e ba                	jle    80102fb0 <lapicstartap+0xb2>
80102ff6:	c9                   	leave  
80102ff7:	c3                   	ret    

80102ff8 <initlog>:
80102ff8:	55                   	push   %ebp
80102ff9:	89 e5                	mov    %esp,%ebp
80102ffb:	83 ec 28             	sub    $0x28,%esp
80102ffe:	90                   	nop
80102fff:	c7 44 24 04 80 87 10 	movl   $0x80108780,0x4(%esp)
80103006:	80 
80103007:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
8010300e:	e8 af 1e 00 00       	call   80104ec2 <initlock>
80103013:	8d 45 e8             	lea    -0x18(%ebp),%eax
80103016:	89 44 24 04          	mov    %eax,0x4(%esp)
8010301a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80103021:	e8 c2 e2 ff ff       	call   801012e8 <readsb>
80103026:	8b 55 e8             	mov    -0x18(%ebp),%edx
80103029:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010302c:	89 d1                	mov    %edx,%ecx
8010302e:	29 c1                	sub    %eax,%ecx
80103030:	89 c8                	mov    %ecx,%eax
80103032:	a3 d4 f8 10 80       	mov    %eax,0x8010f8d4
80103037:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010303a:	a3 d8 f8 10 80       	mov    %eax,0x8010f8d8
8010303f:	c7 05 e0 f8 10 80 01 	movl   $0x1,0x8010f8e0
80103046:	00 00 00 
80103049:	e8 97 01 00 00       	call   801031e5 <recover_from_log>
8010304e:	c9                   	leave  
8010304f:	c3                   	ret    

80103050 <install_trans>:
80103050:	55                   	push   %ebp
80103051:	89 e5                	mov    %esp,%ebp
80103053:	83 ec 28             	sub    $0x28,%esp
80103056:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
8010305d:	e9 89 00 00 00       	jmp    801030eb <install_trans+0x9b>
80103062:	a1 d4 f8 10 80       	mov    0x8010f8d4,%eax
80103067:	03 45 ec             	add    -0x14(%ebp),%eax
8010306a:	83 c0 01             	add    $0x1,%eax
8010306d:	89 c2                	mov    %eax,%edx
8010306f:	a1 e0 f8 10 80       	mov    0x8010f8e0,%eax
80103074:	89 54 24 04          	mov    %edx,0x4(%esp)
80103078:	89 04 24             	mov    %eax,(%esp)
8010307b:	e8 27 d1 ff ff       	call   801001a7 <bread>
80103080:	89 45 f0             	mov    %eax,-0x10(%ebp)
80103083:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103086:	83 c0 10             	add    $0x10,%eax
80103089:	8b 04 85 a8 f8 10 80 	mov    -0x7fef0758(,%eax,4),%eax
80103090:	89 c2                	mov    %eax,%edx
80103092:	a1 e0 f8 10 80       	mov    0x8010f8e0,%eax
80103097:	89 54 24 04          	mov    %edx,0x4(%esp)
8010309b:	89 04 24             	mov    %eax,(%esp)
8010309e:	e8 04 d1 ff ff       	call   801001a7 <bread>
801030a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
801030a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801030a9:	8d 50 18             	lea    0x18(%eax),%edx
801030ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
801030af:	83 c0 18             	add    $0x18,%eax
801030b2:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
801030b9:	00 
801030ba:	89 54 24 04          	mov    %edx,0x4(%esp)
801030be:	89 04 24             	mov    %eax,(%esp)
801030c1:	e8 3f 21 00 00       	call   80105205 <memmove>
801030c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801030c9:	89 04 24             	mov    %eax,(%esp)
801030cc:	e8 0d d1 ff ff       	call   801001de <bwrite>
801030d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801030d4:	89 04 24             	mov    %eax,(%esp)
801030d7:	e8 3c d1 ff ff       	call   80100218 <brelse>
801030dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801030df:	89 04 24             	mov    %eax,(%esp)
801030e2:	e8 31 d1 ff ff       	call   80100218 <brelse>
801030e7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
801030eb:	a1 e4 f8 10 80       	mov    0x8010f8e4,%eax
801030f0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
801030f3:	0f 8f 69 ff ff ff    	jg     80103062 <install_trans+0x12>
801030f9:	c9                   	leave  
801030fa:	c3                   	ret    

801030fb <read_head>:
801030fb:	55                   	push   %ebp
801030fc:	89 e5                	mov    %esp,%ebp
801030fe:	83 ec 28             	sub    $0x28,%esp
80103101:	a1 d4 f8 10 80       	mov    0x8010f8d4,%eax
80103106:	89 c2                	mov    %eax,%edx
80103108:	a1 e0 f8 10 80       	mov    0x8010f8e0,%eax
8010310d:	89 54 24 04          	mov    %edx,0x4(%esp)
80103111:	89 04 24             	mov    %eax,(%esp)
80103114:	e8 8e d0 ff ff       	call   801001a7 <bread>
80103119:	89 45 ec             	mov    %eax,-0x14(%ebp)
8010311c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010311f:	83 c0 18             	add    $0x18,%eax
80103122:	89 45 f0             	mov    %eax,-0x10(%ebp)
80103125:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103128:	8b 00                	mov    (%eax),%eax
8010312a:	a3 e4 f8 10 80       	mov    %eax,0x8010f8e4
8010312f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80103136:	eb 1b                	jmp    80103153 <read_head+0x58>
80103138:	8b 4d f4             	mov    -0xc(%ebp),%ecx
8010313b:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010313e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103141:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
80103145:	8d 51 10             	lea    0x10(%ecx),%edx
80103148:	89 04 95 a8 f8 10 80 	mov    %eax,-0x7fef0758(,%edx,4)
8010314f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80103153:	a1 e4 f8 10 80       	mov    0x8010f8e4,%eax
80103158:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010315b:	7f db                	jg     80103138 <read_head+0x3d>
8010315d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103160:	89 04 24             	mov    %eax,(%esp)
80103163:	e8 b0 d0 ff ff       	call   80100218 <brelse>
80103168:	c9                   	leave  
80103169:	c3                   	ret    

8010316a <write_head>:
8010316a:	55                   	push   %ebp
8010316b:	89 e5                	mov    %esp,%ebp
8010316d:	83 ec 28             	sub    $0x28,%esp
80103170:	a1 d4 f8 10 80       	mov    0x8010f8d4,%eax
80103175:	89 c2                	mov    %eax,%edx
80103177:	a1 e0 f8 10 80       	mov    0x8010f8e0,%eax
8010317c:	89 54 24 04          	mov    %edx,0x4(%esp)
80103180:	89 04 24             	mov    %eax,(%esp)
80103183:	e8 1f d0 ff ff       	call   801001a7 <bread>
80103188:	89 45 ec             	mov    %eax,-0x14(%ebp)
8010318b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010318e:	83 c0 18             	add    $0x18,%eax
80103191:	89 45 f0             	mov    %eax,-0x10(%ebp)
80103194:	8b 15 e4 f8 10 80    	mov    0x8010f8e4,%edx
8010319a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010319d:	89 10                	mov    %edx,(%eax)
8010319f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801031a6:	eb 1b                	jmp    801031c3 <write_head+0x59>
801031a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
801031ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
801031ae:	83 c0 10             	add    $0x10,%eax
801031b1:	8b 0c 85 a8 f8 10 80 	mov    -0x7fef0758(,%eax,4),%ecx
801031b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
801031bb:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
801031bf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801031c3:	a1 e4 f8 10 80       	mov    0x8010f8e4,%eax
801031c8:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801031cb:	7f db                	jg     801031a8 <write_head+0x3e>
801031cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
801031d0:	89 04 24             	mov    %eax,(%esp)
801031d3:	e8 06 d0 ff ff       	call   801001de <bwrite>
801031d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
801031db:	89 04 24             	mov    %eax,(%esp)
801031de:	e8 35 d0 ff ff       	call   80100218 <brelse>
801031e3:	c9                   	leave  
801031e4:	c3                   	ret    

801031e5 <recover_from_log>:
801031e5:	55                   	push   %ebp
801031e6:	89 e5                	mov    %esp,%ebp
801031e8:	83 ec 08             	sub    $0x8,%esp
801031eb:	e8 0b ff ff ff       	call   801030fb <read_head>
801031f0:	e8 5b fe ff ff       	call   80103050 <install_trans>
801031f5:	c7 05 e4 f8 10 80 00 	movl   $0x0,0x8010f8e4
801031fc:	00 00 00 
801031ff:	e8 66 ff ff ff       	call   8010316a <write_head>
80103204:	c9                   	leave  
80103205:	c3                   	ret    

80103206 <begin_trans>:
80103206:	55                   	push   %ebp
80103207:	89 e5                	mov    %esp,%ebp
80103209:	83 ec 18             	sub    $0x18,%esp
8010320c:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
80103213:	e8 cb 1c 00 00       	call   80104ee3 <acquire>
80103218:	eb 14                	jmp    8010322e <begin_trans+0x28>
8010321a:	c7 44 24 04 a0 f8 10 	movl   $0x8010f8a0,0x4(%esp)
80103221:	80 
80103222:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
80103229:	e8 db 19 00 00       	call   80104c09 <sleep>
8010322e:	a1 dc f8 10 80       	mov    0x8010f8dc,%eax
80103233:	85 c0                	test   %eax,%eax
80103235:	75 e3                	jne    8010321a <begin_trans+0x14>
80103237:	c7 05 dc f8 10 80 01 	movl   $0x1,0x8010f8dc
8010323e:	00 00 00 
80103241:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
80103248:	e8 f7 1c 00 00       	call   80104f44 <release>
8010324d:	c9                   	leave  
8010324e:	c3                   	ret    

8010324f <commit_trans>:
8010324f:	55                   	push   %ebp
80103250:	89 e5                	mov    %esp,%ebp
80103252:	83 ec 18             	sub    $0x18,%esp
80103255:	a1 e4 f8 10 80       	mov    0x8010f8e4,%eax
8010325a:	85 c0                	test   %eax,%eax
8010325c:	7e 19                	jle    80103277 <commit_trans+0x28>
8010325e:	e8 07 ff ff ff       	call   8010316a <write_head>
80103263:	e8 e8 fd ff ff       	call   80103050 <install_trans>
80103268:	c7 05 e4 f8 10 80 00 	movl   $0x0,0x8010f8e4
8010326f:	00 00 00 
80103272:	e8 f3 fe ff ff       	call   8010316a <write_head>
80103277:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
8010327e:	e8 60 1c 00 00       	call   80104ee3 <acquire>
80103283:	c7 05 dc f8 10 80 00 	movl   $0x0,0x8010f8dc
8010328a:	00 00 00 
8010328d:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
80103294:	e8 4d 1a 00 00       	call   80104ce6 <wakeup>
80103299:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
801032a0:	e8 9f 1c 00 00       	call   80104f44 <release>
801032a5:	c9                   	leave  
801032a6:	c3                   	ret    

801032a7 <log_write>:
801032a7:	55                   	push   %ebp
801032a8:	89 e5                	mov    %esp,%ebp
801032aa:	83 ec 28             	sub    $0x28,%esp
801032ad:	a1 e4 f8 10 80       	mov    0x8010f8e4,%eax
801032b2:	83 f8 09             	cmp    $0x9,%eax
801032b5:	7f 12                	jg     801032c9 <log_write+0x22>
801032b7:	a1 e4 f8 10 80       	mov    0x8010f8e4,%eax
801032bc:	8b 15 d8 f8 10 80    	mov    0x8010f8d8,%edx
801032c2:	83 ea 01             	sub    $0x1,%edx
801032c5:	39 d0                	cmp    %edx,%eax
801032c7:	7c 0c                	jl     801032d5 <log_write+0x2e>
801032c9:	c7 04 24 84 87 10 80 	movl   $0x80108784,(%esp)
801032d0:	e8 65 d2 ff ff       	call   8010053a <panic>
801032d5:	a1 dc f8 10 80       	mov    0x8010f8dc,%eax
801032da:	85 c0                	test   %eax,%eax
801032dc:	75 0c                	jne    801032ea <log_write+0x43>
801032de:	c7 04 24 9a 87 10 80 	movl   $0x8010879a,(%esp)
801032e5:	e8 50 d2 ff ff       	call   8010053a <panic>
801032ea:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
801032f1:	eb 1d                	jmp    80103310 <log_write+0x69>
801032f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
801032f6:	83 c0 10             	add    $0x10,%eax
801032f9:	8b 04 85 a8 f8 10 80 	mov    -0x7fef0758(,%eax,4),%eax
80103300:	89 c2                	mov    %eax,%edx
80103302:	8b 45 08             	mov    0x8(%ebp),%eax
80103305:	8b 40 08             	mov    0x8(%eax),%eax
80103308:	39 c2                	cmp    %eax,%edx
8010330a:	74 10                	je     8010331c <log_write+0x75>
8010330c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
80103310:	a1 e4 f8 10 80       	mov    0x8010f8e4,%eax
80103315:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80103318:	7f d9                	jg     801032f3 <log_write+0x4c>
8010331a:	eb 01                	jmp    8010331d <log_write+0x76>
8010331c:	90                   	nop
8010331d:	8b 55 f0             	mov    -0x10(%ebp),%edx
80103320:	8b 45 08             	mov    0x8(%ebp),%eax
80103323:	8b 40 08             	mov    0x8(%eax),%eax
80103326:	83 c2 10             	add    $0x10,%edx
80103329:	89 04 95 a8 f8 10 80 	mov    %eax,-0x7fef0758(,%edx,4)
80103330:	a1 d4 f8 10 80       	mov    0x8010f8d4,%eax
80103335:	03 45 f0             	add    -0x10(%ebp),%eax
80103338:	83 c0 01             	add    $0x1,%eax
8010333b:	89 c2                	mov    %eax,%edx
8010333d:	8b 45 08             	mov    0x8(%ebp),%eax
80103340:	8b 40 04             	mov    0x4(%eax),%eax
80103343:	89 54 24 04          	mov    %edx,0x4(%esp)
80103347:	89 04 24             	mov    %eax,(%esp)
8010334a:	e8 58 ce ff ff       	call   801001a7 <bread>
8010334f:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103352:	8b 45 08             	mov    0x8(%ebp),%eax
80103355:	8d 50 18             	lea    0x18(%eax),%edx
80103358:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010335b:	83 c0 18             	add    $0x18,%eax
8010335e:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80103365:	00 
80103366:	89 54 24 04          	mov    %edx,0x4(%esp)
8010336a:	89 04 24             	mov    %eax,(%esp)
8010336d:	e8 93 1e 00 00       	call   80105205 <memmove>
80103372:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103375:	89 04 24             	mov    %eax,(%esp)
80103378:	e8 61 ce ff ff       	call   801001de <bwrite>
8010337d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103380:	89 04 24             	mov    %eax,(%esp)
80103383:	e8 90 ce ff ff       	call   80100218 <brelse>
80103388:	a1 e4 f8 10 80       	mov    0x8010f8e4,%eax
8010338d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80103390:	75 0d                	jne    8010339f <log_write+0xf8>
80103392:	a1 e4 f8 10 80       	mov    0x8010f8e4,%eax
80103397:	83 c0 01             	add    $0x1,%eax
8010339a:	a3 e4 f8 10 80       	mov    %eax,0x8010f8e4
8010339f:	8b 45 08             	mov    0x8(%ebp),%eax
801033a2:	8b 00                	mov    (%eax),%eax
801033a4:	89 c2                	mov    %eax,%edx
801033a6:	83 ca 04             	or     $0x4,%edx
801033a9:	8b 45 08             	mov    0x8(%ebp),%eax
801033ac:	89 10                	mov    %edx,(%eax)
801033ae:	c9                   	leave  
801033af:	c3                   	ret    

801033b0 <v2p>:
#define KERNBASE 0x80000000         // First kernel virtual address
#define KERNLINK (KERNBASE+EXTMEM)  // Address where kernel is linked

#ifndef __ASSEMBLER__

static inline uint v2p(void *a) { return ((uint) (a))  - KERNBASE; }
801033b0:	55                   	push   %ebp
801033b1:	89 e5                	mov    %esp,%ebp
801033b3:	8b 45 08             	mov    0x8(%ebp),%eax
801033b6:	2d 00 00 00 80       	sub    $0x80000000,%eax
801033bb:	5d                   	pop    %ebp
801033bc:	c3                   	ret    

801033bd <p2v>:
static inline void *p2v(uint a) { return (void *) ((a) + KERNBASE); }
801033bd:	55                   	push   %ebp
801033be:	89 e5                	mov    %esp,%ebp
801033c0:	8b 45 08             	mov    0x8(%ebp),%eax
801033c3:	2d 00 00 00 80       	sub    $0x80000000,%eax
801033c8:	5d                   	pop    %ebp
801033c9:	c3                   	ret    

801033ca <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
801033ca:	55                   	push   %ebp
801033cb:	89 e5                	mov    %esp,%ebp
801033cd:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801033d0:	8b 55 08             	mov    0x8(%ebp),%edx
801033d3:	8b 45 0c             	mov    0xc(%ebp),%eax
801033d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
801033d9:	f0 87 02             	lock xchg %eax,(%edx)
801033dc:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
801033df:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
801033e2:	c9                   	leave  
801033e3:	c3                   	ret    

801033e4 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
801033e4:	55                   	push   %ebp
801033e5:	89 e5                	mov    %esp,%ebp
801033e7:	83 e4 f0             	and    $0xfffffff0,%esp
801033ea:	83 ec 10             	sub    $0x10,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
801033ed:	c7 44 24 04 00 00 40 	movl   $0x80400000,0x4(%esp)
801033f4:	80 
801033f5:	c7 04 24 1c 8d 11 80 	movl   $0x80118d1c,(%esp)
801033fc:	e8 cc f5 ff ff       	call   801029cd <kinit1>
  kvmalloc();      // kernel page table
80103401:	e8 c5 49 00 00       	call   80107dcb <kvmalloc>
  mpinit();        // collect info about this machine
80103406:	e8 45 04 00 00       	call   80103850 <mpinit>
  lapicinit();
8010340b:	e8 0c f9 ff ff       	call   80102d1c <lapicinit>
  seginit();       // set up segments
80103410:	e8 58 43 00 00       	call   8010776d <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpu->id);
80103415:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010341b:	0f b6 00             	movzbl (%eax),%eax
8010341e:	0f b6 c0             	movzbl %al,%eax
80103421:	89 44 24 04          	mov    %eax,0x4(%esp)
80103425:	c7 04 24 b1 87 10 80 	movl   $0x801087b1,(%esp)
8010342c:	e8 69 cf ff ff       	call   8010039a <cprintf>
  picinit();       // interrupt controller
80103431:	e8 80 06 00 00       	call   80103ab6 <picinit>
  ioapicinit();    // another interrupt controller
80103436:	e8 82 f4 ff ff       	call   801028bd <ioapicinit>
  consoleinit();   // I/O devices & their interrupts
8010343b:	e8 48 d6 ff ff       	call   80100a88 <consoleinit>
  uartinit();      // serial port
80103440:	e8 72 36 00 00       	call   80106ab7 <uartinit>
  pinit();         // process table
80103445:	e8 7c 0b 00 00       	call   80103fc6 <pinit>
  tvinit();        // trap vectors
8010344a:	e8 1b 32 00 00       	call   8010666a <tvinit>
  binit();         // buffer cache
8010344f:	e8 e0 cb ff ff       	call   80100034 <binit>
  fileinit();      // file table
80103454:	e8 a3 da ff ff       	call   80100efc <fileinit>
  iinit();         // inode cache
80103459:	e8 58 e1 ff ff       	call   801015b6 <iinit>
  ideinit();       // disk
8010345e:	e8 c1 f0 ff ff       	call   80102524 <ideinit>
  if(!ismp)
80103463:	a1 24 f9 10 80       	mov    0x8010f924,%eax
80103468:	85 c0                	test   %eax,%eax
8010346a:	75 05                	jne    80103471 <main+0x8d>
    timerinit();   // uniprocessor timer
8010346c:	e8 41 31 00 00       	call   801065b2 <timerinit>
  startothers();   // start other processors
80103471:	e8 7f 00 00 00       	call   801034f5 <startothers>
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103476:	c7 44 24 04 00 00 00 	movl   $0x8e000000,0x4(%esp)
8010347d:	8e 
8010347e:	c7 04 24 00 00 40 80 	movl   $0x80400000,(%esp)
80103485:	e8 7b f5 ff ff       	call   80102a05 <kinit2>
  userinit();      // first user process
8010348a:	e8 56 0c 00 00       	call   801040e5 <userinit>
  // Finish setting up this processor in mpmain.
  mpmain();
8010348f:	e8 1a 00 00 00       	call   801034ae <mpmain>

80103494 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80103494:	55                   	push   %ebp
80103495:	89 e5                	mov    %esp,%ebp
80103497:	83 ec 08             	sub    $0x8,%esp
  switchkvm(); 
8010349a:	e8 43 49 00 00       	call   80107de2 <switchkvm>
  seginit();
8010349f:	e8 c9 42 00 00       	call   8010776d <seginit>
  lapicinit();
801034a4:	e8 73 f8 ff ff       	call   80102d1c <lapicinit>
  mpmain();
801034a9:	e8 00 00 00 00       	call   801034ae <mpmain>

801034ae <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
801034ae:	55                   	push   %ebp
801034af:	89 e5                	mov    %esp,%ebp
801034b1:	83 ec 18             	sub    $0x18,%esp
  cprintf("cpu%d: starting\n", cpu->id);
801034b4:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801034ba:	0f b6 00             	movzbl (%eax),%eax
801034bd:	0f b6 c0             	movzbl %al,%eax
801034c0:	89 44 24 04          	mov    %eax,0x4(%esp)
801034c4:	c7 04 24 c8 87 10 80 	movl   $0x801087c8,(%esp)
801034cb:	e8 ca ce ff ff       	call   8010039a <cprintf>
  idtinit();       // load idt register
801034d0:	e8 05 33 00 00       	call   801067da <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
801034d5:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801034db:	05 a8 00 00 00       	add    $0xa8,%eax
801034e0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801034e7:	00 
801034e8:	89 04 24             	mov    %eax,(%esp)
801034eb:	e8 da fe ff ff       	call   801033ca <xchg>
  scheduler();     // start running processes
801034f0:	e8 67 15 00 00       	call   80104a5c <scheduler>

801034f5 <startothers>:
pde_t entrypgdir[];  // For entry.S

// Start the non-boot (AP) processors.
static void
startothers(void)
{
801034f5:	55                   	push   %ebp
801034f6:	89 e5                	mov    %esp,%ebp
801034f8:	53                   	push   %ebx
801034f9:	83 ec 24             	sub    $0x24,%esp
  char *stack;

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = p2v(0x7000);
801034fc:	c7 04 24 00 70 00 00 	movl   $0x7000,(%esp)
80103503:	e8 b5 fe ff ff       	call   801033bd <p2v>
80103508:	89 45 ec             	mov    %eax,-0x14(%ebp)
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
8010350b:	b8 8a 00 00 00       	mov    $0x8a,%eax
80103510:	89 44 24 08          	mov    %eax,0x8(%esp)
80103514:	c7 44 24 04 2c b5 10 	movl   $0x8010b52c,0x4(%esp)
8010351b:	80 
8010351c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010351f:	89 04 24             	mov    %eax,(%esp)
80103522:	e8 de 1c 00 00       	call   80105205 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80103527:	c7 45 f0 40 f9 10 80 	movl   $0x8010f940,-0x10(%ebp)
8010352e:	e9 85 00 00 00       	jmp    801035b8 <startothers+0xc3>
    if(c == cpus+cpunum())  // We've started already.
80103533:	e8 40 f9 ff ff       	call   80102e78 <cpunum>
80103538:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
8010353e:	05 40 f9 10 80       	add    $0x8010f940,%eax
80103543:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80103546:	74 68                	je     801035b0 <startothers+0xbb>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what 
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80103548:	e8 b1 f5 ff ff       	call   80102afe <kalloc>
8010354d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    *(void**)(code-4) = stack + KSTACKSIZE;
80103550:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103553:	83 e8 04             	sub    $0x4,%eax
80103556:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103559:	81 c2 00 10 00 00    	add    $0x1000,%edx
8010355f:	89 10                	mov    %edx,(%eax)
    *(void**)(code-8) = mpenter;
80103561:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103564:	83 e8 08             	sub    $0x8,%eax
80103567:	c7 00 94 34 10 80    	movl   $0x80103494,(%eax)
    *(int**)(code-12) = (void *) v2p(entrypgdir);
8010356d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103570:	8d 58 f4             	lea    -0xc(%eax),%ebx
80103573:	c7 04 24 00 a0 10 80 	movl   $0x8010a000,(%esp)
8010357a:	e8 31 fe ff ff       	call   801033b0 <v2p>
8010357f:	89 03                	mov    %eax,(%ebx)

    lapicstartap(c->id, v2p(code));
80103581:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103584:	89 04 24             	mov    %eax,(%esp)
80103587:	e8 24 fe ff ff       	call   801033b0 <v2p>
8010358c:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010358f:	0f b6 12             	movzbl (%edx),%edx
80103592:	0f b6 d2             	movzbl %dl,%edx
80103595:	89 44 24 04          	mov    %eax,0x4(%esp)
80103599:	89 14 24             	mov    %edx,(%esp)
8010359c:	e8 5d f9 ff ff       	call   80102efe <lapicstartap>

    // wait for cpu to finish mpmain()
    while(c->started == 0)
801035a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801035a4:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
801035aa:	85 c0                	test   %eax,%eax
801035ac:	74 f3                	je     801035a1 <startothers+0xac>
801035ae:	eb 01                	jmp    801035b1 <startothers+0xbc>
  code = p2v(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
    if(c == cpus+cpunum())  // We've started already.
      continue;
801035b0:	90                   	nop
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = p2v(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
801035b1:	81 45 f0 bc 00 00 00 	addl   $0xbc,-0x10(%ebp)
801035b8:	a1 20 ff 10 80       	mov    0x8010ff20,%eax
801035bd:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
801035c3:	05 40 f9 10 80       	add    $0x8010f940,%eax
801035c8:	3b 45 f0             	cmp    -0x10(%ebp),%eax
801035cb:	0f 87 62 ff ff ff    	ja     80103533 <startothers+0x3e>

    // wait for cpu to finish mpmain()
    while(c->started == 0)
      ;
  }
}
801035d1:	83 c4 24             	add    $0x24,%esp
801035d4:	5b                   	pop    %ebx
801035d5:	5d                   	pop    %ebp
801035d6:	c3                   	ret    
	...

801035d8 <p2v>:
801035d8:	55                   	push   %ebp
801035d9:	89 e5                	mov    %esp,%ebp
801035db:	8b 45 08             	mov    0x8(%ebp),%eax
801035de:	2d 00 00 00 80       	sub    $0x80000000,%eax
801035e3:	5d                   	pop    %ebp
801035e4:	c3                   	ret    

801035e5 <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
801035e5:	55                   	push   %ebp
801035e6:	89 e5                	mov    %esp,%ebp
801035e8:	83 ec 14             	sub    $0x14,%esp
801035eb:	8b 45 08             	mov    0x8(%ebp),%eax
801035ee:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801035f2:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
801035f6:	89 c2                	mov    %eax,%edx
801035f8:	ec                   	in     (%dx),%al
801035f9:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
801035fc:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
80103600:	c9                   	leave  
80103601:	c3                   	ret    

80103602 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
80103602:	55                   	push   %ebp
80103603:	89 e5                	mov    %esp,%ebp
80103605:	83 ec 08             	sub    $0x8,%esp
80103608:	8b 55 08             	mov    0x8(%ebp),%edx
8010360b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010360e:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80103612:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103615:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
80103619:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
8010361d:	ee                   	out    %al,(%dx)
}
8010361e:	c9                   	leave  
8010361f:	c3                   	ret    

80103620 <mpbcpu>:
int ncpu;
uchar ioapicid;

int
mpbcpu(void)
{
80103620:	55                   	push   %ebp
80103621:	89 e5                	mov    %esp,%ebp
  return bcpu-cpus;
80103623:	a1 64 b6 10 80       	mov    0x8010b664,%eax
80103628:	89 c2                	mov    %eax,%edx
8010362a:	b8 40 f9 10 80       	mov    $0x8010f940,%eax
8010362f:	89 d1                	mov    %edx,%ecx
80103631:	29 c1                	sub    %eax,%ecx
80103633:	89 c8                	mov    %ecx,%eax
80103635:	c1 f8 02             	sar    $0x2,%eax
80103638:	69 c0 cf 46 7d 67    	imul   $0x677d46cf,%eax,%eax
}
8010363e:	5d                   	pop    %ebp
8010363f:	c3                   	ret    

80103640 <sum>:

static uchar
sum(uchar *addr, int len)
{
80103640:	55                   	push   %ebp
80103641:	89 e5                	mov    %esp,%ebp
80103643:	83 ec 10             	sub    $0x10,%esp
  int i, sum;
  
  sum = 0;
80103646:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  for(i=0; i<len; i++)
8010364d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
80103654:	eb 13                	jmp    80103669 <sum+0x29>
    sum += addr[i];
80103656:	8b 45 f8             	mov    -0x8(%ebp),%eax
80103659:	03 45 08             	add    0x8(%ebp),%eax
8010365c:	0f b6 00             	movzbl (%eax),%eax
8010365f:	0f b6 c0             	movzbl %al,%eax
80103662:	01 45 fc             	add    %eax,-0x4(%ebp)
sum(uchar *addr, int len)
{
  int i, sum;
  
  sum = 0;
  for(i=0; i<len; i++)
80103665:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
80103669:	8b 45 f8             	mov    -0x8(%ebp),%eax
8010366c:	3b 45 0c             	cmp    0xc(%ebp),%eax
8010366f:	7c e5                	jl     80103656 <sum+0x16>
    sum += addr[i];
  return sum;
80103671:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80103674:	c9                   	leave  
80103675:	c3                   	ret    

80103676 <mpsearch1>:

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103676:	55                   	push   %ebp
80103677:	89 e5                	mov    %esp,%ebp
80103679:	83 ec 28             	sub    $0x28,%esp
  uchar *e, *p, *addr;

  addr = p2v(a);
8010367c:	8b 45 08             	mov    0x8(%ebp),%eax
8010367f:	89 04 24             	mov    %eax,(%esp)
80103682:	e8 51 ff ff ff       	call   801035d8 <p2v>
80103687:	89 45 f4             	mov    %eax,-0xc(%ebp)
  e = addr+len;
8010368a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010368d:	03 45 f4             	add    -0xc(%ebp),%eax
80103690:	89 45 ec             	mov    %eax,-0x14(%ebp)
  for(p = addr; p < e; p += sizeof(struct mp))
80103693:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103696:	89 45 f0             	mov    %eax,-0x10(%ebp)
80103699:	eb 3f                	jmp    801036da <mpsearch1+0x64>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
8010369b:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
801036a2:	00 
801036a3:	c7 44 24 04 dc 87 10 	movl   $0x801087dc,0x4(%esp)
801036aa:	80 
801036ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
801036ae:	89 04 24             	mov    %eax,(%esp)
801036b1:	e8 f3 1a 00 00       	call   801051a9 <memcmp>
801036b6:	85 c0                	test   %eax,%eax
801036b8:	75 1c                	jne    801036d6 <mpsearch1+0x60>
801036ba:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
801036c1:	00 
801036c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801036c5:	89 04 24             	mov    %eax,(%esp)
801036c8:	e8 73 ff ff ff       	call   80103640 <sum>
801036cd:	84 c0                	test   %al,%al
801036cf:	75 05                	jne    801036d6 <mpsearch1+0x60>
      return (struct mp*)p;
801036d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801036d4:	eb 11                	jmp    801036e7 <mpsearch1+0x71>
{
  uchar *e, *p, *addr;

  addr = p2v(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
801036d6:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
801036da:	8b 45 f0             	mov    -0x10(%ebp),%eax
801036dd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
801036e0:	72 b9                	jb     8010369b <mpsearch1+0x25>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
801036e2:	b8 00 00 00 00       	mov    $0x0,%eax
}
801036e7:	c9                   	leave  
801036e8:	c3                   	ret    

801036e9 <mpsearch>:
// 1) in the first KB of the EBDA;
// 2) in the last KB of system base memory;
// 3) in the BIOS ROM between 0xE0000 and 0xFFFFF.
static struct mp*
mpsearch(void)
{
801036e9:	55                   	push   %ebp
801036ea:	89 e5                	mov    %esp,%ebp
801036ec:	83 ec 28             	sub    $0x28,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
801036ef:	c7 45 ec 00 04 00 80 	movl   $0x80000400,-0x14(%ebp)
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
801036f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
801036f9:	83 c0 0f             	add    $0xf,%eax
801036fc:	0f b6 00             	movzbl (%eax),%eax
801036ff:	0f b6 c0             	movzbl %al,%eax
80103702:	89 c2                	mov    %eax,%edx
80103704:	c1 e2 08             	shl    $0x8,%edx
80103707:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010370a:	83 c0 0e             	add    $0xe,%eax
8010370d:	0f b6 00             	movzbl (%eax),%eax
80103710:	0f b6 c0             	movzbl %al,%eax
80103713:	09 d0                	or     %edx,%eax
80103715:	c1 e0 04             	shl    $0x4,%eax
80103718:	89 45 f0             	mov    %eax,-0x10(%ebp)
8010371b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010371f:	74 21                	je     80103742 <mpsearch+0x59>
    if((mp = mpsearch1(p, 1024)))
80103721:	c7 44 24 04 00 04 00 	movl   $0x400,0x4(%esp)
80103728:	00 
80103729:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010372c:	89 04 24             	mov    %eax,(%esp)
8010372f:	e8 42 ff ff ff       	call   80103676 <mpsearch1>
80103734:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103737:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010373b:	74 50                	je     8010378d <mpsearch+0xa4>
      return mp;
8010373d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103740:	eb 5f                	jmp    801037a1 <mpsearch+0xb8>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103742:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103745:	83 c0 14             	add    $0x14,%eax
80103748:	0f b6 00             	movzbl (%eax),%eax
8010374b:	0f b6 c0             	movzbl %al,%eax
8010374e:	89 c2                	mov    %eax,%edx
80103750:	c1 e2 08             	shl    $0x8,%edx
80103753:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103756:	83 c0 13             	add    $0x13,%eax
80103759:	0f b6 00             	movzbl (%eax),%eax
8010375c:	0f b6 c0             	movzbl %al,%eax
8010375f:	09 d0                	or     %edx,%eax
80103761:	c1 e0 0a             	shl    $0xa,%eax
80103764:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((mp = mpsearch1(p-1024, 1024)))
80103767:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010376a:	2d 00 04 00 00       	sub    $0x400,%eax
8010376f:	c7 44 24 04 00 04 00 	movl   $0x400,0x4(%esp)
80103776:	00 
80103777:	89 04 24             	mov    %eax,(%esp)
8010377a:	e8 f7 fe ff ff       	call   80103676 <mpsearch1>
8010377f:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103782:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80103786:	74 05                	je     8010378d <mpsearch+0xa4>
      return mp;
80103788:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010378b:	eb 14                	jmp    801037a1 <mpsearch+0xb8>
  }
  return mpsearch1(0xF0000, 0x10000);
8010378d:	c7 44 24 04 00 00 01 	movl   $0x10000,0x4(%esp)
80103794:	00 
80103795:	c7 04 24 00 00 0f 00 	movl   $0xf0000,(%esp)
8010379c:	e8 d5 fe ff ff       	call   80103676 <mpsearch1>
}
801037a1:	c9                   	leave  
801037a2:	c3                   	ret    

801037a3 <mpconfig>:
// Check for correct signature, calculate the checksum and,
// if correct, check the version.
// To do: check extended table checksum.
static struct mpconf*
mpconfig(struct mp **pmp)
{
801037a3:	55                   	push   %ebp
801037a4:	89 e5                	mov    %esp,%ebp
801037a6:	83 ec 28             	sub    $0x28,%esp
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801037a9:	e8 3b ff ff ff       	call   801036e9 <mpsearch>
801037ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
801037b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801037b5:	74 0a                	je     801037c1 <mpconfig+0x1e>
801037b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801037ba:	8b 40 04             	mov    0x4(%eax),%eax
801037bd:	85 c0                	test   %eax,%eax
801037bf:	75 0a                	jne    801037cb <mpconfig+0x28>
    return 0;
801037c1:	b8 00 00 00 00       	mov    $0x0,%eax
801037c6:	e9 83 00 00 00       	jmp    8010384e <mpconfig+0xab>
  conf = (struct mpconf*) p2v((uint) mp->physaddr);
801037cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801037ce:	8b 40 04             	mov    0x4(%eax),%eax
801037d1:	89 04 24             	mov    %eax,(%esp)
801037d4:	e8 ff fd ff ff       	call   801035d8 <p2v>
801037d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
801037dc:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
801037e3:	00 
801037e4:	c7 44 24 04 e1 87 10 	movl   $0x801087e1,0x4(%esp)
801037eb:	80 
801037ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
801037ef:	89 04 24             	mov    %eax,(%esp)
801037f2:	e8 b2 19 00 00       	call   801051a9 <memcmp>
801037f7:	85 c0                	test   %eax,%eax
801037f9:	74 07                	je     80103802 <mpconfig+0x5f>
    return 0;
801037fb:	b8 00 00 00 00       	mov    $0x0,%eax
80103800:	eb 4c                	jmp    8010384e <mpconfig+0xab>
  if(conf->version != 1 && conf->version != 4)
80103802:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103805:	0f b6 40 06          	movzbl 0x6(%eax),%eax
80103809:	3c 01                	cmp    $0x1,%al
8010380b:	74 12                	je     8010381f <mpconfig+0x7c>
8010380d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103810:	0f b6 40 06          	movzbl 0x6(%eax),%eax
80103814:	3c 04                	cmp    $0x4,%al
80103816:	74 07                	je     8010381f <mpconfig+0x7c>
    return 0;
80103818:	b8 00 00 00 00       	mov    $0x0,%eax
8010381d:	eb 2f                	jmp    8010384e <mpconfig+0xab>
  if(sum((uchar*)conf, conf->length) != 0)
8010381f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103822:	0f b7 40 04          	movzwl 0x4(%eax),%eax
80103826:	0f b7 d0             	movzwl %ax,%edx
80103829:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010382c:	89 54 24 04          	mov    %edx,0x4(%esp)
80103830:	89 04 24             	mov    %eax,(%esp)
80103833:	e8 08 fe ff ff       	call   80103640 <sum>
80103838:	84 c0                	test   %al,%al
8010383a:	74 07                	je     80103843 <mpconfig+0xa0>
    return 0;
8010383c:	b8 00 00 00 00       	mov    $0x0,%eax
80103841:	eb 0b                	jmp    8010384e <mpconfig+0xab>
  *pmp = mp;
80103843:	8b 45 08             	mov    0x8(%ebp),%eax
80103846:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103849:	89 10                	mov    %edx,(%eax)
  return conf;
8010384b:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
8010384e:	c9                   	leave  
8010384f:	c3                   	ret    

80103850 <mpinit>:

void
mpinit(void)
{
80103850:	55                   	push   %ebp
80103851:	89 e5                	mov    %esp,%ebp
80103853:	83 ec 38             	sub    $0x38,%esp
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  bcpu = &cpus[0];
80103856:	c7 05 64 b6 10 80 40 	movl   $0x8010f940,0x8010b664
8010385d:	f9 10 80 
  if((conf = mpconfig(&mp)) == 0)
80103860:	8d 45 e0             	lea    -0x20(%ebp),%eax
80103863:	89 04 24             	mov    %eax,(%esp)
80103866:	e8 38 ff ff ff       	call   801037a3 <mpconfig>
8010386b:	89 45 ec             	mov    %eax,-0x14(%ebp)
8010386e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80103872:	0f 84 9d 01 00 00    	je     80103a15 <mpinit+0x1c5>
    return;
  ismp = 1;
80103878:	c7 05 24 f9 10 80 01 	movl   $0x1,0x8010f924
8010387f:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
80103882:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103885:	8b 40 24             	mov    0x24(%eax),%eax
80103888:	a3 9c f8 10 80       	mov    %eax,0x8010f89c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010388d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80103890:	83 c0 2c             	add    $0x2c,%eax
80103893:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103896:	8b 55 ec             	mov    -0x14(%ebp),%edx
80103899:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010389c:	0f b7 40 04          	movzwl 0x4(%eax),%eax
801038a0:	0f b7 c0             	movzwl %ax,%eax
801038a3:	8d 04 02             	lea    (%edx,%eax,1),%eax
801038a6:	89 45 e8             	mov    %eax,-0x18(%ebp)
801038a9:	e9 f2 00 00 00       	jmp    801039a0 <mpinit+0x150>
    switch(*p){
801038ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801038b1:	0f b6 00             	movzbl (%eax),%eax
801038b4:	0f b6 c0             	movzbl %al,%eax
801038b7:	83 f8 04             	cmp    $0x4,%eax
801038ba:	0f 87 bd 00 00 00    	ja     8010397d <mpinit+0x12d>
801038c0:	8b 04 85 24 88 10 80 	mov    -0x7fef77dc(,%eax,4),%eax
801038c7:	ff e0                	jmp    *%eax
    case MPPROC:
      proc = (struct mpproc*)p;
801038c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801038cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(ncpu != proc->apicid){
801038cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
801038d2:	0f b6 40 01          	movzbl 0x1(%eax),%eax
801038d6:	0f b6 d0             	movzbl %al,%edx
801038d9:	a1 20 ff 10 80       	mov    0x8010ff20,%eax
801038de:	39 c2                	cmp    %eax,%edx
801038e0:	74 2d                	je     8010390f <mpinit+0xbf>
        cprintf("mpinit: ncpu=%d apicid=%d\n", ncpu, proc->apicid);
801038e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801038e5:	0f b6 40 01          	movzbl 0x1(%eax),%eax
801038e9:	0f b6 d0             	movzbl %al,%edx
801038ec:	a1 20 ff 10 80       	mov    0x8010ff20,%eax
801038f1:	89 54 24 08          	mov    %edx,0x8(%esp)
801038f5:	89 44 24 04          	mov    %eax,0x4(%esp)
801038f9:	c7 04 24 e6 87 10 80 	movl   $0x801087e6,(%esp)
80103900:	e8 95 ca ff ff       	call   8010039a <cprintf>
        ismp = 0;
80103905:	c7 05 24 f9 10 80 00 	movl   $0x0,0x8010f924
8010390c:	00 00 00 
      }
      if(proc->flags & MPBOOT)
8010390f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80103912:	0f b6 40 03          	movzbl 0x3(%eax),%eax
80103916:	0f b6 c0             	movzbl %al,%eax
80103919:	83 e0 02             	and    $0x2,%eax
8010391c:	85 c0                	test   %eax,%eax
8010391e:	74 15                	je     80103935 <mpinit+0xe5>
        bcpu = &cpus[ncpu];
80103920:	a1 20 ff 10 80       	mov    0x8010ff20,%eax
80103925:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
8010392b:	05 40 f9 10 80       	add    $0x8010f940,%eax
80103930:	a3 64 b6 10 80       	mov    %eax,0x8010b664
      cpus[ncpu].id = ncpu;
80103935:	a1 20 ff 10 80       	mov    0x8010ff20,%eax
8010393a:	8b 15 20 ff 10 80    	mov    0x8010ff20,%edx
80103940:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80103946:	88 90 40 f9 10 80    	mov    %dl,-0x7fef06c0(%eax)
      ncpu++;
8010394c:	a1 20 ff 10 80       	mov    0x8010ff20,%eax
80103951:	83 c0 01             	add    $0x1,%eax
80103954:	a3 20 ff 10 80       	mov    %eax,0x8010ff20
      p += sizeof(struct mpproc);
80103959:	83 45 e4 14          	addl   $0x14,-0x1c(%ebp)
      continue;
8010395d:	eb 41                	jmp    801039a0 <mpinit+0x150>
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
8010395f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103962:	89 45 f4             	mov    %eax,-0xc(%ebp)
      ioapicid = ioapic->apicno;
80103965:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103968:	0f b6 40 01          	movzbl 0x1(%eax),%eax
8010396c:	a2 20 f9 10 80       	mov    %al,0x8010f920
      p += sizeof(struct mpioapic);
80103971:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
      continue;
80103975:	eb 29                	jmp    801039a0 <mpinit+0x150>
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103977:	83 45 e4 08          	addl   $0x8,-0x1c(%ebp)
      continue;
8010397b:	eb 23                	jmp    801039a0 <mpinit+0x150>
    default:
      cprintf("mpinit: unknown config type %x\n", *p);
8010397d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103980:	0f b6 00             	movzbl (%eax),%eax
80103983:	0f b6 c0             	movzbl %al,%eax
80103986:	89 44 24 04          	mov    %eax,0x4(%esp)
8010398a:	c7 04 24 04 88 10 80 	movl   $0x80108804,(%esp)
80103991:	e8 04 ca ff ff       	call   8010039a <cprintf>
      ismp = 0;
80103996:	c7 05 24 f9 10 80 00 	movl   $0x0,0x8010f924
8010399d:	00 00 00 
  bcpu = &cpus[0];
  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801039a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801039a3:	3b 45 e8             	cmp    -0x18(%ebp),%eax
801039a6:	0f 82 02 ff ff ff    	jb     801038ae <mpinit+0x5e>
    default:
      cprintf("mpinit: unknown config type %x\n", *p);
      ismp = 0;
    }
  }
  if(!ismp){
801039ac:	a1 24 f9 10 80       	mov    0x8010f924,%eax
801039b1:	85 c0                	test   %eax,%eax
801039b3:	75 1d                	jne    801039d2 <mpinit+0x182>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
801039b5:	c7 05 20 ff 10 80 01 	movl   $0x1,0x8010ff20
801039bc:	00 00 00 
    lapic = 0;
801039bf:	c7 05 9c f8 10 80 00 	movl   $0x0,0x8010f89c
801039c6:	00 00 00 
    ioapicid = 0;
801039c9:	c6 05 20 f9 10 80 00 	movb   $0x0,0x8010f920
    return;
801039d0:	eb 44                	jmp    80103a16 <mpinit+0x1c6>
  }

  if(mp->imcrp){
801039d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801039d5:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
801039d9:	84 c0                	test   %al,%al
801039db:	74 39                	je     80103a16 <mpinit+0x1c6>
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
801039dd:	c7 44 24 04 70 00 00 	movl   $0x70,0x4(%esp)
801039e4:	00 
801039e5:	c7 04 24 22 00 00 00 	movl   $0x22,(%esp)
801039ec:	e8 11 fc ff ff       	call   80103602 <outb>
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
801039f1:	c7 04 24 23 00 00 00 	movl   $0x23,(%esp)
801039f8:	e8 e8 fb ff ff       	call   801035e5 <inb>
801039fd:	83 c8 01             	or     $0x1,%eax
80103a00:	0f b6 c0             	movzbl %al,%eax
80103a03:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a07:	c7 04 24 23 00 00 00 	movl   $0x23,(%esp)
80103a0e:	e8 ef fb ff ff       	call   80103602 <outb>
80103a13:	eb 01                	jmp    80103a16 <mpinit+0x1c6>
  struct mpproc *proc;
  struct mpioapic *ioapic;

  bcpu = &cpus[0];
  if((conf = mpconfig(&mp)) == 0)
    return;
80103a15:	90                   	nop
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
80103a16:	c9                   	leave  
80103a17:	c3                   	ret    

80103a18 <outb>:
80103a18:	55                   	push   %ebp
80103a19:	89 e5                	mov    %esp,%ebp
80103a1b:	83 ec 08             	sub    $0x8,%esp
80103a1e:	8b 55 08             	mov    0x8(%ebp),%edx
80103a21:	8b 45 0c             	mov    0xc(%ebp),%eax
80103a24:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80103a28:	88 45 f8             	mov    %al,-0x8(%ebp)
80103a2b:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
80103a2f:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80103a33:	ee                   	out    %al,(%dx)
80103a34:	c9                   	leave  
80103a35:	c3                   	ret    

80103a36 <picsetmask>:
80103a36:	55                   	push   %ebp
80103a37:	89 e5                	mov    %esp,%ebp
80103a39:	83 ec 0c             	sub    $0xc,%esp
80103a3c:	8b 45 08             	mov    0x8(%ebp),%eax
80103a3f:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80103a43:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80103a47:	66 a3 00 b0 10 80    	mov    %ax,0x8010b000
80103a4d:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80103a51:	0f b6 c0             	movzbl %al,%eax
80103a54:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a58:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
80103a5f:	e8 b4 ff ff ff       	call   80103a18 <outb>
80103a64:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80103a68:	66 c1 e8 08          	shr    $0x8,%ax
80103a6c:	0f b6 c0             	movzbl %al,%eax
80103a6f:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a73:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
80103a7a:	e8 99 ff ff ff       	call   80103a18 <outb>
80103a7f:	c9                   	leave  
80103a80:	c3                   	ret    

80103a81 <picenable>:
80103a81:	55                   	push   %ebp
80103a82:	89 e5                	mov    %esp,%ebp
80103a84:	53                   	push   %ebx
80103a85:	83 ec 04             	sub    $0x4,%esp
80103a88:	8b 45 08             	mov    0x8(%ebp),%eax
80103a8b:	ba 01 00 00 00       	mov    $0x1,%edx
80103a90:	89 d3                	mov    %edx,%ebx
80103a92:	89 c1                	mov    %eax,%ecx
80103a94:	d3 e3                	shl    %cl,%ebx
80103a96:	89 d8                	mov    %ebx,%eax
80103a98:	89 c2                	mov    %eax,%edx
80103a9a:	f7 d2                	not    %edx
80103a9c:	0f b7 05 00 b0 10 80 	movzwl 0x8010b000,%eax
80103aa3:	21 d0                	and    %edx,%eax
80103aa5:	0f b7 c0             	movzwl %ax,%eax
80103aa8:	89 04 24             	mov    %eax,(%esp)
80103aab:	e8 86 ff ff ff       	call   80103a36 <picsetmask>
80103ab0:	83 c4 04             	add    $0x4,%esp
80103ab3:	5b                   	pop    %ebx
80103ab4:	5d                   	pop    %ebp
80103ab5:	c3                   	ret    

80103ab6 <picinit>:
80103ab6:	55                   	push   %ebp
80103ab7:	89 e5                	mov    %esp,%ebp
80103ab9:	83 ec 08             	sub    $0x8,%esp
80103abc:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
80103ac3:	00 
80103ac4:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
80103acb:	e8 48 ff ff ff       	call   80103a18 <outb>
80103ad0:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
80103ad7:	00 
80103ad8:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
80103adf:	e8 34 ff ff ff       	call   80103a18 <outb>
80103ae4:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
80103aeb:	00 
80103aec:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80103af3:	e8 20 ff ff ff       	call   80103a18 <outb>
80103af8:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
80103aff:	00 
80103b00:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
80103b07:	e8 0c ff ff ff       	call   80103a18 <outb>
80103b0c:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
80103b13:	00 
80103b14:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
80103b1b:	e8 f8 fe ff ff       	call   80103a18 <outb>
80103b20:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
80103b27:	00 
80103b28:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
80103b2f:	e8 e4 fe ff ff       	call   80103a18 <outb>
80103b34:	c7 44 24 04 11 00 00 	movl   $0x11,0x4(%esp)
80103b3b:	00 
80103b3c:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
80103b43:	e8 d0 fe ff ff       	call   80103a18 <outb>
80103b48:	c7 44 24 04 28 00 00 	movl   $0x28,0x4(%esp)
80103b4f:	00 
80103b50:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
80103b57:	e8 bc fe ff ff       	call   80103a18 <outb>
80103b5c:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
80103b63:	00 
80103b64:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
80103b6b:	e8 a8 fe ff ff       	call   80103a18 <outb>
80103b70:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
80103b77:	00 
80103b78:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
80103b7f:	e8 94 fe ff ff       	call   80103a18 <outb>
80103b84:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
80103b8b:	00 
80103b8c:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80103b93:	e8 80 fe ff ff       	call   80103a18 <outb>
80103b98:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
80103b9f:	00 
80103ba0:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80103ba7:	e8 6c fe ff ff       	call   80103a18 <outb>
80103bac:	c7 44 24 04 68 00 00 	movl   $0x68,0x4(%esp)
80103bb3:	00 
80103bb4:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
80103bbb:	e8 58 fe ff ff       	call   80103a18 <outb>
80103bc0:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
80103bc7:	00 
80103bc8:	c7 04 24 a0 00 00 00 	movl   $0xa0,(%esp)
80103bcf:	e8 44 fe ff ff       	call   80103a18 <outb>
80103bd4:	0f b7 05 00 b0 10 80 	movzwl 0x8010b000,%eax
80103bdb:	66 83 f8 ff          	cmp    $0xffffffff,%ax
80103bdf:	74 12                	je     80103bf3 <picinit+0x13d>
80103be1:	0f b7 05 00 b0 10 80 	movzwl 0x8010b000,%eax
80103be8:	0f b7 c0             	movzwl %ax,%eax
80103beb:	89 04 24             	mov    %eax,(%esp)
80103bee:	e8 43 fe ff ff       	call   80103a36 <picsetmask>
80103bf3:	c9                   	leave  
80103bf4:	c3                   	ret    
80103bf5:	00 00                	add    %al,(%eax)
	...

80103bf8 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103bf8:	55                   	push   %ebp
80103bf9:	89 e5                	mov    %esp,%ebp
80103bfb:	83 ec 28             	sub    $0x28,%esp
  struct pipe *p;

  p = 0;
80103bfe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  *f0 = *f1 = 0;
80103c05:	8b 45 0c             	mov    0xc(%ebp),%eax
80103c08:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80103c0e:	8b 45 0c             	mov    0xc(%ebp),%eax
80103c11:	8b 10                	mov    (%eax),%edx
80103c13:	8b 45 08             	mov    0x8(%ebp),%eax
80103c16:	89 10                	mov    %edx,(%eax)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
80103c18:	e8 fb d2 ff ff       	call   80100f18 <filealloc>
80103c1d:	8b 55 08             	mov    0x8(%ebp),%edx
80103c20:	89 02                	mov    %eax,(%edx)
80103c22:	8b 45 08             	mov    0x8(%ebp),%eax
80103c25:	8b 00                	mov    (%eax),%eax
80103c27:	85 c0                	test   %eax,%eax
80103c29:	0f 84 c8 00 00 00    	je     80103cf7 <pipealloc+0xff>
80103c2f:	e8 e4 d2 ff ff       	call   80100f18 <filealloc>
80103c34:	8b 55 0c             	mov    0xc(%ebp),%edx
80103c37:	89 02                	mov    %eax,(%edx)
80103c39:	8b 45 0c             	mov    0xc(%ebp),%eax
80103c3c:	8b 00                	mov    (%eax),%eax
80103c3e:	85 c0                	test   %eax,%eax
80103c40:	0f 84 b1 00 00 00    	je     80103cf7 <pipealloc+0xff>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103c46:	e8 b3 ee ff ff       	call   80102afe <kalloc>
80103c4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
80103c4e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80103c52:	0f 84 9e 00 00 00    	je     80103cf6 <pipealloc+0xfe>
    goto bad;
  p->readopen = 1;
80103c58:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c5b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103c62:	00 00 00 
  p->writeopen = 1;
80103c65:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c68:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103c6f:	00 00 00 
  p->nwrite = 0;
80103c72:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c75:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103c7c:	00 00 00 
  p->nread = 0;
80103c7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c82:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103c89:	00 00 00 
  initlock(&p->lock, "pipe");
80103c8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103c8f:	c7 44 24 04 38 88 10 	movl   $0x80108838,0x4(%esp)
80103c96:	80 
80103c97:	89 04 24             	mov    %eax,(%esp)
80103c9a:	e8 23 12 00 00       	call   80104ec2 <initlock>
  (*f0)->type = FD_PIPE;
80103c9f:	8b 45 08             	mov    0x8(%ebp),%eax
80103ca2:	8b 00                	mov    (%eax),%eax
80103ca4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103caa:	8b 45 08             	mov    0x8(%ebp),%eax
80103cad:	8b 00                	mov    (%eax),%eax
80103caf:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
80103cb3:	8b 45 08             	mov    0x8(%ebp),%eax
80103cb6:	8b 00                	mov    (%eax),%eax
80103cb8:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103cbc:	8b 45 08             	mov    0x8(%ebp),%eax
80103cbf:	8b 00                	mov    (%eax),%eax
80103cc1:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103cc4:	89 50 0c             	mov    %edx,0xc(%eax)
  (*f1)->type = FD_PIPE;
80103cc7:	8b 45 0c             	mov    0xc(%ebp),%eax
80103cca:	8b 00                	mov    (%eax),%eax
80103ccc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103cd2:	8b 45 0c             	mov    0xc(%ebp),%eax
80103cd5:	8b 00                	mov    (%eax),%eax
80103cd7:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103cdb:	8b 45 0c             	mov    0xc(%ebp),%eax
80103cde:	8b 00                	mov    (%eax),%eax
80103ce0:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
80103ce4:	8b 45 0c             	mov    0xc(%ebp),%eax
80103ce7:	8b 00                	mov    (%eax),%eax
80103ce9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103cec:	89 50 0c             	mov    %edx,0xc(%eax)
  return 0;
80103cef:	b8 00 00 00 00       	mov    $0x0,%eax
80103cf4:	eb 43                	jmp    80103d39 <pipealloc+0x141>
  p = 0;
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
80103cf6:	90                   	nop
  (*f1)->pipe = p;
  return 0;

//PAGEBREAK: 20
 bad:
  if(p)
80103cf7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80103cfb:	74 0b                	je     80103d08 <pipealloc+0x110>
    kfree((char*)p);
80103cfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103d00:	89 04 24             	mov    %eax,(%esp)
80103d03:	e8 5d ed ff ff       	call   80102a65 <kfree>
  if(*f0)
80103d08:	8b 45 08             	mov    0x8(%ebp),%eax
80103d0b:	8b 00                	mov    (%eax),%eax
80103d0d:	85 c0                	test   %eax,%eax
80103d0f:	74 0d                	je     80103d1e <pipealloc+0x126>
    fileclose(*f0);
80103d11:	8b 45 08             	mov    0x8(%ebp),%eax
80103d14:	8b 00                	mov    (%eax),%eax
80103d16:	89 04 24             	mov    %eax,(%esp)
80103d19:	e8 a3 d2 ff ff       	call   80100fc1 <fileclose>
  if(*f1)
80103d1e:	8b 45 0c             	mov    0xc(%ebp),%eax
80103d21:	8b 00                	mov    (%eax),%eax
80103d23:	85 c0                	test   %eax,%eax
80103d25:	74 0d                	je     80103d34 <pipealloc+0x13c>
    fileclose(*f1);
80103d27:	8b 45 0c             	mov    0xc(%ebp),%eax
80103d2a:	8b 00                	mov    (%eax),%eax
80103d2c:	89 04 24             	mov    %eax,(%esp)
80103d2f:	e8 8d d2 ff ff       	call   80100fc1 <fileclose>
  return -1;
80103d34:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103d39:	c9                   	leave  
80103d3a:	c3                   	ret    

80103d3b <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103d3b:	55                   	push   %ebp
80103d3c:	89 e5                	mov    %esp,%ebp
80103d3e:	83 ec 18             	sub    $0x18,%esp
  acquire(&p->lock);
80103d41:	8b 45 08             	mov    0x8(%ebp),%eax
80103d44:	89 04 24             	mov    %eax,(%esp)
80103d47:	e8 97 11 00 00       	call   80104ee3 <acquire>
  if(writable){
80103d4c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80103d50:	74 1f                	je     80103d71 <pipeclose+0x36>
    p->writeopen = 0;
80103d52:	8b 45 08             	mov    0x8(%ebp),%eax
80103d55:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
80103d5c:	00 00 00 
    wakeup(&p->nread);
80103d5f:	8b 45 08             	mov    0x8(%ebp),%eax
80103d62:	05 34 02 00 00       	add    $0x234,%eax
80103d67:	89 04 24             	mov    %eax,(%esp)
80103d6a:	e8 77 0f 00 00       	call   80104ce6 <wakeup>
80103d6f:	eb 1d                	jmp    80103d8e <pipeclose+0x53>
  } else {
    p->readopen = 0;
80103d71:	8b 45 08             	mov    0x8(%ebp),%eax
80103d74:	c7 80 3c 02 00 00 00 	movl   $0x0,0x23c(%eax)
80103d7b:	00 00 00 
    wakeup(&p->nwrite);
80103d7e:	8b 45 08             	mov    0x8(%ebp),%eax
80103d81:	05 38 02 00 00       	add    $0x238,%eax
80103d86:	89 04 24             	mov    %eax,(%esp)
80103d89:	e8 58 0f 00 00       	call   80104ce6 <wakeup>
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103d8e:	8b 45 08             	mov    0x8(%ebp),%eax
80103d91:	8b 80 3c 02 00 00    	mov    0x23c(%eax),%eax
80103d97:	85 c0                	test   %eax,%eax
80103d99:	75 25                	jne    80103dc0 <pipeclose+0x85>
80103d9b:	8b 45 08             	mov    0x8(%ebp),%eax
80103d9e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
80103da4:	85 c0                	test   %eax,%eax
80103da6:	75 18                	jne    80103dc0 <pipeclose+0x85>
    release(&p->lock);
80103da8:	8b 45 08             	mov    0x8(%ebp),%eax
80103dab:	89 04 24             	mov    %eax,(%esp)
80103dae:	e8 91 11 00 00       	call   80104f44 <release>
    kfree((char*)p);
80103db3:	8b 45 08             	mov    0x8(%ebp),%eax
80103db6:	89 04 24             	mov    %eax,(%esp)
80103db9:	e8 a7 ec ff ff       	call   80102a65 <kfree>
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103dbe:	eb 0b                	jmp    80103dcb <pipeclose+0x90>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103dc0:	8b 45 08             	mov    0x8(%ebp),%eax
80103dc3:	89 04 24             	mov    %eax,(%esp)
80103dc6:	e8 79 11 00 00       	call   80104f44 <release>
}
80103dcb:	c9                   	leave  
80103dcc:	c3                   	ret    

80103dcd <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103dcd:	55                   	push   %ebp
80103dce:	89 e5                	mov    %esp,%ebp
80103dd0:	53                   	push   %ebx
80103dd1:	83 ec 24             	sub    $0x24,%esp
  int i;

  acquire(&p->lock);
80103dd4:	8b 45 08             	mov    0x8(%ebp),%eax
80103dd7:	89 04 24             	mov    %eax,(%esp)
80103dda:	e8 04 11 00 00       	call   80104ee3 <acquire>
  for(i = 0; i < n; i++){
80103ddf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80103de6:	e9 a6 00 00 00       	jmp    80103e91 <pipewrite+0xc4>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
80103deb:	8b 45 08             	mov    0x8(%ebp),%eax
80103dee:	8b 80 3c 02 00 00    	mov    0x23c(%eax),%eax
80103df4:	85 c0                	test   %eax,%eax
80103df6:	74 0d                	je     80103e05 <pipewrite+0x38>
80103df8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103dfe:	8b 40 24             	mov    0x24(%eax),%eax
80103e01:	85 c0                	test   %eax,%eax
80103e03:	74 15                	je     80103e1a <pipewrite+0x4d>
        release(&p->lock);
80103e05:	8b 45 08             	mov    0x8(%ebp),%eax
80103e08:	89 04 24             	mov    %eax,(%esp)
80103e0b:	e8 34 11 00 00       	call   80104f44 <release>
        return -1;
80103e10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103e15:	e9 9d 00 00 00       	jmp    80103eb7 <pipewrite+0xea>
      }
      wakeup(&p->nread);
80103e1a:	8b 45 08             	mov    0x8(%ebp),%eax
80103e1d:	05 34 02 00 00       	add    $0x234,%eax
80103e22:	89 04 24             	mov    %eax,(%esp)
80103e25:	e8 bc 0e 00 00       	call   80104ce6 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103e2a:	8b 45 08             	mov    0x8(%ebp),%eax
80103e2d:	8b 55 08             	mov    0x8(%ebp),%edx
80103e30:	81 c2 38 02 00 00    	add    $0x238,%edx
80103e36:	89 44 24 04          	mov    %eax,0x4(%esp)
80103e3a:	89 14 24             	mov    %edx,(%esp)
80103e3d:	e8 c7 0d 00 00       	call   80104c09 <sleep>
80103e42:	eb 01                	jmp    80103e45 <pipewrite+0x78>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103e44:	90                   	nop
80103e45:	8b 45 08             	mov    0x8(%ebp),%eax
80103e48:	8b 90 38 02 00 00    	mov    0x238(%eax),%edx
80103e4e:	8b 45 08             	mov    0x8(%ebp),%eax
80103e51:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
80103e57:	05 00 02 00 00       	add    $0x200,%eax
80103e5c:	39 c2                	cmp    %eax,%edx
80103e5e:	74 8b                	je     80103deb <pipewrite+0x1e>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103e60:	8b 45 08             	mov    0x8(%ebp),%eax
80103e63:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
80103e69:	89 c3                	mov    %eax,%ebx
80103e6b:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
80103e71:	8b 55 f4             	mov    -0xc(%ebp),%edx
80103e74:	03 55 0c             	add    0xc(%ebp),%edx
80103e77:	0f b6 0a             	movzbl (%edx),%ecx
80103e7a:	8b 55 08             	mov    0x8(%ebp),%edx
80103e7d:	88 4c 1a 34          	mov    %cl,0x34(%edx,%ebx,1)
80103e81:	8d 50 01             	lea    0x1(%eax),%edx
80103e84:	8b 45 08             	mov    0x8(%ebp),%eax
80103e87:	89 90 38 02 00 00    	mov    %edx,0x238(%eax)
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103e8d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80103e91:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103e94:	3b 45 10             	cmp    0x10(%ebp),%eax
80103e97:	7c ab                	jl     80103e44 <pipewrite+0x77>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103e99:	8b 45 08             	mov    0x8(%ebp),%eax
80103e9c:	05 34 02 00 00       	add    $0x234,%eax
80103ea1:	89 04 24             	mov    %eax,(%esp)
80103ea4:	e8 3d 0e 00 00       	call   80104ce6 <wakeup>
  release(&p->lock);
80103ea9:	8b 45 08             	mov    0x8(%ebp),%eax
80103eac:	89 04 24             	mov    %eax,(%esp)
80103eaf:	e8 90 10 00 00       	call   80104f44 <release>
  return n;
80103eb4:	8b 45 10             	mov    0x10(%ebp),%eax
}
80103eb7:	83 c4 24             	add    $0x24,%esp
80103eba:	5b                   	pop    %ebx
80103ebb:	5d                   	pop    %ebp
80103ebc:	c3                   	ret    

80103ebd <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103ebd:	55                   	push   %ebp
80103ebe:	89 e5                	mov    %esp,%ebp
80103ec0:	53                   	push   %ebx
80103ec1:	83 ec 24             	sub    $0x24,%esp
  int i;

  acquire(&p->lock);
80103ec4:	8b 45 08             	mov    0x8(%ebp),%eax
80103ec7:	89 04 24             	mov    %eax,(%esp)
80103eca:	e8 14 10 00 00       	call   80104ee3 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103ecf:	eb 3a                	jmp    80103f0b <piperead+0x4e>
    if(proc->killed){
80103ed1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ed7:	8b 40 24             	mov    0x24(%eax),%eax
80103eda:	85 c0                	test   %eax,%eax
80103edc:	74 15                	je     80103ef3 <piperead+0x36>
      release(&p->lock);
80103ede:	8b 45 08             	mov    0x8(%ebp),%eax
80103ee1:	89 04 24             	mov    %eax,(%esp)
80103ee4:	e8 5b 10 00 00       	call   80104f44 <release>
      return -1;
80103ee9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103eee:	e9 b6 00 00 00       	jmp    80103fa9 <piperead+0xec>
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103ef3:	8b 45 08             	mov    0x8(%ebp),%eax
80103ef6:	8b 55 08             	mov    0x8(%ebp),%edx
80103ef9:	81 c2 34 02 00 00    	add    $0x234,%edx
80103eff:	89 44 24 04          	mov    %eax,0x4(%esp)
80103f03:	89 14 24             	mov    %edx,(%esp)
80103f06:	e8 fe 0c 00 00       	call   80104c09 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103f0b:	8b 45 08             	mov    0x8(%ebp),%eax
80103f0e:	8b 90 34 02 00 00    	mov    0x234(%eax),%edx
80103f14:	8b 45 08             	mov    0x8(%ebp),%eax
80103f17:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
80103f1d:	39 c2                	cmp    %eax,%edx
80103f1f:	75 0d                	jne    80103f2e <piperead+0x71>
80103f21:	8b 45 08             	mov    0x8(%ebp),%eax
80103f24:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
80103f2a:	85 c0                	test   %eax,%eax
80103f2c:	75 a3                	jne    80103ed1 <piperead+0x14>
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103f2e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80103f35:	eb 49                	jmp    80103f80 <piperead+0xc3>
    if(p->nread == p->nwrite)
80103f37:	8b 45 08             	mov    0x8(%ebp),%eax
80103f3a:	8b 90 34 02 00 00    	mov    0x234(%eax),%edx
80103f40:	8b 45 08             	mov    0x8(%ebp),%eax
80103f43:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
80103f49:	39 c2                	cmp    %eax,%edx
80103f4b:	74 3d                	je     80103f8a <piperead+0xcd>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103f4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103f50:	89 c2                	mov    %eax,%edx
80103f52:	03 55 0c             	add    0xc(%ebp),%edx
80103f55:	8b 45 08             	mov    0x8(%ebp),%eax
80103f58:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
80103f5e:	89 c3                	mov    %eax,%ebx
80103f60:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
80103f66:	8b 4d 08             	mov    0x8(%ebp),%ecx
80103f69:	0f b6 4c 19 34       	movzbl 0x34(%ecx,%ebx,1),%ecx
80103f6e:	88 0a                	mov    %cl,(%edx)
80103f70:	8d 50 01             	lea    0x1(%eax),%edx
80103f73:	8b 45 08             	mov    0x8(%ebp),%eax
80103f76:	89 90 34 02 00 00    	mov    %edx,0x234(%eax)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103f7c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80103f80:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103f83:	3b 45 10             	cmp    0x10(%ebp),%eax
80103f86:	7c af                	jl     80103f37 <piperead+0x7a>
80103f88:	eb 01                	jmp    80103f8b <piperead+0xce>
    if(p->nread == p->nwrite)
      break;
80103f8a:	90                   	nop
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103f8b:	8b 45 08             	mov    0x8(%ebp),%eax
80103f8e:	05 38 02 00 00       	add    $0x238,%eax
80103f93:	89 04 24             	mov    %eax,(%esp)
80103f96:	e8 4b 0d 00 00       	call   80104ce6 <wakeup>
  release(&p->lock);
80103f9b:	8b 45 08             	mov    0x8(%ebp),%eax
80103f9e:	89 04 24             	mov    %eax,(%esp)
80103fa1:	e8 9e 0f 00 00       	call   80104f44 <release>
  return i;
80103fa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80103fa9:	83 c4 24             	add    $0x24,%esp
80103fac:	5b                   	pop    %ebx
80103fad:	5d                   	pop    %ebp
80103fae:	c3                   	ret    
	...

80103fb0 <readeflags>:
  asm volatile("ltr %0" : : "r" (sel));
}

static inline uint
readeflags(void)
{
80103fb0:	55                   	push   %ebp
80103fb1:	89 e5                	mov    %esp,%ebp
80103fb3:	83 ec 10             	sub    $0x10,%esp
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103fb6:	9c                   	pushf  
80103fb7:	58                   	pop    %eax
80103fb8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return eflags;
80103fbb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80103fbe:	c9                   	leave  
80103fbf:	c3                   	ret    

80103fc0 <sti>:
  asm volatile("cli");
}

static inline void
sti(void)
{
80103fc0:	55                   	push   %ebp
80103fc1:	89 e5                	mov    %esp,%ebp
  asm volatile("sti");
80103fc3:	fb                   	sti    
}
80103fc4:	5d                   	pop    %ebp
80103fc5:	c3                   	ret    

80103fc6 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
80103fc6:	55                   	push   %ebp
80103fc7:	89 e5                	mov    %esp,%ebp
80103fc9:	83 ec 18             	sub    $0x18,%esp
  initlock(&ptable.lock, "ptable");
80103fcc:	c7 44 24 04 3d 88 10 	movl   $0x8010883d,0x4(%esp)
80103fd3:	80 
80103fd4:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80103fdb:	e8 e2 0e 00 00       	call   80104ec2 <initlock>
}
80103fe0:	c9                   	leave  
80103fe1:	c3                   	ret    

80103fe2 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103fe2:	55                   	push   %ebp
80103fe3:	89 e5                	mov    %esp,%ebp
80103fe5:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
80103fe8:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80103fef:	e8 ef 0e 00 00       	call   80104ee3 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ff4:	c7 45 f0 74 ff 10 80 	movl   $0x8010ff74,-0x10(%ebp)
80103ffb:	eb 11                	jmp    8010400e <allocproc+0x2c>
    if(p->state == UNUSED)
80103ffd:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104000:	8b 40 0c             	mov    0xc(%eax),%eax
80104003:	85 c0                	test   %eax,%eax
80104005:	74 27                	je     8010402e <allocproc+0x4c>
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104007:	81 45 f0 14 02 00 00 	addl   $0x214,-0x10(%ebp)
8010400e:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104013:	39 45 f0             	cmp    %eax,-0x10(%ebp)
80104016:	72 e5                	jb     80103ffd <allocproc+0x1b>
    if(p->state == UNUSED)
      goto found;
  release(&ptable.lock);
80104018:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
8010401f:	e8 20 0f 00 00       	call   80104f44 <release>
  return 0;
80104024:	b8 00 00 00 00       	mov    $0x0,%eax
80104029:	e9 b5 00 00 00       	jmp    801040e3 <allocproc+0x101>
  char *sp;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;
8010402e:	90                   	nop
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
8010402f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104032:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
  p->pid = nextpid++;
80104039:	a1 04 b0 10 80       	mov    0x8010b004,%eax
8010403e:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104041:	89 42 10             	mov    %eax,0x10(%edx)
80104044:	83 c0 01             	add    $0x1,%eax
80104047:	a3 04 b0 10 80       	mov    %eax,0x8010b004
  release(&ptable.lock);
8010404c:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104053:	e8 ec 0e 00 00       	call   80104f44 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80104058:	e8 a1 ea ff ff       	call   80102afe <kalloc>
8010405d:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104060:	89 42 08             	mov    %eax,0x8(%edx)
80104063:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104066:	8b 40 08             	mov    0x8(%eax),%eax
80104069:	85 c0                	test   %eax,%eax
8010406b:	75 11                	jne    8010407e <allocproc+0x9c>
    p->state = UNUSED;
8010406d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104070:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    return 0;
80104077:	b8 00 00 00 00       	mov    $0x0,%eax
8010407c:	eb 65                	jmp    801040e3 <allocproc+0x101>
  }
  sp = p->kstack + KSTACKSIZE;
8010407e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104081:	8b 40 08             	mov    0x8(%eax),%eax
80104084:	05 00 10 00 00       	add    $0x1000,%eax
80104089:	89 45 f4             	mov    %eax,-0xc(%ebp)
  
  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010408c:	83 6d f4 4c          	subl   $0x4c,-0xc(%ebp)
  p->tf = (struct trapframe*)sp;
80104090:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104093:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104096:	89 50 18             	mov    %edx,0x18(%eax)
  
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
80104099:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
  *(uint*)sp = (uint)trapret;
8010409d:	8b 45 f4             	mov    -0xc(%ebp),%eax
801040a0:	ba 24 66 10 80       	mov    $0x80106624,%edx
801040a5:	89 10                	mov    %edx,(%eax)

  sp -= sizeof *p->context;
801040a7:	83 6d f4 14          	subl   $0x14,-0xc(%ebp)
  p->context = (struct context*)sp;
801040ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
801040ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
801040b1:	89 50 1c             	mov    %edx,0x1c(%eax)
  memset(p->context, 0, sizeof *p->context);
801040b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801040b7:	8b 40 1c             	mov    0x1c(%eax),%eax
801040ba:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
801040c1:	00 
801040c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801040c9:	00 
801040ca:	89 04 24             	mov    %eax,(%esp)
801040cd:	e8 60 10 00 00       	call   80105132 <memset>
  p->context->eip = (uint)forkret;
801040d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801040d5:	8b 40 1c             	mov    0x1c(%eax),%eax
801040d8:	ba dd 4b 10 80       	mov    $0x80104bdd,%edx
801040dd:	89 50 10             	mov    %edx,0x10(%eax)

  return p;
801040e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
801040e3:	c9                   	leave  
801040e4:	c3                   	ret    

801040e5 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801040e5:	55                   	push   %ebp
801040e6:	89 e5                	mov    %esp,%ebp
801040e8:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];
  
  p = allocproc();
801040eb:	e8 f2 fe ff ff       	call   80103fe2 <allocproc>
801040f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  initproc = p;
801040f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801040f6:	a3 68 b6 10 80       	mov    %eax,0x8010b668
  if((p->pgdir = setupkvm()) == 0)
801040fb:	e8 0d 3c 00 00       	call   80107d0d <setupkvm>
80104100:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104103:	89 42 04             	mov    %eax,0x4(%edx)
80104106:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104109:	8b 40 04             	mov    0x4(%eax),%eax
8010410c:	85 c0                	test   %eax,%eax
8010410e:	75 0c                	jne    8010411c <userinit+0x37>
    panic("userinit: out of memory?");
80104110:	c7 04 24 44 88 10 80 	movl   $0x80108844,(%esp)
80104117:	e8 1e c4 ff ff       	call   8010053a <panic>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
8010411c:	ba 2c 00 00 00       	mov    $0x2c,%edx
80104121:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104124:	8b 40 04             	mov    0x4(%eax),%eax
80104127:	89 54 24 08          	mov    %edx,0x8(%esp)
8010412b:	c7 44 24 04 00 b5 10 	movl   $0x8010b500,0x4(%esp)
80104132:	80 
80104133:	89 04 24             	mov    %eax,(%esp)
80104136:	e8 2b 3e 00 00       	call   80107f66 <inituvm>
  p->sz = PGSIZE;
8010413b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010413e:	c7 00 00 10 00 00    	movl   $0x1000,(%eax)
  memset(p->tf, 0, sizeof(*p->tf));
80104144:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104147:	8b 40 18             	mov    0x18(%eax),%eax
8010414a:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
80104151:	00 
80104152:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104159:	00 
8010415a:	89 04 24             	mov    %eax,(%esp)
8010415d:	e8 d0 0f 00 00       	call   80105132 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80104162:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104165:	8b 40 18             	mov    0x18(%eax),%eax
80104168:	66 c7 40 3c 23 00    	movw   $0x23,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010416e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104171:	8b 40 18             	mov    0x18(%eax),%eax
80104174:	66 c7 40 2c 2b 00    	movw   $0x2b,0x2c(%eax)
  p->tf->es = p->tf->ds;
8010417a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010417d:	8b 40 18             	mov    0x18(%eax),%eax
80104180:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104183:	8b 52 18             	mov    0x18(%edx),%edx
80104186:	0f b7 52 2c          	movzwl 0x2c(%edx),%edx
8010418a:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
8010418e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104191:	8b 40 18             	mov    0x18(%eax),%eax
80104194:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104197:	8b 52 18             	mov    0x18(%edx),%edx
8010419a:	0f b7 52 2c          	movzwl 0x2c(%edx),%edx
8010419e:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801041a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801041a5:	8b 40 18             	mov    0x18(%eax),%eax
801041a8:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
801041af:	8b 45 f4             	mov    -0xc(%ebp),%eax
801041b2:	8b 40 18             	mov    0x18(%eax),%eax
801041b5:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801041bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801041bf:	8b 40 18             	mov    0x18(%eax),%eax
801041c2:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
801041c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801041cc:	83 c0 6c             	add    $0x6c,%eax
801041cf:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
801041d6:	00 
801041d7:	c7 44 24 04 5d 88 10 	movl   $0x8010885d,0x4(%esp)
801041de:	80 
801041df:	89 04 24             	mov    %eax,(%esp)
801041e2:	e8 7e 11 00 00       	call   80105365 <safestrcpy>
  p->cwd = namei("/");
801041e7:	c7 04 24 66 88 10 80 	movl   $0x80108866,(%esp)
801041ee:	e8 24 e2 ff ff       	call   80102417 <namei>
801041f3:	8b 55 f4             	mov    -0xc(%ebp),%edx
801041f6:	89 42 68             	mov    %eax,0x68(%edx)

  p->state = RUNNABLE;
801041f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801041fc:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
}
80104203:	c9                   	leave  
80104204:	c3                   	ret    

80104205 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80104205:	55                   	push   %ebp
80104206:	89 e5                	mov    %esp,%ebp
80104208:	83 ec 28             	sub    $0x28,%esp
  uint sz;
  
  sz = proc->sz;
8010420b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104211:	8b 00                	mov    (%eax),%eax
80104213:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(n > 0){
80104216:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
8010421a:	7e 34                	jle    80104250 <growproc+0x4b>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
8010421c:	8b 45 08             	mov    0x8(%ebp),%eax
8010421f:	89 c2                	mov    %eax,%edx
80104221:	03 55 f4             	add    -0xc(%ebp),%edx
80104224:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010422a:	8b 40 04             	mov    0x4(%eax),%eax
8010422d:	89 54 24 08          	mov    %edx,0x8(%esp)
80104231:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104234:	89 54 24 04          	mov    %edx,0x4(%esp)
80104238:	89 04 24             	mov    %eax,(%esp)
8010423b:	e8 a1 3e 00 00       	call   801080e1 <allocuvm>
80104240:	89 45 f4             	mov    %eax,-0xc(%ebp)
80104243:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80104247:	75 41                	jne    8010428a <growproc+0x85>
      return -1;
80104249:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010424e:	eb 58                	jmp    801042a8 <growproc+0xa3>
  } else if(n < 0){
80104250:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80104254:	79 34                	jns    8010428a <growproc+0x85>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80104256:	8b 45 08             	mov    0x8(%ebp),%eax
80104259:	89 c2                	mov    %eax,%edx
8010425b:	03 55 f4             	add    -0xc(%ebp),%edx
8010425e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104264:	8b 40 04             	mov    0x4(%eax),%eax
80104267:	89 54 24 08          	mov    %edx,0x8(%esp)
8010426b:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010426e:	89 54 24 04          	mov    %edx,0x4(%esp)
80104272:	89 04 24             	mov    %eax,(%esp)
80104275:	e8 41 3f 00 00       	call   801081bb <deallocuvm>
8010427a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010427d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80104281:	75 07                	jne    8010428a <growproc+0x85>
      return -1;
80104283:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104288:	eb 1e                	jmp    801042a8 <growproc+0xa3>
  }
  proc->sz = sz;
8010428a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104290:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104293:	89 10                	mov    %edx,(%eax)
  switchuvm(proc);
80104295:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010429b:	89 04 24             	mov    %eax,(%esp)
8010429e:	e8 5c 3b 00 00       	call   80107dff <switchuvm>
  return 0;
801042a3:	b8 00 00 00 00       	mov    $0x0,%eax
}
801042a8:	c9                   	leave  
801042a9:	c3                   	ret    

801042aa <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
801042aa:	55                   	push   %ebp
801042ab:	89 e5                	mov    %esp,%ebp
801042ad:	57                   	push   %edi
801042ae:	56                   	push   %esi
801042af:	53                   	push   %ebx
801042b0:	83 ec 2c             	sub    $0x2c,%esp
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0)
801042b3:	e8 2a fd ff ff       	call   80103fe2 <allocproc>
801042b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801042bb:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
801042bf:	75 0a                	jne    801042cb <fork+0x21>
    return -1;
801042c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801042c6:	e9 47 01 00 00       	jmp    80104412 <fork+0x168>

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
801042cb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042d1:	8b 10                	mov    (%eax),%edx
801042d3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042d9:	8b 40 04             	mov    0x4(%eax),%eax
801042dc:	89 54 24 04          	mov    %edx,0x4(%esp)
801042e0:	89 04 24             	mov    %eax,(%esp)
801042e3:	e8 63 40 00 00       	call   8010834b <copyuvm>
801042e8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801042eb:	89 42 04             	mov    %eax,0x4(%edx)
801042ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801042f1:	8b 40 04             	mov    0x4(%eax),%eax
801042f4:	85 c0                	test   %eax,%eax
801042f6:	75 2c                	jne    80104324 <fork+0x7a>
    kfree(np->kstack);
801042f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801042fb:	8b 40 08             	mov    0x8(%eax),%eax
801042fe:	89 04 24             	mov    %eax,(%esp)
80104301:	e8 5f e7 ff ff       	call   80102a65 <kfree>
    np->kstack = 0;
80104306:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104309:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    np->state = UNUSED;
80104310:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104313:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    return -1;
8010431a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010431f:	e9 ee 00 00 00       	jmp    80104412 <fork+0x168>
  }
  np->sz = proc->sz;
80104324:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010432a:	8b 10                	mov    (%eax),%edx
8010432c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010432f:	89 10                	mov    %edx,(%eax)
  np->parent = proc;
80104331:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104338:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010433b:	89 50 14             	mov    %edx,0x14(%eax)
  *np->tf = *proc->tf;
8010433e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104341:	8b 50 18             	mov    0x18(%eax),%edx
80104344:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010434a:	8b 40 18             	mov    0x18(%eax),%eax
8010434d:	89 c3                	mov    %eax,%ebx
8010434f:	b8 13 00 00 00       	mov    $0x13,%eax
80104354:	89 d7                	mov    %edx,%edi
80104356:	89 de                	mov    %ebx,%esi
80104358:	89 c1                	mov    %eax,%ecx
8010435a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
8010435c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010435f:	8b 40 18             	mov    0x18(%eax),%eax
80104362:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)

  for(i = 0; i < NOFILE; i++)
80104369:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80104370:	eb 3d                	jmp    801043af <fork+0x105>
    if(proc->ofile[i])
80104372:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104378:	8b 55 dc             	mov    -0x24(%ebp),%edx
8010437b:	83 c2 08             	add    $0x8,%edx
8010437e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104382:	85 c0                	test   %eax,%eax
80104384:	74 25                	je     801043ab <fork+0x101>
      np->ofile[i] = filedup(proc->ofile[i]);
80104386:	8b 5d dc             	mov    -0x24(%ebp),%ebx
80104389:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010438f:	8b 55 dc             	mov    -0x24(%ebp),%edx
80104392:	83 c2 08             	add    $0x8,%edx
80104395:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104399:	89 04 24             	mov    %eax,(%esp)
8010439c:	e8 d8 cb ff ff       	call   80100f79 <filedup>
801043a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801043a4:	8d 4b 08             	lea    0x8(%ebx),%ecx
801043a7:	89 44 8a 08          	mov    %eax,0x8(%edx,%ecx,4)
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801043ab:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
801043af:	83 7d dc 0f          	cmpl   $0xf,-0x24(%ebp)
801043b3:	7e bd                	jle    80104372 <fork+0xc8>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
801043b5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801043bb:	8b 40 68             	mov    0x68(%eax),%eax
801043be:	89 04 24             	mov    %eax,(%esp)
801043c1:	e8 77 d4 ff ff       	call   8010183d <idup>
801043c6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801043c9:	89 42 68             	mov    %eax,0x68(%edx)
 
  pid = np->pid;
801043cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043cf:	8b 40 10             	mov    0x10(%eax),%eax
801043d2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  np->wpidSize = 0;  //added 
801043d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043d8:	c7 80 10 02 00 00 00 	movl   $0x0,0x210(%eax)
801043df:	00 00 00 
  np->state = RUNNABLE;
801043e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043e5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  safestrcpy(np->name, proc->name, sizeof(proc->name));
801043ec:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801043f2:	8d 50 6c             	lea    0x6c(%eax),%edx
801043f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043f8:	83 c0 6c             	add    $0x6c,%eax
801043fb:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80104402:	00 
80104403:	89 54 24 04          	mov    %edx,0x4(%esp)
80104407:	89 04 24             	mov    %eax,(%esp)
8010440a:	e8 56 0f 00 00       	call   80105365 <safestrcpy>
  return pid;
8010440f:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80104412:	83 c4 2c             	add    $0x2c,%esp
80104415:	5b                   	pop    %ebx
80104416:	5e                   	pop    %esi
80104417:	5f                   	pop    %edi
80104418:	5d                   	pop    %ebp
80104419:	c3                   	ret    

8010441a <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
8010441a:	55                   	push   %ebp
8010441b:	89 e5                	mov    %esp,%ebp
8010441d:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  int fd;

  if(proc == initproc)
80104420:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104427:	a1 68 b6 10 80       	mov    0x8010b668,%eax
8010442c:	39 c2                	cmp    %eax,%edx
8010442e:	75 0c                	jne    8010443c <exit+0x22>
    panic("init exiting");
80104430:	c7 04 24 68 88 10 80 	movl   $0x80108868,(%esp)
80104437:	e8 fe c0 ff ff       	call   8010053a <panic>

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
8010443c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80104443:	eb 44                	jmp    80104489 <exit+0x6f>
    if(proc->ofile[fd]){
80104445:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010444b:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010444e:	83 c2 08             	add    $0x8,%edx
80104451:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104455:	85 c0                	test   %eax,%eax
80104457:	74 2c                	je     80104485 <exit+0x6b>
      fileclose(proc->ofile[fd]);
80104459:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010445f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104462:	83 c2 08             	add    $0x8,%edx
80104465:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104469:	89 04 24             	mov    %eax,(%esp)
8010446c:	e8 50 cb ff ff       	call   80100fc1 <fileclose>
      proc->ofile[fd] = 0;
80104471:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104477:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010447a:	83 c2 08             	add    $0x8,%edx
8010447d:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
80104484:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80104485:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80104489:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010448d:	7e b6                	jle    80104445 <exit+0x2b>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  iput(proc->cwd);
8010448f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104495:	8b 40 68             	mov    0x68(%eax),%eax
80104498:	89 04 24             	mov    %eax,(%esp)
8010449b:	e8 85 d5 ff ff       	call   80101a25 <iput>
  proc->cwd = 0;
801044a0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801044a6:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
801044ad:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
801044b4:	e8 2a 0a 00 00       	call   80104ee3 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
801044b9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801044bf:	8b 40 14             	mov    0x14(%eax),%eax
801044c2:	89 04 24             	mov    %eax,(%esp)
801044c5:	e8 da 07 00 00       	call   80104ca4 <wakeup1>

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801044ca:	c7 45 f0 74 ff 10 80 	movl   $0x8010ff74,-0x10(%ebp)
801044d1:	eb 3b                	jmp    8010450e <exit+0xf4>
    if(p->parent == proc){
801044d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044d6:	8b 50 14             	mov    0x14(%eax),%edx
801044d9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801044df:	39 c2                	cmp    %eax,%edx
801044e1:	75 24                	jne    80104507 <exit+0xed>
      p->parent = initproc;
801044e3:	8b 15 68 b6 10 80    	mov    0x8010b668,%edx
801044e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044ec:	89 50 14             	mov    %edx,0x14(%eax)
      if(p->state == ZOMBIE)
801044ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044f2:	8b 40 0c             	mov    0xc(%eax),%eax
801044f5:	83 f8 05             	cmp    $0x5,%eax
801044f8:	75 0d                	jne    80104507 <exit+0xed>
        wakeup1(initproc);
801044fa:	a1 68 b6 10 80       	mov    0x8010b668,%eax
801044ff:	89 04 24             	mov    %eax,(%esp)
80104502:	e8 9d 07 00 00       	call   80104ca4 <wakeup1>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104507:	81 45 f0 14 02 00 00 	addl   $0x214,-0x10(%ebp)
8010450e:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104513:	39 45 f0             	cmp    %eax,-0x10(%ebp)
80104516:	72 bb                	jb     801044d3 <exit+0xb9>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80104518:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010451e:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
  sched();
80104525:	e8 cf 05 00 00       	call   80104af9 <sched>
  panic("zombie exit");
8010452a:	c7 04 24 75 88 10 80 	movl   $0x80108875,(%esp)
80104531:	e8 04 c0 ff ff       	call   8010053a <panic>

80104536 <exit1>:
}

void
exit1(int status)
{
80104536:	55                   	push   %ebp
80104537:	89 e5                	mov    %esp,%ebp
80104539:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  int fd, i;  //added var i

  if(proc == initproc)
8010453c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104543:	a1 68 b6 10 80       	mov    0x8010b668,%eax
80104548:	39 c2                	cmp    %eax,%edx
8010454a:	75 0c                	jne    80104558 <exit1+0x22>
    panic("init exiting");
8010454c:	c7 04 24 68 88 10 80 	movl   $0x80108868,(%esp)
80104553:	e8 e2 bf ff ff       	call   8010053a <panic>

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80104558:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
8010455f:	eb 44                	jmp    801045a5 <exit1+0x6f>
    if(proc->ofile[fd]){
80104561:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104567:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010456a:	83 c2 08             	add    $0x8,%edx
8010456d:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104571:	85 c0                	test   %eax,%eax
80104573:	74 2c                	je     801045a1 <exit1+0x6b>
      fileclose(proc->ofile[fd]);
80104575:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010457b:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010457e:	83 c2 08             	add    $0x8,%edx
80104581:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104585:	89 04 24             	mov    %eax,(%esp)
80104588:	e8 34 ca ff ff       	call   80100fc1 <fileclose>
      proc->ofile[fd] = 0;
8010458d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104593:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104596:	83 c2 08             	add    $0x8,%edx
80104599:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
801045a0:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
801045a1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
801045a5:	83 7d f0 0f          	cmpl   $0xf,-0x10(%ebp)
801045a9:	7e b6                	jle    80104561 <exit1+0x2b>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  proc->exitStatus = status;  //added 
801045ab:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801045b1:	8b 55 08             	mov    0x8(%ebp),%edx
801045b4:	89 50 7c             	mov    %edx,0x7c(%eax)

  iput(proc->cwd);
801045b7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801045bd:	8b 40 68             	mov    0x68(%eax),%eax
801045c0:	89 04 24             	mov    %eax,(%esp)
801045c3:	e8 5d d4 ff ff       	call   80101a25 <iput>
  proc->cwd = 0;
801045c8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801045ce:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
801045d5:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
801045dc:	e8 02 09 00 00       	call   80104ee3 <acquire>

  for(i = 0; i < proc->wpidSize; i++) //added 
801045e1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801045e8:	eb 42                	jmp    8010462c <exit1+0xf6>
  {
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) 
801045ea:	c7 45 ec 74 ff 10 80 	movl   $0x8010ff74,-0x14(%ebp)
801045f1:	eb 2b                	jmp    8010461e <exit1+0xe8>
	{
		if(p->pid == proc->wpid[i]) 
801045f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
801045f6:	8b 50 10             	mov    0x10(%eax),%edx
801045f9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801045ff:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80104602:	83 c1 20             	add    $0x20,%ecx
80104605:	8b 04 88             	mov    (%eax,%ecx,4),%eax
80104608:	39 c2                	cmp    %eax,%edx
8010460a:	75 0b                	jne    80104617 <exit1+0xe1>
		{
			wakeup1(p); 
8010460c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010460f:	89 04 24             	mov    %eax,(%esp)
80104612:	e8 8d 06 00 00       	call   80104ca4 <wakeup1>

  acquire(&ptable.lock);

  for(i = 0; i < proc->wpidSize; i++) //added 
  {
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) 
80104617:	81 45 ec 14 02 00 00 	addl   $0x214,-0x14(%ebp)
8010461e:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104623:	39 45 ec             	cmp    %eax,-0x14(%ebp)
80104626:	72 cb                	jb     801045f3 <exit1+0xbd>
  iput(proc->cwd);
  proc->cwd = 0;

  acquire(&ptable.lock);

  for(i = 0; i < proc->wpidSize; i++) //added 
80104628:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
8010462c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104632:	8b 80 10 02 00 00    	mov    0x210(%eax),%eax
80104638:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010463b:	7f ad                	jg     801045ea <exit1+0xb4>
			wakeup1(p); 
		} 
	} 
  } //added	
  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
8010463d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104643:	8b 40 14             	mov    0x14(%eax),%eax
80104646:	89 04 24             	mov    %eax,(%esp)
80104649:	e8 56 06 00 00       	call   80104ca4 <wakeup1>

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010464e:	c7 45 ec 74 ff 10 80 	movl   $0x8010ff74,-0x14(%ebp)
80104655:	eb 3b                	jmp    80104692 <exit1+0x15c>
    if(p->parent == proc){
80104657:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010465a:	8b 50 14             	mov    0x14(%eax),%edx
8010465d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104663:	39 c2                	cmp    %eax,%edx
80104665:	75 24                	jne    8010468b <exit1+0x155>
      p->parent = initproc;
80104667:	8b 15 68 b6 10 80    	mov    0x8010b668,%edx
8010466d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104670:	89 50 14             	mov    %edx,0x14(%eax)
      if(p->state == ZOMBIE)
80104673:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104676:	8b 40 0c             	mov    0xc(%eax),%eax
80104679:	83 f8 05             	cmp    $0x5,%eax
8010467c:	75 0d                	jne    8010468b <exit1+0x155>
        wakeup1(initproc);
8010467e:	a1 68 b6 10 80       	mov    0x8010b668,%eax
80104683:	89 04 24             	mov    %eax,(%esp)
80104686:	e8 19 06 00 00       	call   80104ca4 <wakeup1>
  } //added	
  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010468b:	81 45 ec 14 02 00 00 	addl   $0x214,-0x14(%ebp)
80104692:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104697:	39 45 ec             	cmp    %eax,-0x14(%ebp)
8010469a:	72 bb                	jb     80104657 <exit1+0x121>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
8010469c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801046a2:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
  sched();
801046a9:	e8 4b 04 00 00       	call   80104af9 <sched>
  panic("zombie exit");
801046ae:	c7 04 24 75 88 10 80 	movl   $0x80108875,(%esp)
801046b5:	e8 80 be ff ff       	call   8010053a <panic>

801046ba <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
801046ba:	55                   	push   %ebp
801046bb:	89 e5                	mov    %esp,%ebp
801046bd:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
801046c0:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
801046c7:	e8 17 08 00 00       	call   80104ee3 <acquire>
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
801046cc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801046d3:	c7 45 ec 74 ff 10 80 	movl   $0x8010ff74,-0x14(%ebp)
801046da:	e9 9d 00 00 00       	jmp    8010477c <wait+0xc2>
      if(p->parent != proc)
801046df:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046e2:	8b 50 14             	mov    0x14(%eax),%edx
801046e5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801046eb:	39 c2                	cmp    %eax,%edx
801046ed:	0f 85 81 00 00 00    	jne    80104774 <wait+0xba>
        continue;
      havekids = 1;
801046f3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
      if(p->state == ZOMBIE){
801046fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046fd:	8b 40 0c             	mov    0xc(%eax),%eax
80104700:	83 f8 05             	cmp    $0x5,%eax
80104703:	75 70                	jne    80104775 <wait+0xbb>
        // Found one.
        pid = p->pid;
80104705:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104708:	8b 40 10             	mov    0x10(%eax),%eax
8010470b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        kfree(p->kstack);
8010470e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104711:	8b 40 08             	mov    0x8(%eax),%eax
80104714:	89 04 24             	mov    %eax,(%esp)
80104717:	e8 49 e3 ff ff       	call   80102a65 <kfree>
        p->kstack = 0;
8010471c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010471f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
        freevm(p->pgdir);
80104726:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104729:	8b 40 04             	mov    0x4(%eax),%eax
8010472c:	89 04 24             	mov    %eax,(%esp)
8010472f:	e8 43 3b 00 00       	call   80108277 <freevm>
        p->state = UNUSED;
80104734:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104737:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
        p->pid = 0;
8010473e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104741:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
        p->parent = 0;
80104748:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010474b:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
        p->name[0] = 0;
80104752:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104755:	c6 40 6c 00          	movb   $0x0,0x6c(%eax)
        p->killed = 0;
80104759:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010475c:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
        release(&ptable.lock);
80104763:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
8010476a:	e8 d5 07 00 00       	call   80104f44 <release>
        return pid;
8010476f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104772:	eb 57                	jmp    801047cb <wait+0x111>
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != proc)
        continue;
80104774:	90                   	nop

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104775:	81 45 ec 14 02 00 00 	addl   $0x214,-0x14(%ebp)
8010477c:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104781:	39 45 ec             	cmp    %eax,-0x14(%ebp)
80104784:	0f 82 55 ff ff ff    	jb     801046df <wait+0x25>
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
8010478a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010478e:	74 0d                	je     8010479d <wait+0xe3>
80104790:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104796:	8b 40 24             	mov    0x24(%eax),%eax
80104799:	85 c0                	test   %eax,%eax
8010479b:	74 13                	je     801047b0 <wait+0xf6>
      release(&ptable.lock);
8010479d:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
801047a4:	e8 9b 07 00 00       	call   80104f44 <release>
      return -1;
801047a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047ae:	eb 1b                	jmp    801047cb <wait+0x111>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
801047b0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801047b6:	c7 44 24 04 40 ff 10 	movl   $0x8010ff40,0x4(%esp)
801047bd:	80 
801047be:	89 04 24             	mov    %eax,(%esp)
801047c1:	e8 43 04 00 00       	call   80104c09 <sleep>
  }
801047c6:	e9 01 ff ff ff       	jmp    801046cc <wait+0x12>
} 
801047cb:	c9                   	leave  
801047cc:	c3                   	ret    

801047cd <wait1>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait1(int *status)
{
801047cd:	55                   	push   %ebp
801047ce:	89 e5                	mov    %esp,%ebp
801047d0:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  int havekids, pid;  

  acquire(&ptable.lock);
801047d3:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
801047da:	e8 04 07 00 00       	call   80104ee3 <acquire>
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
801047df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801047e6:	c7 45 ec 74 ff 10 80 	movl   $0x8010ff74,-0x14(%ebp)
801047ed:	e9 9d 00 00 00       	jmp    8010488f <wait1+0xc2>
      if(p->parent != proc)
801047f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
801047f5:	8b 50 14             	mov    0x14(%eax),%edx
801047f8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801047fe:	39 c2                	cmp    %eax,%edx
80104800:	0f 85 81 00 00 00    	jne    80104887 <wait1+0xba>
        continue;
      havekids = 1;
80104806:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
      if(p->state == ZOMBIE){
8010480d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104810:	8b 40 0c             	mov    0xc(%eax),%eax
80104813:	83 f8 05             	cmp    $0x5,%eax
80104816:	75 70                	jne    80104888 <wait1+0xbb>
        // Found one.
        pid = p->pid;
80104818:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010481b:	8b 40 10             	mov    0x10(%eax),%eax
8010481e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        kfree(p->kstack);
80104821:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104824:	8b 40 08             	mov    0x8(%eax),%eax
80104827:	89 04 24             	mov    %eax,(%esp)
8010482a:	e8 36 e2 ff ff       	call   80102a65 <kfree>
        p->kstack = 0;
8010482f:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104832:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
        freevm(p->pgdir);
80104839:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010483c:	8b 40 04             	mov    0x4(%eax),%eax
8010483f:	89 04 24             	mov    %eax,(%esp)
80104842:	e8 30 3a 00 00       	call   80108277 <freevm>
        p->state = UNUSED;
80104847:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010484a:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
        p->pid = 0;
80104851:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104854:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
        p->parent = 0;
8010485b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010485e:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
        p->name[0] = 0;
80104865:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104868:	c6 40 6c 00          	movb   $0x0,0x6c(%eax)
        p->killed = 0;
8010486c:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010486f:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
	//if(status != 0 )
	//{
		//*status = p->exitStatus; 
	//} //added
        release(&ptable.lock); 
80104876:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
8010487d:	e8 c2 06 00 00       	call   80104f44 <release>
        return pid;
80104882:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104885:	eb 57                	jmp    801048de <wait1+0x111>
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != proc)
        continue;
80104887:	90                   	nop

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104888:	81 45 ec 14 02 00 00 	addl   $0x214,-0x14(%ebp)
8010488f:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104894:	39 45 ec             	cmp    %eax,-0x14(%ebp)
80104897:	0f 82 55 ff ff ff    	jb     801047f2 <wait1+0x25>
      }
    }

    // No point waiting if we don't have any children.
 
    	if(!havekids || proc->killed){
8010489d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801048a1:	74 0d                	je     801048b0 <wait1+0xe3>
801048a3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801048a9:	8b 40 24             	mov    0x24(%eax),%eax
801048ac:	85 c0                	test   %eax,%eax
801048ae:	74 13                	je     801048c3 <wait1+0xf6>
   	   	release(&ptable.lock);
801048b0:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
801048b7:	e8 88 06 00 00       	call   80104f44 <release>
      		return -1;
801048bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801048c1:	eb 1b                	jmp    801048de <wait1+0x111>
    	}
    // Wait for children to exit.  (See wakeup1 call in proc_exit.) 
	sleep(proc, &ptable.lock);  //DOC: wait-sleep
801048c3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801048c9:	c7 44 24 04 40 ff 10 	movl   $0x8010ff40,0x4(%esp)
801048d0:	80 
801048d1:	89 04 24             	mov    %eax,(%esp)
801048d4:	e8 30 03 00 00       	call   80104c09 <sleep>
  }
801048d9:	e9 01 ff ff ff       	jmp    801047df <wait1+0x12>
} //added (copied wait function with minor changes) 
801048de:	c9                   	leave  
801048df:	c3                   	ret    

801048e0 <waitpid>:



int
waitpid(int pid, int *status, int options)
{
801048e0:	55                   	push   %ebp
801048e1:	89 e5                	mov    %esp,%ebp
801048e3:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  int havePid;   //added (changed havekids to havePid, and deleted pid) 

  acquire(&ptable.lock);
801048e6:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
801048ed:	e8 f1 05 00 00       	call   80104ee3 <acquire>
  for(;;){
    // Scan through table looking for zombie children.
    havePid = 0;
801048f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801048f9:	c7 45 f0 74 ff 10 80 	movl   $0x8010ff74,-0x10(%ebp)
80104900:	e9 fc 00 00 00       	jmp    80104a01 <waitpid+0x121>
      if(p->pid == 0)
80104905:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104908:	8b 40 10             	mov    0x10(%eax),%eax
8010490b:	85 c0                	test   %eax,%eax
8010490d:	75 16                	jne    80104925 <waitpid+0x45>
      {	
		release(&ptable.lock); 
8010490f:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104916:	e8 29 06 00 00       	call   80104f44 <release>
		return -1; 
8010491b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104920:	e9 35 01 00 00       	jmp    80104a5a <waitpid+0x17a>
      } //added 
      if(p->pid == pid)
80104925:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104928:	8b 40 10             	mov    0x10(%eax),%eax
8010492b:	3b 45 08             	cmp    0x8(%ebp),%eax
8010492e:	0f 85 c6 00 00 00    	jne    801049fa <waitpid+0x11a>
      {	
      	havePid = 1;
80104934:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
	
	p->wpid[p->wpidSize] = proc->pid;  //added
8010493b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010493e:	8b 88 10 02 00 00    	mov    0x210(%eax),%ecx
80104944:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010494a:	8b 50 10             	mov    0x10(%eax),%edx
8010494d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104950:	83 c1 20             	add    $0x20,%ecx
80104953:	89 14 88             	mov    %edx,(%eax,%ecx,4)
	p->wpidSize++; 			//added
80104956:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104959:	8b 80 10 02 00 00    	mov    0x210(%eax),%eax
8010495f:	8d 50 01             	lea    0x1(%eax),%edx
80104962:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104965:	89 90 10 02 00 00    	mov    %edx,0x210(%eax)

        if(p->state == ZOMBIE){
8010496b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010496e:	8b 40 0c             	mov    0xc(%eax),%eax
80104971:	83 f8 05             	cmp    $0x5,%eax
80104974:	0f 85 80 00 00 00    	jne    801049fa <waitpid+0x11a>
        	// Found one.
        	pid = p->pid;
8010497a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010497d:	8b 40 10             	mov    0x10(%eax),%eax
80104980:	89 45 08             	mov    %eax,0x8(%ebp)
        	kfree(p->kstack);
80104983:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104986:	8b 40 08             	mov    0x8(%eax),%eax
80104989:	89 04 24             	mov    %eax,(%esp)
8010498c:	e8 d4 e0 ff ff       	call   80102a65 <kfree>
        	p->kstack = 0;
80104991:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104994:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
        	freevm(p->pgdir);
8010499b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010499e:	8b 40 04             	mov    0x4(%eax),%eax
801049a1:	89 04 24             	mov    %eax,(%esp)
801049a4:	e8 ce 38 00 00       	call   80108277 <freevm>
        	p->state = UNUSED;
801049a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
801049ac:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
        	p->pid = 0;
801049b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
801049b6:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
        	p->parent = 0;
801049bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
801049c0:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
        	p->name[0] = 0;
801049c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
801049ca:	c6 40 6c 00          	movb   $0x0,0x6c(%eax)
        	p->killed = 0;
801049ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
801049d1:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
		if(status != 0)
801049d8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
801049dc:	74 0b                	je     801049e9 <waitpid+0x109>
		{
			*status = p->exitStatus;
801049de:	8b 45 f0             	mov    -0x10(%ebp),%eax
801049e1:	8b 50 7c             	mov    0x7c(%eax),%edx
801049e4:	8b 45 0c             	mov    0xc(%ebp),%eax
801049e7:	89 10                	mov    %edx,(%eax)
		} //added 
        	release(&ptable.lock); 
801049e9:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
801049f0:	e8 4f 05 00 00       	call   80104f44 <release>
        	return pid;
801049f5:	8b 45 08             	mov    0x8(%ebp),%eax
801049f8:	eb 60                	jmp    80104a5a <waitpid+0x17a>

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for zombie children.
    havePid = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801049fa:	81 45 f0 14 02 00 00 	addl   $0x214,-0x10(%ebp)
80104a01:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104a06:	39 45 f0             	cmp    %eax,-0x10(%ebp)
80104a09:	0f 82 f6 fe ff ff    	jb     80104905 <waitpid+0x25>
        	return pid;
      	}
      } //added (please examine inside loop).
     }
    // No point waiting if we don't have any children.
    if(proc != 0) 
80104a0f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104a15:	85 c0                	test   %eax,%eax
80104a17:	74 26                	je     80104a3f <waitpid+0x15f>
    {
    	if(!havePid || proc->killed){
80104a19:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80104a1d:	74 0d                	je     80104a2c <waitpid+0x14c>
80104a1f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104a25:	8b 40 24             	mov    0x24(%eax),%eax
80104a28:	85 c0                	test   %eax,%eax
80104a2a:	74 13                	je     80104a3f <waitpid+0x15f>
      	release(&ptable.lock);
80104a2c:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104a33:	e8 0c 05 00 00       	call   80104f44 <release>
      	return -1;
80104a38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a3d:	eb 1b                	jmp    80104a5a <waitpid+0x17a>
    	}
    } //added 	

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80104a3f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104a45:	c7 44 24 04 40 ff 10 	movl   $0x8010ff40,0x4(%esp)
80104a4c:	80 
80104a4d:	89 04 24             	mov    %eax,(%esp)
80104a50:	e8 b4 01 00 00       	call   80104c09 <sleep>
 
  }
80104a55:	e9 98 fe ff ff       	jmp    801048f2 <waitpid+0x12>
} //added (copied from wait1 with changes) 
80104a5a:	c9                   	leave  
80104a5b:	c3                   	ret    

80104a5c <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80104a5c:	55                   	push   %ebp
80104a5d:	89 e5                	mov    %esp,%ebp
80104a5f:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;

  for(;;){
    // Enable interrupts on this processor.
    sti();
80104a62:	e8 59 f5 ff ff       	call   80103fc0 <sti>

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80104a67:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104a6e:	e8 70 04 00 00       	call   80104ee3 <acquire>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104a73:	c7 45 f4 74 ff 10 80 	movl   $0x8010ff74,-0xc(%ebp)
80104a7a:	eb 62                	jmp    80104ade <scheduler+0x82>
      if(p->state != RUNNABLE)
80104a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a7f:	8b 40 0c             	mov    0xc(%eax),%eax
80104a82:	83 f8 03             	cmp    $0x3,%eax
80104a85:	75 4f                	jne    80104ad6 <scheduler+0x7a>
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
80104a87:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a8a:	65 a3 04 00 00 00    	mov    %eax,%gs:0x4
      switchuvm(p);
80104a90:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a93:	89 04 24             	mov    %eax,(%esp)
80104a96:	e8 64 33 00 00       	call   80107dff <switchuvm>
      p->state = RUNNING;
80104a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a9e:	c7 40 0c 04 00 00 00 	movl   $0x4,0xc(%eax)
      swtch(&cpu->scheduler, proc->context);
80104aa5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104aab:	8b 40 1c             	mov    0x1c(%eax),%eax
80104aae:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104ab5:	83 c2 04             	add    $0x4,%edx
80104ab8:	89 44 24 04          	mov    %eax,0x4(%esp)
80104abc:	89 14 24             	mov    %edx,(%esp)
80104abf:	e8 14 09 00 00       	call   801053d8 <swtch>
      switchkvm();
80104ac4:	e8 19 33 00 00       	call   80107de2 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80104ac9:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80104ad0:	00 00 00 00 
80104ad4:	eb 01                	jmp    80104ad7 <scheduler+0x7b>

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE)
        continue;
80104ad6:	90                   	nop
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104ad7:	81 45 f4 14 02 00 00 	addl   $0x214,-0xc(%ebp)
80104ade:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104ae3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80104ae6:	72 94                	jb     80104a7c <scheduler+0x20>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
    }
    release(&ptable.lock);
80104ae8:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104aef:	e8 50 04 00 00       	call   80104f44 <release>

  }
80104af4:	e9 69 ff ff ff       	jmp    80104a62 <scheduler+0x6>

80104af9 <sched>:

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state.
void
sched(void)
{
80104af9:	55                   	push   %ebp
80104afa:	89 e5                	mov    %esp,%ebp
80104afc:	83 ec 28             	sub    $0x28,%esp
  int intena;

  if(!holding(&ptable.lock))
80104aff:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104b06:	e8 f7 04 00 00       	call   80105002 <holding>
80104b0b:	85 c0                	test   %eax,%eax
80104b0d:	75 0c                	jne    80104b1b <sched+0x22>
    panic("sched ptable.lock");
80104b0f:	c7 04 24 81 88 10 80 	movl   $0x80108881,(%esp)
80104b16:	e8 1f ba ff ff       	call   8010053a <panic>
  if(cpu->ncli != 1)
80104b1b:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104b21:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
80104b27:	83 f8 01             	cmp    $0x1,%eax
80104b2a:	74 0c                	je     80104b38 <sched+0x3f>
    panic("sched locks");
80104b2c:	c7 04 24 93 88 10 80 	movl   $0x80108893,(%esp)
80104b33:	e8 02 ba ff ff       	call   8010053a <panic>
  if(proc->state == RUNNING)
80104b38:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b3e:	8b 40 0c             	mov    0xc(%eax),%eax
80104b41:	83 f8 04             	cmp    $0x4,%eax
80104b44:	75 0c                	jne    80104b52 <sched+0x59>
    panic("sched running");
80104b46:	c7 04 24 9f 88 10 80 	movl   $0x8010889f,(%esp)
80104b4d:	e8 e8 b9 ff ff       	call   8010053a <panic>
  if(readeflags()&FL_IF)
80104b52:	e8 59 f4 ff ff       	call   80103fb0 <readeflags>
80104b57:	25 00 02 00 00       	and    $0x200,%eax
80104b5c:	85 c0                	test   %eax,%eax
80104b5e:	74 0c                	je     80104b6c <sched+0x73>
    panic("sched interruptible");
80104b60:	c7 04 24 ad 88 10 80 	movl   $0x801088ad,(%esp)
80104b67:	e8 ce b9 ff ff       	call   8010053a <panic>
  intena = cpu->intena;
80104b6c:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104b72:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
80104b78:	89 45 f4             	mov    %eax,-0xc(%ebp)
  swtch(&proc->context, cpu->scheduler);
80104b7b:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104b81:	8b 40 04             	mov    0x4(%eax),%eax
80104b84:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104b8b:	83 c2 1c             	add    $0x1c,%edx
80104b8e:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b92:	89 14 24             	mov    %edx,(%esp)
80104b95:	e8 3e 08 00 00       	call   801053d8 <swtch>
  cpu->intena = intena;
80104b9a:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104ba0:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104ba3:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
}
80104ba9:	c9                   	leave  
80104baa:	c3                   	ret    

80104bab <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
80104bab:	55                   	push   %ebp
80104bac:	89 e5                	mov    %esp,%ebp
80104bae:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80104bb1:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104bb8:	e8 26 03 00 00       	call   80104ee3 <acquire>
  proc->state = RUNNABLE;
80104bbd:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104bc3:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80104bca:	e8 2a ff ff ff       	call   80104af9 <sched>
  release(&ptable.lock);
80104bcf:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104bd6:	e8 69 03 00 00       	call   80104f44 <release>
}
80104bdb:	c9                   	leave  
80104bdc:	c3                   	ret    

80104bdd <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80104bdd:	55                   	push   %ebp
80104bde:	89 e5                	mov    %esp,%ebp
80104be0:	83 ec 18             	sub    $0x18,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80104be3:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104bea:	e8 55 03 00 00       	call   80104f44 <release>

  if (first) {
80104bef:	a1 20 b0 10 80       	mov    0x8010b020,%eax
80104bf4:	85 c0                	test   %eax,%eax
80104bf6:	74 0f                	je     80104c07 <forkret+0x2a>
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot 
    // be run from main().
    first = 0;
80104bf8:	c7 05 20 b0 10 80 00 	movl   $0x0,0x8010b020
80104bff:	00 00 00 
    initlog();
80104c02:	e8 f1 e3 ff ff       	call   80102ff8 <initlog>
  }
  
  // Return to "caller", actually trapret (see allocproc).
}
80104c07:	c9                   	leave  
80104c08:	c3                   	ret    

80104c09 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80104c09:	55                   	push   %ebp
80104c0a:	89 e5                	mov    %esp,%ebp
80104c0c:	83 ec 18             	sub    $0x18,%esp
  if(proc == 0)
80104c0f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104c15:	85 c0                	test   %eax,%eax
80104c17:	75 0c                	jne    80104c25 <sleep+0x1c>
    panic("sleep");
80104c19:	c7 04 24 c1 88 10 80 	movl   $0x801088c1,(%esp)
80104c20:	e8 15 b9 ff ff       	call   8010053a <panic>

  if(lk == 0)
80104c25:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80104c29:	75 0c                	jne    80104c37 <sleep+0x2e>
    panic("sleep without lk");
80104c2b:	c7 04 24 c7 88 10 80 	movl   $0x801088c7,(%esp)
80104c32:	e8 03 b9 ff ff       	call   8010053a <panic>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80104c37:	81 7d 0c 40 ff 10 80 	cmpl   $0x8010ff40,0xc(%ebp)
80104c3e:	74 17                	je     80104c57 <sleep+0x4e>
    acquire(&ptable.lock);  //DOC: sleeplock1
80104c40:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104c47:	e8 97 02 00 00       	call   80104ee3 <acquire>
    release(lk);
80104c4c:	8b 45 0c             	mov    0xc(%ebp),%eax
80104c4f:	89 04 24             	mov    %eax,(%esp)
80104c52:	e8 ed 02 00 00       	call   80104f44 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80104c57:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104c5d:	8b 55 08             	mov    0x8(%ebp),%edx
80104c60:	89 50 20             	mov    %edx,0x20(%eax)
  proc->state = SLEEPING;
80104c63:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104c69:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80104c70:	e8 84 fe ff ff       	call   80104af9 <sched>

  // Tidy up.
  proc->chan = 0;
80104c75:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104c7b:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
80104c82:	81 7d 0c 40 ff 10 80 	cmpl   $0x8010ff40,0xc(%ebp)
80104c89:	74 17                	je     80104ca2 <sleep+0x99>
    release(&ptable.lock);
80104c8b:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104c92:	e8 ad 02 00 00       	call   80104f44 <release>
    acquire(lk);
80104c97:	8b 45 0c             	mov    0xc(%ebp),%eax
80104c9a:	89 04 24             	mov    %eax,(%esp)
80104c9d:	e8 41 02 00 00       	call   80104ee3 <acquire>
  }
}
80104ca2:	c9                   	leave  
80104ca3:	c3                   	ret    

80104ca4 <wakeup1>:
//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
80104ca4:	55                   	push   %ebp
80104ca5:	89 e5                	mov    %esp,%ebp
80104ca7:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104caa:	c7 45 fc 74 ff 10 80 	movl   $0x8010ff74,-0x4(%ebp)
80104cb1:	eb 27                	jmp    80104cda <wakeup1+0x36>
    if(p->state == SLEEPING && p->chan == chan)
80104cb3:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104cb6:	8b 40 0c             	mov    0xc(%eax),%eax
80104cb9:	83 f8 02             	cmp    $0x2,%eax
80104cbc:	75 15                	jne    80104cd3 <wakeup1+0x2f>
80104cbe:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104cc1:	8b 40 20             	mov    0x20(%eax),%eax
80104cc4:	3b 45 08             	cmp    0x8(%ebp),%eax
80104cc7:	75 0a                	jne    80104cd3 <wakeup1+0x2f>
      p->state = RUNNABLE;
80104cc9:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104ccc:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104cd3:	81 45 fc 14 02 00 00 	addl   $0x214,-0x4(%ebp)
80104cda:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104cdf:	39 45 fc             	cmp    %eax,-0x4(%ebp)
80104ce2:	72 cf                	jb     80104cb3 <wakeup1+0xf>
    if(p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}
80104ce4:	c9                   	leave  
80104ce5:	c3                   	ret    

80104ce6 <wakeup>:

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104ce6:	55                   	push   %ebp
80104ce7:	89 e5                	mov    %esp,%ebp
80104ce9:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);
80104cec:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104cf3:	e8 eb 01 00 00       	call   80104ee3 <acquire>
  wakeup1(chan);
80104cf8:	8b 45 08             	mov    0x8(%ebp),%eax
80104cfb:	89 04 24             	mov    %eax,(%esp)
80104cfe:	e8 a1 ff ff ff       	call   80104ca4 <wakeup1>
  release(&ptable.lock);
80104d03:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104d0a:	e8 35 02 00 00       	call   80104f44 <release>
}
80104d0f:	c9                   	leave  
80104d10:	c3                   	ret    

80104d11 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104d11:	55                   	push   %ebp
80104d12:	89 e5                	mov    %esp,%ebp
80104d14:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;

  acquire(&ptable.lock);
80104d17:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104d1e:	e8 c0 01 00 00       	call   80104ee3 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104d23:	c7 45 f4 74 ff 10 80 	movl   $0x8010ff74,-0xc(%ebp)
80104d2a:	eb 44                	jmp    80104d70 <kill+0x5f>
    if(p->pid == pid){
80104d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104d2f:	8b 40 10             	mov    0x10(%eax),%eax
80104d32:	3b 45 08             	cmp    0x8(%ebp),%eax
80104d35:	75 32                	jne    80104d69 <kill+0x58>
      p->killed = 1;
80104d37:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104d3a:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104d41:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104d44:	8b 40 0c             	mov    0xc(%eax),%eax
80104d47:	83 f8 02             	cmp    $0x2,%eax
80104d4a:	75 0a                	jne    80104d56 <kill+0x45>
        p->state = RUNNABLE;
80104d4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104d4f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80104d56:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104d5d:	e8 e2 01 00 00       	call   80104f44 <release>
      return 0;
80104d62:	b8 00 00 00 00       	mov    $0x0,%eax
80104d67:	eb 22                	jmp    80104d8b <kill+0x7a>
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104d69:	81 45 f4 14 02 00 00 	addl   $0x214,-0xc(%ebp)
80104d70:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104d75:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80104d78:	72 b2                	jb     80104d2c <kill+0x1b>
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80104d7a:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104d81:	e8 be 01 00 00       	call   80104f44 <release>
  return -1;
80104d86:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104d8b:	c9                   	leave  
80104d8c:	c3                   	ret    

80104d8d <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104d8d:	55                   	push   %ebp
80104d8e:	89 e5                	mov    %esp,%ebp
80104d90:	83 ec 58             	sub    $0x58,%esp
  int i;
  struct proc *p;
  char *state;
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104d93:	c7 45 f0 74 ff 10 80 	movl   $0x8010ff74,-0x10(%ebp)
80104d9a:	e9 db 00 00 00       	jmp    80104e7a <procdump+0xed>
    if(p->state == UNUSED)
80104d9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104da2:	8b 40 0c             	mov    0xc(%eax),%eax
80104da5:	85 c0                	test   %eax,%eax
80104da7:	0f 84 c5 00 00 00    	je     80104e72 <procdump+0xe5>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104dad:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104db0:	8b 40 0c             	mov    0xc(%eax),%eax
80104db3:	83 f8 05             	cmp    $0x5,%eax
80104db6:	77 23                	ja     80104ddb <procdump+0x4e>
80104db8:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104dbb:	8b 40 0c             	mov    0xc(%eax),%eax
80104dbe:	8b 04 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%eax
80104dc5:	85 c0                	test   %eax,%eax
80104dc7:	74 12                	je     80104ddb <procdump+0x4e>
      state = states[p->state];
80104dc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104dcc:	8b 40 0c             	mov    0xc(%eax),%eax
80104dcf:	8b 04 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%eax
80104dd6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104dd9:	eb 07                	jmp    80104de2 <procdump+0x55>
      state = states[p->state];
    else
      state = "???";
80104ddb:	c7 45 f4 d8 88 10 80 	movl   $0x801088d8,-0xc(%ebp)
    cprintf("%d %s %s", p->pid, state, p->name);
80104de2:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104de5:	8d 50 6c             	lea    0x6c(%eax),%edx
80104de8:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104deb:	8b 40 10             	mov    0x10(%eax),%eax
80104dee:	89 54 24 0c          	mov    %edx,0xc(%esp)
80104df2:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104df5:	89 54 24 08          	mov    %edx,0x8(%esp)
80104df9:	89 44 24 04          	mov    %eax,0x4(%esp)
80104dfd:	c7 04 24 dc 88 10 80 	movl   $0x801088dc,(%esp)
80104e04:	e8 91 b5 ff ff       	call   8010039a <cprintf>
    if(p->state == SLEEPING){
80104e09:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104e0c:	8b 40 0c             	mov    0xc(%eax),%eax
80104e0f:	83 f8 02             	cmp    $0x2,%eax
80104e12:	75 50                	jne    80104e64 <procdump+0xd7>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104e14:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104e17:	8b 40 1c             	mov    0x1c(%eax),%eax
80104e1a:	8b 40 0c             	mov    0xc(%eax),%eax
80104e1d:	83 c0 08             	add    $0x8,%eax
80104e20:	8d 55 c4             	lea    -0x3c(%ebp),%edx
80104e23:	89 54 24 04          	mov    %edx,0x4(%esp)
80104e27:	89 04 24             	mov    %eax,(%esp)
80104e2a:	e8 64 01 00 00       	call   80104f93 <getcallerpcs>
      for(i=0; i<10 && pc[i] != 0; i++)
80104e2f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80104e36:	eb 1b                	jmp    80104e53 <procdump+0xc6>
        cprintf(" %p", pc[i]);
80104e38:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104e3b:	8b 44 85 c4          	mov    -0x3c(%ebp,%eax,4),%eax
80104e3f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104e43:	c7 04 24 e5 88 10 80 	movl   $0x801088e5,(%esp)
80104e4a:	e8 4b b5 ff ff       	call   8010039a <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104e4f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
80104e53:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
80104e57:	7f 0b                	jg     80104e64 <procdump+0xd7>
80104e59:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104e5c:	8b 44 85 c4          	mov    -0x3c(%ebp,%eax,4),%eax
80104e60:	85 c0                	test   %eax,%eax
80104e62:	75 d4                	jne    80104e38 <procdump+0xab>
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104e64:	c7 04 24 e9 88 10 80 	movl   $0x801088e9,(%esp)
80104e6b:	e8 2a b5 ff ff       	call   8010039a <cprintf>
80104e70:	eb 01                	jmp    80104e73 <procdump+0xe6>
  char *state;
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
80104e72:	90                   	nop
  int i;
  struct proc *p;
  char *state;
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104e73:	81 45 f0 14 02 00 00 	addl   $0x214,-0x10(%ebp)
80104e7a:	b8 74 84 11 80       	mov    $0x80118474,%eax
80104e7f:	39 45 f0             	cmp    %eax,-0x10(%ebp)
80104e82:	0f 82 17 ff ff ff    	jb     80104d9f <procdump+0x12>
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104e88:	c9                   	leave  
80104e89:	c3                   	ret    
	...

80104e8c <readeflags>:
  asm volatile("ltr %0" : : "r" (sel));
}

static inline uint
readeflags(void)
{
80104e8c:	55                   	push   %ebp
80104e8d:	89 e5                	mov    %esp,%ebp
80104e8f:	83 ec 10             	sub    $0x10,%esp
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104e92:	9c                   	pushf  
80104e93:	58                   	pop    %eax
80104e94:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return eflags;
80104e97:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80104e9a:	c9                   	leave  
80104e9b:	c3                   	ret    

80104e9c <cli>:
  asm volatile("movw %0, %%gs" : : "r" (v));
}

static inline void
cli(void)
{
80104e9c:	55                   	push   %ebp
80104e9d:	89 e5                	mov    %esp,%ebp
  asm volatile("cli");
80104e9f:	fa                   	cli    
}
80104ea0:	5d                   	pop    %ebp
80104ea1:	c3                   	ret    

80104ea2 <sti>:

static inline void
sti(void)
{
80104ea2:	55                   	push   %ebp
80104ea3:	89 e5                	mov    %esp,%ebp
  asm volatile("sti");
80104ea5:	fb                   	sti    
}
80104ea6:	5d                   	pop    %ebp
80104ea7:	c3                   	ret    

80104ea8 <xchg>:

static inline uint
xchg(volatile uint *addr, uint newval)
{
80104ea8:	55                   	push   %ebp
80104ea9:	89 e5                	mov    %esp,%ebp
80104eab:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80104eae:	8b 55 08             	mov    0x8(%ebp),%edx
80104eb1:	8b 45 0c             	mov    0xc(%ebp),%eax
80104eb4:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104eb7:	f0 87 02             	lock xchg %eax,(%edx)
80104eba:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
80104ebd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80104ec0:	c9                   	leave  
80104ec1:	c3                   	ret    

80104ec2 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104ec2:	55                   	push   %ebp
80104ec3:	89 e5                	mov    %esp,%ebp
  lk->name = name;
80104ec5:	8b 45 08             	mov    0x8(%ebp),%eax
80104ec8:	8b 55 0c             	mov    0xc(%ebp),%edx
80104ecb:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
80104ece:	8b 45 08             	mov    0x8(%ebp),%eax
80104ed1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->cpu = 0;
80104ed7:	8b 45 08             	mov    0x8(%ebp),%eax
80104eda:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104ee1:	5d                   	pop    %ebp
80104ee2:	c3                   	ret    

80104ee3 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104ee3:	55                   	push   %ebp
80104ee4:	89 e5                	mov    %esp,%ebp
80104ee6:	83 ec 18             	sub    $0x18,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104ee9:	e8 3e 01 00 00       	call   8010502c <pushcli>
  if(holding(lk))
80104eee:	8b 45 08             	mov    0x8(%ebp),%eax
80104ef1:	89 04 24             	mov    %eax,(%esp)
80104ef4:	e8 09 01 00 00       	call   80105002 <holding>
80104ef9:	85 c0                	test   %eax,%eax
80104efb:	74 0c                	je     80104f09 <acquire+0x26>
    panic("acquire");
80104efd:	c7 04 24 15 89 10 80 	movl   $0x80108915,(%esp)
80104f04:	e8 31 b6 ff ff       	call   8010053a <panic>

  // The xchg is atomic.
  // It also serializes, so that reads after acquire are not
  // reordered before it. 
  while(xchg(&lk->locked, 1) != 0)
80104f09:	8b 45 08             	mov    0x8(%ebp),%eax
80104f0c:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80104f13:	00 
80104f14:	89 04 24             	mov    %eax,(%esp)
80104f17:	e8 8c ff ff ff       	call   80104ea8 <xchg>
80104f1c:	85 c0                	test   %eax,%eax
80104f1e:	75 e9                	jne    80104f09 <acquire+0x26>
    ;

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104f20:	8b 45 08             	mov    0x8(%ebp),%eax
80104f23:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104f2a:	89 50 08             	mov    %edx,0x8(%eax)
  getcallerpcs(&lk, lk->pcs);
80104f2d:	8b 45 08             	mov    0x8(%ebp),%eax
80104f30:	83 c0 0c             	add    $0xc,%eax
80104f33:	89 44 24 04          	mov    %eax,0x4(%esp)
80104f37:	8d 45 08             	lea    0x8(%ebp),%eax
80104f3a:	89 04 24             	mov    %eax,(%esp)
80104f3d:	e8 51 00 00 00       	call   80104f93 <getcallerpcs>
}
80104f42:	c9                   	leave  
80104f43:	c3                   	ret    

80104f44 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
80104f44:	55                   	push   %ebp
80104f45:	89 e5                	mov    %esp,%ebp
80104f47:	83 ec 18             	sub    $0x18,%esp
  if(!holding(lk))
80104f4a:	8b 45 08             	mov    0x8(%ebp),%eax
80104f4d:	89 04 24             	mov    %eax,(%esp)
80104f50:	e8 ad 00 00 00       	call   80105002 <holding>
80104f55:	85 c0                	test   %eax,%eax
80104f57:	75 0c                	jne    80104f65 <release+0x21>
    panic("release");
80104f59:	c7 04 24 1d 89 10 80 	movl   $0x8010891d,(%esp)
80104f60:	e8 d5 b5 ff ff       	call   8010053a <panic>

  lk->pcs[0] = 0;
80104f65:	8b 45 08             	mov    0x8(%ebp),%eax
80104f68:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
80104f6f:	8b 45 08             	mov    0x8(%ebp),%eax
80104f72:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // But the 2007 Intel 64 Architecture Memory Ordering White
  // Paper says that Intel 64 and IA-32 will not move a load
  // after a store. So lock->locked = 0 would work here.
  // The xchg being asm volatile ensures gcc emits it after
  // the above assignments (and after the critical section).
  xchg(&lk->locked, 0);
80104f79:	8b 45 08             	mov    0x8(%ebp),%eax
80104f7c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104f83:	00 
80104f84:	89 04 24             	mov    %eax,(%esp)
80104f87:	e8 1c ff ff ff       	call   80104ea8 <xchg>

  popcli();
80104f8c:	e8 e3 00 00 00       	call   80105074 <popcli>
}
80104f91:	c9                   	leave  
80104f92:	c3                   	ret    

80104f93 <getcallerpcs>:

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104f93:	55                   	push   %ebp
80104f94:	89 e5                	mov    %esp,%ebp
80104f96:	83 ec 10             	sub    $0x10,%esp
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
80104f99:	8b 45 08             	mov    0x8(%ebp),%eax
80104f9c:	83 e8 08             	sub    $0x8,%eax
80104f9f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(i = 0; i < 10; i++){
80104fa2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
80104fa9:	eb 34                	jmp    80104fdf <getcallerpcs+0x4c>
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104fab:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
80104faf:	74 49                	je     80104ffa <getcallerpcs+0x67>
80104fb1:	81 7d f8 ff ff ff 7f 	cmpl   $0x7fffffff,-0x8(%ebp)
80104fb8:	76 40                	jbe    80104ffa <getcallerpcs+0x67>
80104fba:	83 7d f8 ff          	cmpl   $0xffffffff,-0x8(%ebp)
80104fbe:	74 3a                	je     80104ffa <getcallerpcs+0x67>
      break;
    pcs[i] = ebp[1];     // saved %eip
80104fc0:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104fc3:	c1 e0 02             	shl    $0x2,%eax
80104fc6:	03 45 0c             	add    0xc(%ebp),%eax
80104fc9:	8b 55 f8             	mov    -0x8(%ebp),%edx
80104fcc:	83 c2 04             	add    $0x4,%edx
80104fcf:	8b 12                	mov    (%edx),%edx
80104fd1:	89 10                	mov    %edx,(%eax)
    ebp = (uint*)ebp[0]; // saved %ebp
80104fd3:	8b 45 f8             	mov    -0x8(%ebp),%eax
80104fd6:	8b 00                	mov    (%eax),%eax
80104fd8:	89 45 f8             	mov    %eax,-0x8(%ebp)
{
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104fdb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80104fdf:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
80104fe3:	7e c6                	jle    80104fab <getcallerpcs+0x18>
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104fe5:	eb 13                	jmp    80104ffa <getcallerpcs+0x67>
    pcs[i] = 0;
80104fe7:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104fea:	c1 e0 02             	shl    $0x2,%eax
80104fed:	03 45 0c             	add    0xc(%ebp),%eax
80104ff0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104ff6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80104ffa:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
80104ffe:	7e e7                	jle    80104fe7 <getcallerpcs+0x54>
    pcs[i] = 0;
}
80105000:	c9                   	leave  
80105001:	c3                   	ret    

80105002 <holding>:

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80105002:	55                   	push   %ebp
80105003:	89 e5                	mov    %esp,%ebp
  return lock->locked && lock->cpu == cpu;
80105005:	8b 45 08             	mov    0x8(%ebp),%eax
80105008:	8b 00                	mov    (%eax),%eax
8010500a:	85 c0                	test   %eax,%eax
8010500c:	74 17                	je     80105025 <holding+0x23>
8010500e:	8b 45 08             	mov    0x8(%ebp),%eax
80105011:	8b 50 08             	mov    0x8(%eax),%edx
80105014:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010501a:	39 c2                	cmp    %eax,%edx
8010501c:	75 07                	jne    80105025 <holding+0x23>
8010501e:	b8 01 00 00 00       	mov    $0x1,%eax
80105023:	eb 05                	jmp    8010502a <holding+0x28>
80105025:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010502a:	5d                   	pop    %ebp
8010502b:	c3                   	ret    

8010502c <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
8010502c:	55                   	push   %ebp
8010502d:	89 e5                	mov    %esp,%ebp
8010502f:	83 ec 10             	sub    $0x10,%esp
  int eflags;
  
  eflags = readeflags();
80105032:	e8 55 fe ff ff       	call   80104e8c <readeflags>
80105037:	89 45 fc             	mov    %eax,-0x4(%ebp)
  cli();
8010503a:	e8 5d fe ff ff       	call   80104e9c <cli>
  if(cpu->ncli++ == 0)
8010503f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80105045:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
8010504b:	85 d2                	test   %edx,%edx
8010504d:	0f 94 c1             	sete   %cl
80105050:	83 c2 01             	add    $0x1,%edx
80105053:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
80105059:	84 c9                	test   %cl,%cl
8010505b:	74 15                	je     80105072 <pushcli+0x46>
    cpu->intena = eflags & FL_IF;
8010505d:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80105063:	8b 55 fc             	mov    -0x4(%ebp),%edx
80105066:	81 e2 00 02 00 00    	and    $0x200,%edx
8010506c:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
}
80105072:	c9                   	leave  
80105073:	c3                   	ret    

80105074 <popcli>:

void
popcli(void)
{
80105074:	55                   	push   %ebp
80105075:	89 e5                	mov    %esp,%ebp
80105077:	83 ec 18             	sub    $0x18,%esp
  if(readeflags()&FL_IF)
8010507a:	e8 0d fe ff ff       	call   80104e8c <readeflags>
8010507f:	25 00 02 00 00       	and    $0x200,%eax
80105084:	85 c0                	test   %eax,%eax
80105086:	74 0c                	je     80105094 <popcli+0x20>
    panic("popcli - interruptible");
80105088:	c7 04 24 25 89 10 80 	movl   $0x80108925,(%esp)
8010508f:	e8 a6 b4 ff ff       	call   8010053a <panic>
  if(--cpu->ncli < 0)
80105094:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010509a:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
801050a0:	83 ea 01             	sub    $0x1,%edx
801050a3:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
801050a9:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
801050af:	85 c0                	test   %eax,%eax
801050b1:	79 0c                	jns    801050bf <popcli+0x4b>
    panic("popcli");
801050b3:	c7 04 24 3c 89 10 80 	movl   $0x8010893c,(%esp)
801050ba:	e8 7b b4 ff ff       	call   8010053a <panic>
  if(cpu->ncli == 0 && cpu->intena)
801050bf:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801050c5:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
801050cb:	85 c0                	test   %eax,%eax
801050cd:	75 15                	jne    801050e4 <popcli+0x70>
801050cf:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801050d5:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
801050db:	85 c0                	test   %eax,%eax
801050dd:	74 05                	je     801050e4 <popcli+0x70>
    sti();
801050df:	e8 be fd ff ff       	call   80104ea2 <sti>
}
801050e4:	c9                   	leave  
801050e5:	c3                   	ret    
	...

801050e8 <stosb>:
801050e8:	55                   	push   %ebp
801050e9:	89 e5                	mov    %esp,%ebp
801050eb:	57                   	push   %edi
801050ec:	53                   	push   %ebx
801050ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
801050f0:	8b 55 10             	mov    0x10(%ebp),%edx
801050f3:	8b 45 0c             	mov    0xc(%ebp),%eax
801050f6:	89 cb                	mov    %ecx,%ebx
801050f8:	89 df                	mov    %ebx,%edi
801050fa:	89 d1                	mov    %edx,%ecx
801050fc:	fc                   	cld    
801050fd:	f3 aa                	rep stos %al,%es:(%edi)
801050ff:	89 ca                	mov    %ecx,%edx
80105101:	89 fb                	mov    %edi,%ebx
80105103:	89 5d 08             	mov    %ebx,0x8(%ebp)
80105106:	89 55 10             	mov    %edx,0x10(%ebp)
80105109:	5b                   	pop    %ebx
8010510a:	5f                   	pop    %edi
8010510b:	5d                   	pop    %ebp
8010510c:	c3                   	ret    

8010510d <stosl>:
8010510d:	55                   	push   %ebp
8010510e:	89 e5                	mov    %esp,%ebp
80105110:	57                   	push   %edi
80105111:	53                   	push   %ebx
80105112:	8b 4d 08             	mov    0x8(%ebp),%ecx
80105115:	8b 55 10             	mov    0x10(%ebp),%edx
80105118:	8b 45 0c             	mov    0xc(%ebp),%eax
8010511b:	89 cb                	mov    %ecx,%ebx
8010511d:	89 df                	mov    %ebx,%edi
8010511f:	89 d1                	mov    %edx,%ecx
80105121:	fc                   	cld    
80105122:	f3 ab                	rep stos %eax,%es:(%edi)
80105124:	89 ca                	mov    %ecx,%edx
80105126:	89 fb                	mov    %edi,%ebx
80105128:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010512b:	89 55 10             	mov    %edx,0x10(%ebp)
8010512e:	5b                   	pop    %ebx
8010512f:	5f                   	pop    %edi
80105130:	5d                   	pop    %ebp
80105131:	c3                   	ret    

80105132 <memset>:
80105132:	55                   	push   %ebp
80105133:	89 e5                	mov    %esp,%ebp
80105135:	83 ec 0c             	sub    $0xc,%esp
80105138:	8b 45 08             	mov    0x8(%ebp),%eax
8010513b:	83 e0 03             	and    $0x3,%eax
8010513e:	85 c0                	test   %eax,%eax
80105140:	75 49                	jne    8010518b <memset+0x59>
80105142:	8b 45 10             	mov    0x10(%ebp),%eax
80105145:	83 e0 03             	and    $0x3,%eax
80105148:	85 c0                	test   %eax,%eax
8010514a:	75 3f                	jne    8010518b <memset+0x59>
8010514c:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
80105153:	8b 45 10             	mov    0x10(%ebp),%eax
80105156:	c1 e8 02             	shr    $0x2,%eax
80105159:	89 c2                	mov    %eax,%edx
8010515b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010515e:	89 c1                	mov    %eax,%ecx
80105160:	c1 e1 18             	shl    $0x18,%ecx
80105163:	8b 45 0c             	mov    0xc(%ebp),%eax
80105166:	c1 e0 10             	shl    $0x10,%eax
80105169:	09 c1                	or     %eax,%ecx
8010516b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010516e:	c1 e0 08             	shl    $0x8,%eax
80105171:	09 c8                	or     %ecx,%eax
80105173:	0b 45 0c             	or     0xc(%ebp),%eax
80105176:	89 54 24 08          	mov    %edx,0x8(%esp)
8010517a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010517e:	8b 45 08             	mov    0x8(%ebp),%eax
80105181:	89 04 24             	mov    %eax,(%esp)
80105184:	e8 84 ff ff ff       	call   8010510d <stosl>
80105189:	eb 19                	jmp    801051a4 <memset+0x72>
8010518b:	8b 45 10             	mov    0x10(%ebp),%eax
8010518e:	89 44 24 08          	mov    %eax,0x8(%esp)
80105192:	8b 45 0c             	mov    0xc(%ebp),%eax
80105195:	89 44 24 04          	mov    %eax,0x4(%esp)
80105199:	8b 45 08             	mov    0x8(%ebp),%eax
8010519c:	89 04 24             	mov    %eax,(%esp)
8010519f:	e8 44 ff ff ff       	call   801050e8 <stosb>
801051a4:	8b 45 08             	mov    0x8(%ebp),%eax
801051a7:	c9                   	leave  
801051a8:	c3                   	ret    

801051a9 <memcmp>:
801051a9:	55                   	push   %ebp
801051aa:	89 e5                	mov    %esp,%ebp
801051ac:	83 ec 10             	sub    $0x10,%esp
801051af:	8b 45 08             	mov    0x8(%ebp),%eax
801051b2:	89 45 f8             	mov    %eax,-0x8(%ebp)
801051b5:	8b 45 0c             	mov    0xc(%ebp),%eax
801051b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
801051bb:	eb 32                	jmp    801051ef <memcmp+0x46>
801051bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
801051c0:	0f b6 10             	movzbl (%eax),%edx
801051c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
801051c6:	0f b6 00             	movzbl (%eax),%eax
801051c9:	38 c2                	cmp    %al,%dl
801051cb:	74 1a                	je     801051e7 <memcmp+0x3e>
801051cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
801051d0:	0f b6 00             	movzbl (%eax),%eax
801051d3:	0f b6 d0             	movzbl %al,%edx
801051d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
801051d9:	0f b6 00             	movzbl (%eax),%eax
801051dc:	0f b6 c0             	movzbl %al,%eax
801051df:	89 d1                	mov    %edx,%ecx
801051e1:	29 c1                	sub    %eax,%ecx
801051e3:	89 c8                	mov    %ecx,%eax
801051e5:	eb 1c                	jmp    80105203 <memcmp+0x5a>
801051e7:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
801051eb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
801051ef:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801051f3:	0f 95 c0             	setne  %al
801051f6:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801051fa:	84 c0                	test   %al,%al
801051fc:	75 bf                	jne    801051bd <memcmp+0x14>
801051fe:	b8 00 00 00 00       	mov    $0x0,%eax
80105203:	c9                   	leave  
80105204:	c3                   	ret    

80105205 <memmove>:
80105205:	55                   	push   %ebp
80105206:	89 e5                	mov    %esp,%ebp
80105208:	83 ec 10             	sub    $0x10,%esp
8010520b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010520e:	89 45 f8             	mov    %eax,-0x8(%ebp)
80105211:	8b 45 08             	mov    0x8(%ebp),%eax
80105214:	89 45 fc             	mov    %eax,-0x4(%ebp)
80105217:	8b 45 f8             	mov    -0x8(%ebp),%eax
8010521a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
8010521d:	73 55                	jae    80105274 <memmove+0x6f>
8010521f:	8b 45 10             	mov    0x10(%ebp),%eax
80105222:	8b 55 f8             	mov    -0x8(%ebp),%edx
80105225:	8d 04 02             	lea    (%edx,%eax,1),%eax
80105228:	3b 45 fc             	cmp    -0x4(%ebp),%eax
8010522b:	76 4a                	jbe    80105277 <memmove+0x72>
8010522d:	8b 45 10             	mov    0x10(%ebp),%eax
80105230:	01 45 f8             	add    %eax,-0x8(%ebp)
80105233:	8b 45 10             	mov    0x10(%ebp),%eax
80105236:	01 45 fc             	add    %eax,-0x4(%ebp)
80105239:	eb 13                	jmp    8010524e <memmove+0x49>
8010523b:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
8010523f:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
80105243:	8b 45 f8             	mov    -0x8(%ebp),%eax
80105246:	0f b6 10             	movzbl (%eax),%edx
80105249:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010524c:	88 10                	mov    %dl,(%eax)
8010524e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105252:	0f 95 c0             	setne  %al
80105255:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
80105259:	84 c0                	test   %al,%al
8010525b:	75 de                	jne    8010523b <memmove+0x36>
8010525d:	eb 28                	jmp    80105287 <memmove+0x82>
8010525f:	8b 45 f8             	mov    -0x8(%ebp),%eax
80105262:	0f b6 10             	movzbl (%eax),%edx
80105265:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105268:	88 10                	mov    %dl,(%eax)
8010526a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
8010526e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
80105272:	eb 04                	jmp    80105278 <memmove+0x73>
80105274:	90                   	nop
80105275:	eb 01                	jmp    80105278 <memmove+0x73>
80105277:	90                   	nop
80105278:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
8010527c:	0f 95 c0             	setne  %al
8010527f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
80105283:	84 c0                	test   %al,%al
80105285:	75 d8                	jne    8010525f <memmove+0x5a>
80105287:	8b 45 08             	mov    0x8(%ebp),%eax
8010528a:	c9                   	leave  
8010528b:	c3                   	ret    

8010528c <memcpy>:
8010528c:	55                   	push   %ebp
8010528d:	89 e5                	mov    %esp,%ebp
8010528f:	83 ec 0c             	sub    $0xc,%esp
80105292:	8b 45 10             	mov    0x10(%ebp),%eax
80105295:	89 44 24 08          	mov    %eax,0x8(%esp)
80105299:	8b 45 0c             	mov    0xc(%ebp),%eax
8010529c:	89 44 24 04          	mov    %eax,0x4(%esp)
801052a0:	8b 45 08             	mov    0x8(%ebp),%eax
801052a3:	89 04 24             	mov    %eax,(%esp)
801052a6:	e8 5a ff ff ff       	call   80105205 <memmove>
801052ab:	c9                   	leave  
801052ac:	c3                   	ret    

801052ad <strncmp>:
801052ad:	55                   	push   %ebp
801052ae:	89 e5                	mov    %esp,%ebp
801052b0:	eb 0c                	jmp    801052be <strncmp+0x11>
801052b2:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801052b6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
801052ba:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
801052be:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801052c2:	74 1a                	je     801052de <strncmp+0x31>
801052c4:	8b 45 08             	mov    0x8(%ebp),%eax
801052c7:	0f b6 00             	movzbl (%eax),%eax
801052ca:	84 c0                	test   %al,%al
801052cc:	74 10                	je     801052de <strncmp+0x31>
801052ce:	8b 45 08             	mov    0x8(%ebp),%eax
801052d1:	0f b6 10             	movzbl (%eax),%edx
801052d4:	8b 45 0c             	mov    0xc(%ebp),%eax
801052d7:	0f b6 00             	movzbl (%eax),%eax
801052da:	38 c2                	cmp    %al,%dl
801052dc:	74 d4                	je     801052b2 <strncmp+0x5>
801052de:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801052e2:	75 07                	jne    801052eb <strncmp+0x3e>
801052e4:	b8 00 00 00 00       	mov    $0x0,%eax
801052e9:	eb 18                	jmp    80105303 <strncmp+0x56>
801052eb:	8b 45 08             	mov    0x8(%ebp),%eax
801052ee:	0f b6 00             	movzbl (%eax),%eax
801052f1:	0f b6 d0             	movzbl %al,%edx
801052f4:	8b 45 0c             	mov    0xc(%ebp),%eax
801052f7:	0f b6 00             	movzbl (%eax),%eax
801052fa:	0f b6 c0             	movzbl %al,%eax
801052fd:	89 d1                	mov    %edx,%ecx
801052ff:	29 c1                	sub    %eax,%ecx
80105301:	89 c8                	mov    %ecx,%eax
80105303:	5d                   	pop    %ebp
80105304:	c3                   	ret    

80105305 <strncpy>:
80105305:	55                   	push   %ebp
80105306:	89 e5                	mov    %esp,%ebp
80105308:	83 ec 10             	sub    $0x10,%esp
8010530b:	8b 45 08             	mov    0x8(%ebp),%eax
8010530e:	89 45 fc             	mov    %eax,-0x4(%ebp)
80105311:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105315:	0f 9f c0             	setg   %al
80105318:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
8010531c:	84 c0                	test   %al,%al
8010531e:	74 30                	je     80105350 <strncpy+0x4b>
80105320:	8b 45 0c             	mov    0xc(%ebp),%eax
80105323:	0f b6 10             	movzbl (%eax),%edx
80105326:	8b 45 08             	mov    0x8(%ebp),%eax
80105329:	88 10                	mov    %dl,(%eax)
8010532b:	8b 45 08             	mov    0x8(%ebp),%eax
8010532e:	0f b6 00             	movzbl (%eax),%eax
80105331:	84 c0                	test   %al,%al
80105333:	0f 95 c0             	setne  %al
80105336:	83 45 08 01          	addl   $0x1,0x8(%ebp)
8010533a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
8010533e:	84 c0                	test   %al,%al
80105340:	75 cf                	jne    80105311 <strncpy+0xc>
80105342:	eb 0d                	jmp    80105351 <strncpy+0x4c>
80105344:	8b 45 08             	mov    0x8(%ebp),%eax
80105347:	c6 00 00             	movb   $0x0,(%eax)
8010534a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
8010534e:	eb 01                	jmp    80105351 <strncpy+0x4c>
80105350:	90                   	nop
80105351:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105355:	0f 9f c0             	setg   %al
80105358:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
8010535c:	84 c0                	test   %al,%al
8010535e:	75 e4                	jne    80105344 <strncpy+0x3f>
80105360:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105363:	c9                   	leave  
80105364:	c3                   	ret    

80105365 <safestrcpy>:
80105365:	55                   	push   %ebp
80105366:	89 e5                	mov    %esp,%ebp
80105368:	83 ec 10             	sub    $0x10,%esp
8010536b:	8b 45 08             	mov    0x8(%ebp),%eax
8010536e:	89 45 fc             	mov    %eax,-0x4(%ebp)
80105371:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105375:	7f 05                	jg     8010537c <safestrcpy+0x17>
80105377:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010537a:	eb 35                	jmp    801053b1 <safestrcpy+0x4c>
8010537c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
80105380:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105384:	7e 22                	jle    801053a8 <safestrcpy+0x43>
80105386:	8b 45 0c             	mov    0xc(%ebp),%eax
80105389:	0f b6 10             	movzbl (%eax),%edx
8010538c:	8b 45 08             	mov    0x8(%ebp),%eax
8010538f:	88 10                	mov    %dl,(%eax)
80105391:	8b 45 08             	mov    0x8(%ebp),%eax
80105394:	0f b6 00             	movzbl (%eax),%eax
80105397:	84 c0                	test   %al,%al
80105399:	0f 95 c0             	setne  %al
8010539c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
801053a0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
801053a4:	84 c0                	test   %al,%al
801053a6:	75 d4                	jne    8010537c <safestrcpy+0x17>
801053a8:	8b 45 08             	mov    0x8(%ebp),%eax
801053ab:	c6 00 00             	movb   $0x0,(%eax)
801053ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
801053b1:	c9                   	leave  
801053b2:	c3                   	ret    

801053b3 <strlen>:
801053b3:	55                   	push   %ebp
801053b4:	89 e5                	mov    %esp,%ebp
801053b6:	83 ec 10             	sub    $0x10,%esp
801053b9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
801053c0:	eb 04                	jmp    801053c6 <strlen+0x13>
801053c2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
801053c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
801053c9:	03 45 08             	add    0x8(%ebp),%eax
801053cc:	0f b6 00             	movzbl (%eax),%eax
801053cf:	84 c0                	test   %al,%al
801053d1:	75 ef                	jne    801053c2 <strlen+0xf>
801053d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
801053d6:	c9                   	leave  
801053d7:	c3                   	ret    

801053d8 <swtch>:
801053d8:	8b 44 24 04          	mov    0x4(%esp),%eax
801053dc:	8b 54 24 08          	mov    0x8(%esp),%edx
801053e0:	55                   	push   %ebp
801053e1:	53                   	push   %ebx
801053e2:	56                   	push   %esi
801053e3:	57                   	push   %edi
801053e4:	89 20                	mov    %esp,(%eax)
801053e6:	89 d4                	mov    %edx,%esp
801053e8:	5f                   	pop    %edi
801053e9:	5e                   	pop    %esi
801053ea:	5b                   	pop    %ebx
801053eb:	5d                   	pop    %ebp
801053ec:	c3                   	ret    
801053ed:	00 00                	add    %al,(%eax)
	...

801053f0 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801053f0:	55                   	push   %ebp
801053f1:	89 e5                	mov    %esp,%ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
801053f3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801053f9:	8b 00                	mov    (%eax),%eax
801053fb:	3b 45 08             	cmp    0x8(%ebp),%eax
801053fe:	76 12                	jbe    80105412 <fetchint+0x22>
80105400:	8b 45 08             	mov    0x8(%ebp),%eax
80105403:	8d 50 04             	lea    0x4(%eax),%edx
80105406:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010540c:	8b 00                	mov    (%eax),%eax
8010540e:	39 c2                	cmp    %eax,%edx
80105410:	76 07                	jbe    80105419 <fetchint+0x29>
    return -1;
80105412:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105417:	eb 0f                	jmp    80105428 <fetchint+0x38>
  *ip = *(int*)(addr);
80105419:	8b 45 08             	mov    0x8(%ebp),%eax
8010541c:	8b 10                	mov    (%eax),%edx
8010541e:	8b 45 0c             	mov    0xc(%ebp),%eax
80105421:	89 10                	mov    %edx,(%eax)
  return 0;
80105423:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105428:	5d                   	pop    %ebp
80105429:	c3                   	ret    

8010542a <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
8010542a:	55                   	push   %ebp
8010542b:	89 e5                	mov    %esp,%ebp
8010542d:	83 ec 10             	sub    $0x10,%esp
  char *s, *ep;

  if(addr >= proc->sz)
80105430:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105436:	8b 00                	mov    (%eax),%eax
80105438:	3b 45 08             	cmp    0x8(%ebp),%eax
8010543b:	77 07                	ja     80105444 <fetchstr+0x1a>
    return -1;
8010543d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105442:	eb 48                	jmp    8010548c <fetchstr+0x62>
  *pp = (char*)addr;
80105444:	8b 55 08             	mov    0x8(%ebp),%edx
80105447:	8b 45 0c             	mov    0xc(%ebp),%eax
8010544a:	89 10                	mov    %edx,(%eax)
  ep = (char*)proc->sz;
8010544c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105452:	8b 00                	mov    (%eax),%eax
80105454:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for(s = *pp; s < ep; s++)
80105457:	8b 45 0c             	mov    0xc(%ebp),%eax
8010545a:	8b 00                	mov    (%eax),%eax
8010545c:	89 45 f8             	mov    %eax,-0x8(%ebp)
8010545f:	eb 1e                	jmp    8010547f <fetchstr+0x55>
    if(*s == 0)
80105461:	8b 45 f8             	mov    -0x8(%ebp),%eax
80105464:	0f b6 00             	movzbl (%eax),%eax
80105467:	84 c0                	test   %al,%al
80105469:	75 10                	jne    8010547b <fetchstr+0x51>
      return s - *pp;
8010546b:	8b 55 f8             	mov    -0x8(%ebp),%edx
8010546e:	8b 45 0c             	mov    0xc(%ebp),%eax
80105471:	8b 00                	mov    (%eax),%eax
80105473:	89 d1                	mov    %edx,%ecx
80105475:	29 c1                	sub    %eax,%ecx
80105477:	89 c8                	mov    %ecx,%eax
80105479:	eb 11                	jmp    8010548c <fetchstr+0x62>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
8010547b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
8010547f:	8b 45 f8             	mov    -0x8(%ebp),%eax
80105482:	3b 45 fc             	cmp    -0x4(%ebp),%eax
80105485:	72 da                	jb     80105461 <fetchstr+0x37>
    if(*s == 0)
      return s - *pp;
  return -1;
80105487:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010548c:	c9                   	leave  
8010548d:	c3                   	ret    

8010548e <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
8010548e:	55                   	push   %ebp
8010548f:	89 e5                	mov    %esp,%ebp
80105491:	83 ec 08             	sub    $0x8,%esp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80105494:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010549a:	8b 40 18             	mov    0x18(%eax),%eax
8010549d:	8b 50 44             	mov    0x44(%eax),%edx
801054a0:	8b 45 08             	mov    0x8(%ebp),%eax
801054a3:	c1 e0 02             	shl    $0x2,%eax
801054a6:	8d 04 02             	lea    (%edx,%eax,1),%eax
801054a9:	8d 50 04             	lea    0x4(%eax),%edx
801054ac:	8b 45 0c             	mov    0xc(%ebp),%eax
801054af:	89 44 24 04          	mov    %eax,0x4(%esp)
801054b3:	89 14 24             	mov    %edx,(%esp)
801054b6:	e8 35 ff ff ff       	call   801053f0 <fetchint>
}
801054bb:	c9                   	leave  
801054bc:	c3                   	ret    

801054bd <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size n bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
801054bd:	55                   	push   %ebp
801054be:	89 e5                	mov    %esp,%ebp
801054c0:	83 ec 18             	sub    $0x18,%esp
  int i;
  
  if(argint(n, &i) < 0)
801054c3:	8d 45 fc             	lea    -0x4(%ebp),%eax
801054c6:	89 44 24 04          	mov    %eax,0x4(%esp)
801054ca:	8b 45 08             	mov    0x8(%ebp),%eax
801054cd:	89 04 24             	mov    %eax,(%esp)
801054d0:	e8 b9 ff ff ff       	call   8010548e <argint>
801054d5:	85 c0                	test   %eax,%eax
801054d7:	79 07                	jns    801054e0 <argptr+0x23>
    return -1;
801054d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054de:	eb 3d                	jmp    8010551d <argptr+0x60>
  if((uint)i >= proc->sz || (uint)i+size > proc->sz)
801054e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
801054e3:	89 c2                	mov    %eax,%edx
801054e5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801054eb:	8b 00                	mov    (%eax),%eax
801054ed:	39 c2                	cmp    %eax,%edx
801054ef:	73 16                	jae    80105507 <argptr+0x4a>
801054f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
801054f4:	89 c2                	mov    %eax,%edx
801054f6:	8b 45 10             	mov    0x10(%ebp),%eax
801054f9:	01 c2                	add    %eax,%edx
801054fb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105501:	8b 00                	mov    (%eax),%eax
80105503:	39 c2                	cmp    %eax,%edx
80105505:	76 07                	jbe    8010550e <argptr+0x51>
    return -1;
80105507:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010550c:	eb 0f                	jmp    8010551d <argptr+0x60>
  *pp = (char*)i;
8010550e:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105511:	89 c2                	mov    %eax,%edx
80105513:	8b 45 0c             	mov    0xc(%ebp),%eax
80105516:	89 10                	mov    %edx,(%eax)
  return 0;
80105518:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010551d:	c9                   	leave  
8010551e:	c3                   	ret    

8010551f <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
8010551f:	55                   	push   %ebp
80105520:	89 e5                	mov    %esp,%ebp
80105522:	83 ec 18             	sub    $0x18,%esp
  int addr;
  if(argint(n, &addr) < 0)
80105525:	8d 45 fc             	lea    -0x4(%ebp),%eax
80105528:	89 44 24 04          	mov    %eax,0x4(%esp)
8010552c:	8b 45 08             	mov    0x8(%ebp),%eax
8010552f:	89 04 24             	mov    %eax,(%esp)
80105532:	e8 57 ff ff ff       	call   8010548e <argint>
80105537:	85 c0                	test   %eax,%eax
80105539:	79 07                	jns    80105542 <argstr+0x23>
    return -1;
8010553b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105540:	eb 12                	jmp    80105554 <argstr+0x35>
  return fetchstr(addr, pp);
80105542:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105545:	8b 55 0c             	mov    0xc(%ebp),%edx
80105548:	89 54 24 04          	mov    %edx,0x4(%esp)
8010554c:	89 04 24             	mov    %eax,(%esp)
8010554f:	e8 d6 fe ff ff       	call   8010542a <fetchstr>
}
80105554:	c9                   	leave  
80105555:	c3                   	ret    

80105556 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
80105556:	55                   	push   %ebp
80105557:	89 e5                	mov    %esp,%ebp
80105559:	53                   	push   %ebx
8010555a:	83 ec 24             	sub    $0x24,%esp
  int num;

  num = proc->tf->eax;
8010555d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105563:	8b 40 18             	mov    0x18(%eax),%eax
80105566:	8b 40 1c             	mov    0x1c(%eax),%eax
80105569:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
8010556c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105570:	7e 30                	jle    801055a2 <syscall+0x4c>
80105572:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105575:	83 f8 18             	cmp    $0x18,%eax
80105578:	77 28                	ja     801055a2 <syscall+0x4c>
8010557a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010557d:	8b 04 85 40 b0 10 80 	mov    -0x7fef4fc0(,%eax,4),%eax
80105584:	85 c0                	test   %eax,%eax
80105586:	74 1a                	je     801055a2 <syscall+0x4c>
    proc->tf->eax = syscalls[num]();
80105588:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010558e:	8b 58 18             	mov    0x18(%eax),%ebx
80105591:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105594:	8b 04 85 40 b0 10 80 	mov    -0x7fef4fc0(,%eax,4),%eax
8010559b:	ff d0                	call   *%eax
8010559d:	89 43 1c             	mov    %eax,0x1c(%ebx)
syscall(void)
{
  int num;

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
801055a0:	eb 3d                	jmp    801055df <syscall+0x89>
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
801055a2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801055a8:	8d 48 6c             	lea    0x6c(%eax),%ecx
            proc->pid, proc->name, num);
801055ab:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801055b1:	8b 40 10             	mov    0x10(%eax),%eax
801055b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
801055b7:	89 54 24 0c          	mov    %edx,0xc(%esp)
801055bb:	89 4c 24 08          	mov    %ecx,0x8(%esp)
801055bf:	89 44 24 04          	mov    %eax,0x4(%esp)
801055c3:	c7 04 24 43 89 10 80 	movl   $0x80108943,(%esp)
801055ca:	e8 cb ad ff ff       	call   8010039a <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
801055cf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801055d5:	8b 40 18             	mov    0x18(%eax),%eax
801055d8:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
801055df:	83 c4 24             	add    $0x24,%esp
801055e2:	5b                   	pop    %ebx
801055e3:	5d                   	pop    %ebp
801055e4:	c3                   	ret    
801055e5:	00 00                	add    %al,(%eax)
	...

801055e8 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
801055e8:	55                   	push   %ebp
801055e9:	89 e5                	mov    %esp,%ebp
801055eb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
801055ee:	8d 45 f0             	lea    -0x10(%ebp),%eax
801055f1:	89 44 24 04          	mov    %eax,0x4(%esp)
801055f5:	8b 45 08             	mov    0x8(%ebp),%eax
801055f8:	89 04 24             	mov    %eax,(%esp)
801055fb:	e8 8e fe ff ff       	call   8010548e <argint>
80105600:	85 c0                	test   %eax,%eax
80105602:	79 07                	jns    8010560b <argfd+0x23>
    return -1;
80105604:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105609:	eb 50                	jmp    8010565b <argfd+0x73>
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
8010560b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010560e:	85 c0                	test   %eax,%eax
80105610:	78 21                	js     80105633 <argfd+0x4b>
80105612:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105615:	83 f8 0f             	cmp    $0xf,%eax
80105618:	7f 19                	jg     80105633 <argfd+0x4b>
8010561a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105620:	8b 55 f0             	mov    -0x10(%ebp),%edx
80105623:	83 c2 08             	add    $0x8,%edx
80105626:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
8010562a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010562d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105631:	75 07                	jne    8010563a <argfd+0x52>
    return -1;
80105633:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105638:	eb 21                	jmp    8010565b <argfd+0x73>
  if(pfd)
8010563a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
8010563e:	74 08                	je     80105648 <argfd+0x60>
    *pfd = fd;
80105640:	8b 55 f0             	mov    -0x10(%ebp),%edx
80105643:	8b 45 0c             	mov    0xc(%ebp),%eax
80105646:	89 10                	mov    %edx,(%eax)
  if(pf)
80105648:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
8010564c:	74 08                	je     80105656 <argfd+0x6e>
    *pf = f;
8010564e:	8b 45 10             	mov    0x10(%ebp),%eax
80105651:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105654:	89 10                	mov    %edx,(%eax)
  return 0;
80105656:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010565b:	c9                   	leave  
8010565c:	c3                   	ret    

8010565d <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
8010565d:	55                   	push   %ebp
8010565e:	89 e5                	mov    %esp,%ebp
80105660:	83 ec 10             	sub    $0x10,%esp
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105663:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
8010566a:	eb 30                	jmp    8010569c <fdalloc+0x3f>
    if(proc->ofile[fd] == 0){
8010566c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105672:	8b 55 fc             	mov    -0x4(%ebp),%edx
80105675:	83 c2 08             	add    $0x8,%edx
80105678:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
8010567c:	85 c0                	test   %eax,%eax
8010567e:	75 18                	jne    80105698 <fdalloc+0x3b>
      proc->ofile[fd] = f;
80105680:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105686:	8b 55 fc             	mov    -0x4(%ebp),%edx
80105689:	8d 4a 08             	lea    0x8(%edx),%ecx
8010568c:	8b 55 08             	mov    0x8(%ebp),%edx
8010568f:	89 54 88 08          	mov    %edx,0x8(%eax,%ecx,4)
      return fd;
80105693:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105696:	eb 0f                	jmp    801056a7 <fdalloc+0x4a>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105698:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
8010569c:	83 7d fc 0f          	cmpl   $0xf,-0x4(%ebp)
801056a0:	7e ca                	jle    8010566c <fdalloc+0xf>
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
801056a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801056a7:	c9                   	leave  
801056a8:	c3                   	ret    

801056a9 <sys_dup>:

int
sys_dup(void)
{
801056a9:	55                   	push   %ebp
801056aa:	89 e5                	mov    %esp,%ebp
801056ac:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int fd;
  
  if(argfd(0, 0, &f) < 0)
801056af:	8d 45 f0             	lea    -0x10(%ebp),%eax
801056b2:	89 44 24 08          	mov    %eax,0x8(%esp)
801056b6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801056bd:	00 
801056be:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801056c5:	e8 1e ff ff ff       	call   801055e8 <argfd>
801056ca:	85 c0                	test   %eax,%eax
801056cc:	79 07                	jns    801056d5 <sys_dup+0x2c>
    return -1;
801056ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056d3:	eb 29                	jmp    801056fe <sys_dup+0x55>
  if((fd=fdalloc(f)) < 0)
801056d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
801056d8:	89 04 24             	mov    %eax,(%esp)
801056db:	e8 7d ff ff ff       	call   8010565d <fdalloc>
801056e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
801056e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801056e7:	79 07                	jns    801056f0 <sys_dup+0x47>
    return -1;
801056e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056ee:	eb 0e                	jmp    801056fe <sys_dup+0x55>
  filedup(f);
801056f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
801056f3:	89 04 24             	mov    %eax,(%esp)
801056f6:	e8 7e b8 ff ff       	call   80100f79 <filedup>
  return fd;
801056fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
801056fe:	c9                   	leave  
801056ff:	c3                   	ret    

80105700 <sys_read>:

int
sys_read(void)
{
80105700:	55                   	push   %ebp
80105701:	89 e5                	mov    %esp,%ebp
80105703:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105706:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105709:	89 44 24 08          	mov    %eax,0x8(%esp)
8010570d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105714:	00 
80105715:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010571c:	e8 c7 fe ff ff       	call   801055e8 <argfd>
80105721:	85 c0                	test   %eax,%eax
80105723:	78 35                	js     8010575a <sys_read+0x5a>
80105725:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105728:	89 44 24 04          	mov    %eax,0x4(%esp)
8010572c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80105733:	e8 56 fd ff ff       	call   8010548e <argint>
80105738:	85 c0                	test   %eax,%eax
8010573a:	78 1e                	js     8010575a <sys_read+0x5a>
8010573c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010573f:	89 44 24 08          	mov    %eax,0x8(%esp)
80105743:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105746:	89 44 24 04          	mov    %eax,0x4(%esp)
8010574a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105751:	e8 67 fd ff ff       	call   801054bd <argptr>
80105756:	85 c0                	test   %eax,%eax
80105758:	79 07                	jns    80105761 <sys_read+0x61>
    return -1;
8010575a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010575f:	eb 19                	jmp    8010577a <sys_read+0x7a>
  return fileread(f, p, n);
80105761:	8b 4d f0             	mov    -0x10(%ebp),%ecx
80105764:	8b 55 ec             	mov    -0x14(%ebp),%edx
80105767:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010576a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
8010576e:	89 54 24 04          	mov    %edx,0x4(%esp)
80105772:	89 04 24             	mov    %eax,(%esp)
80105775:	e8 6c b9 ff ff       	call   801010e6 <fileread>
}
8010577a:	c9                   	leave  
8010577b:	c3                   	ret    

8010577c <sys_write>:

int
sys_write(void)
{
8010577c:	55                   	push   %ebp
8010577d:	89 e5                	mov    %esp,%ebp
8010577f:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105782:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105785:	89 44 24 08          	mov    %eax,0x8(%esp)
80105789:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105790:	00 
80105791:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105798:	e8 4b fe ff ff       	call   801055e8 <argfd>
8010579d:	85 c0                	test   %eax,%eax
8010579f:	78 35                	js     801057d6 <sys_write+0x5a>
801057a1:	8d 45 f0             	lea    -0x10(%ebp),%eax
801057a4:	89 44 24 04          	mov    %eax,0x4(%esp)
801057a8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
801057af:	e8 da fc ff ff       	call   8010548e <argint>
801057b4:	85 c0                	test   %eax,%eax
801057b6:	78 1e                	js     801057d6 <sys_write+0x5a>
801057b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
801057bb:	89 44 24 08          	mov    %eax,0x8(%esp)
801057bf:	8d 45 ec             	lea    -0x14(%ebp),%eax
801057c2:	89 44 24 04          	mov    %eax,0x4(%esp)
801057c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801057cd:	e8 eb fc ff ff       	call   801054bd <argptr>
801057d2:	85 c0                	test   %eax,%eax
801057d4:	79 07                	jns    801057dd <sys_write+0x61>
    return -1;
801057d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057db:	eb 19                	jmp    801057f6 <sys_write+0x7a>
  return filewrite(f, p, n);
801057dd:	8b 4d f0             	mov    -0x10(%ebp),%ecx
801057e0:	8b 55 ec             	mov    -0x14(%ebp),%edx
801057e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801057e6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
801057ea:	89 54 24 04          	mov    %edx,0x4(%esp)
801057ee:	89 04 24             	mov    %eax,(%esp)
801057f1:	e8 ac b9 ff ff       	call   801011a2 <filewrite>
}
801057f6:	c9                   	leave  
801057f7:	c3                   	ret    

801057f8 <sys_close>:

int
sys_close(void)
{
801057f8:	55                   	push   %ebp
801057f9:	89 e5                	mov    %esp,%ebp
801057fb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;
  
  if(argfd(0, &fd, &f) < 0)
801057fe:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105801:	89 44 24 08          	mov    %eax,0x8(%esp)
80105805:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105808:	89 44 24 04          	mov    %eax,0x4(%esp)
8010580c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105813:	e8 d0 fd ff ff       	call   801055e8 <argfd>
80105818:	85 c0                	test   %eax,%eax
8010581a:	79 07                	jns    80105823 <sys_close+0x2b>
    return -1;
8010581c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105821:	eb 24                	jmp    80105847 <sys_close+0x4f>
  proc->ofile[fd] = 0;
80105823:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105829:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010582c:	83 c2 08             	add    $0x8,%edx
8010582f:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
80105836:	00 
  fileclose(f);
80105837:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010583a:	89 04 24             	mov    %eax,(%esp)
8010583d:	e8 7f b7 ff ff       	call   80100fc1 <fileclose>
  return 0;
80105842:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105847:	c9                   	leave  
80105848:	c3                   	ret    

80105849 <sys_fstat>:

int
sys_fstat(void)
{
80105849:	55                   	push   %ebp
8010584a:	89 e5                	mov    %esp,%ebp
8010584c:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  struct stat *st;
  
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
8010584f:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105852:	89 44 24 08          	mov    %eax,0x8(%esp)
80105856:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010585d:	00 
8010585e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105865:	e8 7e fd ff ff       	call   801055e8 <argfd>
8010586a:	85 c0                	test   %eax,%eax
8010586c:	78 1f                	js     8010588d <sys_fstat+0x44>
8010586e:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105871:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
80105878:	00 
80105879:	89 44 24 04          	mov    %eax,0x4(%esp)
8010587d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105884:	e8 34 fc ff ff       	call   801054bd <argptr>
80105889:	85 c0                	test   %eax,%eax
8010588b:	79 07                	jns    80105894 <sys_fstat+0x4b>
    return -1;
8010588d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105892:	eb 12                	jmp    801058a6 <sys_fstat+0x5d>
  return filestat(f, st);
80105894:	8b 55 f0             	mov    -0x10(%ebp),%edx
80105897:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010589a:	89 54 24 04          	mov    %edx,0x4(%esp)
8010589e:	89 04 24             	mov    %eax,(%esp)
801058a1:	e8 f1 b7 ff ff       	call   80101097 <filestat>
}
801058a6:	c9                   	leave  
801058a7:	c3                   	ret    

801058a8 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
801058a8:	55                   	push   %ebp
801058a9:	89 e5                	mov    %esp,%ebp
801058ab:	83 ec 38             	sub    $0x38,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
801058ae:	8d 45 d8             	lea    -0x28(%ebp),%eax
801058b1:	89 44 24 04          	mov    %eax,0x4(%esp)
801058b5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801058bc:	e8 5e fc ff ff       	call   8010551f <argstr>
801058c1:	85 c0                	test   %eax,%eax
801058c3:	78 17                	js     801058dc <sys_link+0x34>
801058c5:	8d 45 dc             	lea    -0x24(%ebp),%eax
801058c8:	89 44 24 04          	mov    %eax,0x4(%esp)
801058cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801058d3:	e8 47 fc ff ff       	call   8010551f <argstr>
801058d8:	85 c0                	test   %eax,%eax
801058da:	79 0a                	jns    801058e6 <sys_link+0x3e>
    return -1;
801058dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058e1:	e9 3c 01 00 00       	jmp    80105a22 <sys_link+0x17a>
  if((ip = namei(old)) == 0)
801058e6:	8b 45 d8             	mov    -0x28(%ebp),%eax
801058e9:	89 04 24             	mov    %eax,(%esp)
801058ec:	e8 26 cb ff ff       	call   80102417 <namei>
801058f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
801058f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801058f8:	75 0a                	jne    80105904 <sys_link+0x5c>
    return -1;
801058fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058ff:	e9 1e 01 00 00       	jmp    80105a22 <sys_link+0x17a>

  begin_trans();
80105904:	e8 fd d8 ff ff       	call   80103206 <begin_trans>

  ilock(ip);
80105909:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010590c:	89 04 24             	mov    %eax,(%esp)
8010590f:	e8 5b bf ff ff       	call   8010186f <ilock>
  if(ip->type == T_DIR){
80105914:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105917:	0f b7 40 10          	movzwl 0x10(%eax),%eax
8010591b:	66 83 f8 01          	cmp    $0x1,%ax
8010591f:	75 1a                	jne    8010593b <sys_link+0x93>
    iunlockput(ip);
80105921:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105924:	89 04 24             	mov    %eax,(%esp)
80105927:	e8 ca c1 ff ff       	call   80101af6 <iunlockput>
    commit_trans();
8010592c:	e8 1e d9 ff ff       	call   8010324f <commit_trans>
    return -1;
80105931:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105936:	e9 e7 00 00 00       	jmp    80105a22 <sys_link+0x17a>
  }

  ip->nlink++;
8010593b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010593e:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105942:	8d 50 01             	lea    0x1(%eax),%edx
80105945:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105948:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
8010594c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010594f:	89 04 24             	mov    %eax,(%esp)
80105952:	e8 58 bd ff ff       	call   801016af <iupdate>
  iunlock(ip);
80105957:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010595a:	89 04 24             	mov    %eax,(%esp)
8010595d:	e8 5e c0 ff ff       	call   801019c0 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80105962:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105965:	8d 55 e2             	lea    -0x1e(%ebp),%edx
80105968:	89 54 24 04          	mov    %edx,0x4(%esp)
8010596c:	89 04 24             	mov    %eax,(%esp)
8010596f:	e8 c5 ca ff ff       	call   80102439 <nameiparent>
80105974:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105977:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010597b:	74 68                	je     801059e5 <sys_link+0x13d>
    goto bad;
  ilock(dp);
8010597d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105980:	89 04 24             	mov    %eax,(%esp)
80105983:	e8 e7 be ff ff       	call   8010186f <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80105988:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010598b:	8b 10                	mov    (%eax),%edx
8010598d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105990:	8b 00                	mov    (%eax),%eax
80105992:	39 c2                	cmp    %eax,%edx
80105994:	75 20                	jne    801059b6 <sys_link+0x10e>
80105996:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105999:	8b 40 04             	mov    0x4(%eax),%eax
8010599c:	89 44 24 08          	mov    %eax,0x8(%esp)
801059a0:	8d 45 e2             	lea    -0x1e(%ebp),%eax
801059a3:	89 44 24 04          	mov    %eax,0x4(%esp)
801059a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
801059aa:	89 04 24             	mov    %eax,(%esp)
801059ad:	e8 a4 c7 ff ff       	call   80102156 <dirlink>
801059b2:	85 c0                	test   %eax,%eax
801059b4:	79 0d                	jns    801059c3 <sys_link+0x11b>
    iunlockput(dp);
801059b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801059b9:	89 04 24             	mov    %eax,(%esp)
801059bc:	e8 35 c1 ff ff       	call   80101af6 <iunlockput>
    goto bad;
801059c1:	eb 23                	jmp    801059e6 <sys_link+0x13e>
  }
  iunlockput(dp);
801059c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
801059c6:	89 04 24             	mov    %eax,(%esp)
801059c9:	e8 28 c1 ff ff       	call   80101af6 <iunlockput>
  iput(ip);
801059ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
801059d1:	89 04 24             	mov    %eax,(%esp)
801059d4:	e8 4c c0 ff ff       	call   80101a25 <iput>

  commit_trans();
801059d9:	e8 71 d8 ff ff       	call   8010324f <commit_trans>

  return 0;
801059de:	b8 00 00 00 00       	mov    $0x0,%eax
801059e3:	eb 3d                	jmp    80105a22 <sys_link+0x17a>
  ip->nlink++;
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
801059e5:	90                   	nop
  commit_trans();

  return 0;

bad:
  ilock(ip);
801059e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801059e9:	89 04 24             	mov    %eax,(%esp)
801059ec:	e8 7e be ff ff       	call   8010186f <ilock>
  ip->nlink--;
801059f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801059f4:	0f b7 40 16          	movzwl 0x16(%eax),%eax
801059f8:	8d 50 ff             	lea    -0x1(%eax),%edx
801059fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801059fe:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
80105a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105a05:	89 04 24             	mov    %eax,(%esp)
80105a08:	e8 a2 bc ff ff       	call   801016af <iupdate>
  iunlockput(ip);
80105a0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105a10:	89 04 24             	mov    %eax,(%esp)
80105a13:	e8 de c0 ff ff       	call   80101af6 <iunlockput>
  commit_trans();
80105a18:	e8 32 d8 ff ff       	call   8010324f <commit_trans>
  return -1;
80105a1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105a22:	c9                   	leave  
80105a23:	c3                   	ret    

80105a24 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
80105a24:	55                   	push   %ebp
80105a25:	89 e5                	mov    %esp,%ebp
80105a27:	83 ec 38             	sub    $0x38,%esp
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105a2a:	c7 45 f4 20 00 00 00 	movl   $0x20,-0xc(%ebp)
80105a31:	eb 4b                	jmp    80105a7e <isdirempty+0x5a>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105a33:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105a36:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105a39:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80105a40:	00 
80105a41:	89 54 24 08          	mov    %edx,0x8(%esp)
80105a45:	89 44 24 04          	mov    %eax,0x4(%esp)
80105a49:	8b 45 08             	mov    0x8(%ebp),%eax
80105a4c:	89 04 24             	mov    %eax,(%esp)
80105a4f:	e8 14 c3 ff ff       	call   80101d68 <readi>
80105a54:	83 f8 10             	cmp    $0x10,%eax
80105a57:	74 0c                	je     80105a65 <isdirempty+0x41>
      panic("isdirempty: readi");
80105a59:	c7 04 24 5f 89 10 80 	movl   $0x8010895f,(%esp)
80105a60:	e8 d5 aa ff ff       	call   8010053a <panic>
    if(de.inum != 0)
80105a65:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80105a69:	66 85 c0             	test   %ax,%ax
80105a6c:	74 07                	je     80105a75 <isdirempty+0x51>
      return 0;
80105a6e:	b8 00 00 00 00       	mov    $0x0,%eax
80105a73:	eb 1b                	jmp    80105a90 <isdirempty+0x6c>
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105a75:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105a78:	83 c0 10             	add    $0x10,%eax
80105a7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105a7e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105a81:	8b 45 08             	mov    0x8(%ebp),%eax
80105a84:	8b 40 18             	mov    0x18(%eax),%eax
80105a87:	39 c2                	cmp    %eax,%edx
80105a89:	72 a8                	jb     80105a33 <isdirempty+0xf>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
    if(de.inum != 0)
      return 0;
  }
  return 1;
80105a8b:	b8 01 00 00 00       	mov    $0x1,%eax
}
80105a90:	c9                   	leave  
80105a91:	c3                   	ret    

80105a92 <sys_unlink>:

//PAGEBREAK!
int
sys_unlink(void)
{
80105a92:	55                   	push   %ebp
80105a93:	89 e5                	mov    %esp,%ebp
80105a95:	83 ec 48             	sub    $0x48,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80105a98:	8d 45 cc             	lea    -0x34(%ebp),%eax
80105a9b:	89 44 24 04          	mov    %eax,0x4(%esp)
80105a9f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105aa6:	e8 74 fa ff ff       	call   8010551f <argstr>
80105aab:	85 c0                	test   %eax,%eax
80105aad:	79 0a                	jns    80105ab9 <sys_unlink+0x27>
    return -1;
80105aaf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ab4:	e9 aa 01 00 00       	jmp    80105c63 <sys_unlink+0x1d1>
  if((dp = nameiparent(path, name)) == 0)
80105ab9:	8b 45 cc             	mov    -0x34(%ebp),%eax
80105abc:	8d 55 d2             	lea    -0x2e(%ebp),%edx
80105abf:	89 54 24 04          	mov    %edx,0x4(%esp)
80105ac3:	89 04 24             	mov    %eax,(%esp)
80105ac6:	e8 6e c9 ff ff       	call   80102439 <nameiparent>
80105acb:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105ace:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105ad2:	75 0a                	jne    80105ade <sys_unlink+0x4c>
    return -1;
80105ad4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ad9:	e9 85 01 00 00       	jmp    80105c63 <sys_unlink+0x1d1>

  begin_trans();
80105ade:	e8 23 d7 ff ff       	call   80103206 <begin_trans>

  ilock(dp);
80105ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105ae6:	89 04 24             	mov    %eax,(%esp)
80105ae9:	e8 81 bd ff ff       	call   8010186f <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80105aee:	c7 44 24 04 71 89 10 	movl   $0x80108971,0x4(%esp)
80105af5:	80 
80105af6:	8d 45 d2             	lea    -0x2e(%ebp),%eax
80105af9:	89 04 24             	mov    %eax,(%esp)
80105afc:	e8 6b c5 ff ff       	call   8010206c <namecmp>
80105b01:	85 c0                	test   %eax,%eax
80105b03:	0f 84 45 01 00 00    	je     80105c4e <sys_unlink+0x1bc>
80105b09:	c7 44 24 04 73 89 10 	movl   $0x80108973,0x4(%esp)
80105b10:	80 
80105b11:	8d 45 d2             	lea    -0x2e(%ebp),%eax
80105b14:	89 04 24             	mov    %eax,(%esp)
80105b17:	e8 50 c5 ff ff       	call   8010206c <namecmp>
80105b1c:	85 c0                	test   %eax,%eax
80105b1e:	0f 84 2a 01 00 00    	je     80105c4e <sys_unlink+0x1bc>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80105b24:	8d 45 c8             	lea    -0x38(%ebp),%eax
80105b27:	89 44 24 08          	mov    %eax,0x8(%esp)
80105b2b:	8d 45 d2             	lea    -0x2e(%ebp),%eax
80105b2e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105b32:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105b35:	89 04 24             	mov    %eax,(%esp)
80105b38:	e8 51 c5 ff ff       	call   8010208e <dirlookup>
80105b3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105b40:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105b44:	0f 84 03 01 00 00    	je     80105c4d <sys_unlink+0x1bb>
    goto bad;
  ilock(ip);
80105b4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b4d:	89 04 24             	mov    %eax,(%esp)
80105b50:	e8 1a bd ff ff       	call   8010186f <ilock>

  if(ip->nlink < 1)
80105b55:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b58:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105b5c:	66 85 c0             	test   %ax,%ax
80105b5f:	7f 0c                	jg     80105b6d <sys_unlink+0xdb>
    panic("unlink: nlink < 1");
80105b61:	c7 04 24 76 89 10 80 	movl   $0x80108976,(%esp)
80105b68:	e8 cd a9 ff ff       	call   8010053a <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
80105b6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b70:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105b74:	66 83 f8 01          	cmp    $0x1,%ax
80105b78:	75 1f                	jne    80105b99 <sys_unlink+0x107>
80105b7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b7d:	89 04 24             	mov    %eax,(%esp)
80105b80:	e8 9f fe ff ff       	call   80105a24 <isdirempty>
80105b85:	85 c0                	test   %eax,%eax
80105b87:	75 10                	jne    80105b99 <sys_unlink+0x107>
    iunlockput(ip);
80105b89:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b8c:	89 04 24             	mov    %eax,(%esp)
80105b8f:	e8 62 bf ff ff       	call   80101af6 <iunlockput>
    goto bad;
80105b94:	e9 b5 00 00 00       	jmp    80105c4e <sys_unlink+0x1bc>
  }

  memset(&de, 0, sizeof(de));
80105b99:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80105ba0:	00 
80105ba1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105ba8:	00 
80105ba9:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105bac:	89 04 24             	mov    %eax,(%esp)
80105baf:	e8 7e f5 ff ff       	call   80105132 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105bb4:	8b 55 c8             	mov    -0x38(%ebp),%edx
80105bb7:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105bba:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80105bc1:	00 
80105bc2:	89 54 24 08          	mov    %edx,0x8(%esp)
80105bc6:	89 44 24 04          	mov    %eax,0x4(%esp)
80105bca:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105bcd:	89 04 24             	mov    %eax,(%esp)
80105bd0:	e8 ff c2 ff ff       	call   80101ed4 <writei>
80105bd5:	83 f8 10             	cmp    $0x10,%eax
80105bd8:	74 0c                	je     80105be6 <sys_unlink+0x154>
    panic("unlink: writei");
80105bda:	c7 04 24 88 89 10 80 	movl   $0x80108988,(%esp)
80105be1:	e8 54 a9 ff ff       	call   8010053a <panic>
  if(ip->type == T_DIR){
80105be6:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105be9:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105bed:	66 83 f8 01          	cmp    $0x1,%ax
80105bf1:	75 1c                	jne    80105c0f <sys_unlink+0x17d>
    dp->nlink--;
80105bf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105bf6:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105bfa:	8d 50 ff             	lea    -0x1(%eax),%edx
80105bfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c00:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
80105c04:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c07:	89 04 24             	mov    %eax,(%esp)
80105c0a:	e8 a0 ba ff ff       	call   801016af <iupdate>
  }
  iunlockput(dp);
80105c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c12:	89 04 24             	mov    %eax,(%esp)
80105c15:	e8 dc be ff ff       	call   80101af6 <iunlockput>

  ip->nlink--;
80105c1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c1d:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105c21:	8d 50 ff             	lea    -0x1(%eax),%edx
80105c24:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c27:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
80105c2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c2e:	89 04 24             	mov    %eax,(%esp)
80105c31:	e8 79 ba ff ff       	call   801016af <iupdate>
  iunlockput(ip);
80105c36:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c39:	89 04 24             	mov    %eax,(%esp)
80105c3c:	e8 b5 be ff ff       	call   80101af6 <iunlockput>

  commit_trans();
80105c41:	e8 09 d6 ff ff       	call   8010324f <commit_trans>

  return 0;
80105c46:	b8 00 00 00 00       	mov    $0x0,%eax
80105c4b:	eb 16                	jmp    80105c63 <sys_unlink+0x1d1>
  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
80105c4d:	90                   	nop
  commit_trans();

  return 0;

bad:
  iunlockput(dp);
80105c4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c51:	89 04 24             	mov    %eax,(%esp)
80105c54:	e8 9d be ff ff       	call   80101af6 <iunlockput>
  commit_trans();
80105c59:	e8 f1 d5 ff ff       	call   8010324f <commit_trans>
  return -1;
80105c5e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105c63:	c9                   	leave  
80105c64:	c3                   	ret    

80105c65 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
80105c65:	55                   	push   %ebp
80105c66:	89 e5                	mov    %esp,%ebp
80105c68:	83 ec 48             	sub    $0x48,%esp
80105c6b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80105c6e:	8b 55 10             	mov    0x10(%ebp),%edx
80105c71:	8b 45 14             	mov    0x14(%ebp),%eax
80105c74:	66 89 4d d4          	mov    %cx,-0x2c(%ebp)
80105c78:	66 89 55 d0          	mov    %dx,-0x30(%ebp)
80105c7c:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80105c80:	8d 45 de             	lea    -0x22(%ebp),%eax
80105c83:	89 44 24 04          	mov    %eax,0x4(%esp)
80105c87:	8b 45 08             	mov    0x8(%ebp),%eax
80105c8a:	89 04 24             	mov    %eax,(%esp)
80105c8d:	e8 a7 c7 ff ff       	call   80102439 <nameiparent>
80105c92:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105c95:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105c99:	75 0a                	jne    80105ca5 <create+0x40>
    return 0;
80105c9b:	b8 00 00 00 00       	mov    $0x0,%eax
80105ca0:	e9 7e 01 00 00       	jmp    80105e23 <create+0x1be>
  ilock(dp);
80105ca5:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105ca8:	89 04 24             	mov    %eax,(%esp)
80105cab:	e8 bf bb ff ff       	call   8010186f <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80105cb0:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105cb3:	89 44 24 08          	mov    %eax,0x8(%esp)
80105cb7:	8d 45 de             	lea    -0x22(%ebp),%eax
80105cba:	89 44 24 04          	mov    %eax,0x4(%esp)
80105cbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105cc1:	89 04 24             	mov    %eax,(%esp)
80105cc4:	e8 c5 c3 ff ff       	call   8010208e <dirlookup>
80105cc9:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105ccc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105cd0:	74 47                	je     80105d19 <create+0xb4>
    iunlockput(dp);
80105cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105cd5:	89 04 24             	mov    %eax,(%esp)
80105cd8:	e8 19 be ff ff       	call   80101af6 <iunlockput>
    ilock(ip);
80105cdd:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ce0:	89 04 24             	mov    %eax,(%esp)
80105ce3:	e8 87 bb ff ff       	call   8010186f <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80105ce8:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80105ced:	75 15                	jne    80105d04 <create+0x9f>
80105cef:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105cf2:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105cf6:	66 83 f8 02          	cmp    $0x2,%ax
80105cfa:	75 08                	jne    80105d04 <create+0x9f>
      return ip;
80105cfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105cff:	e9 1f 01 00 00       	jmp    80105e23 <create+0x1be>
    iunlockput(ip);
80105d04:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d07:	89 04 24             	mov    %eax,(%esp)
80105d0a:	e8 e7 bd ff ff       	call   80101af6 <iunlockput>
    return 0;
80105d0f:	b8 00 00 00 00       	mov    $0x0,%eax
80105d14:	e9 0a 01 00 00       	jmp    80105e23 <create+0x1be>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80105d19:	0f bf 55 d4          	movswl -0x2c(%ebp),%edx
80105d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d20:	8b 00                	mov    (%eax),%eax
80105d22:	89 54 24 04          	mov    %edx,0x4(%esp)
80105d26:	89 04 24             	mov    %eax,(%esp)
80105d29:	e8 a4 b8 ff ff       	call   801015d2 <ialloc>
80105d2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105d31:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105d35:	75 0c                	jne    80105d43 <create+0xde>
    panic("create: ialloc");
80105d37:	c7 04 24 97 89 10 80 	movl   $0x80108997,(%esp)
80105d3e:	e8 f7 a7 ff ff       	call   8010053a <panic>

  ilock(ip);
80105d43:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d46:	89 04 24             	mov    %eax,(%esp)
80105d49:	e8 21 bb ff ff       	call   8010186f <ilock>
  ip->major = major;
80105d4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d51:	0f b7 55 d0          	movzwl -0x30(%ebp),%edx
80105d55:	66 89 50 12          	mov    %dx,0x12(%eax)
  ip->minor = minor;
80105d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d5c:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
80105d60:	66 89 50 14          	mov    %dx,0x14(%eax)
  ip->nlink = 1;
80105d64:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d67:	66 c7 40 16 01 00    	movw   $0x1,0x16(%eax)
  iupdate(ip);
80105d6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d70:	89 04 24             	mov    %eax,(%esp)
80105d73:	e8 37 b9 ff ff       	call   801016af <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80105d78:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80105d7d:	75 6a                	jne    80105de9 <create+0x184>
    dp->nlink++;  // for ".."
80105d7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d82:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105d86:	8d 50 01             	lea    0x1(%eax),%edx
80105d89:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d8c:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
80105d90:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d93:	89 04 24             	mov    %eax,(%esp)
80105d96:	e8 14 b9 ff ff       	call   801016af <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80105d9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105d9e:	8b 40 04             	mov    0x4(%eax),%eax
80105da1:	89 44 24 08          	mov    %eax,0x8(%esp)
80105da5:	c7 44 24 04 71 89 10 	movl   $0x80108971,0x4(%esp)
80105dac:	80 
80105dad:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105db0:	89 04 24             	mov    %eax,(%esp)
80105db3:	e8 9e c3 ff ff       	call   80102156 <dirlink>
80105db8:	85 c0                	test   %eax,%eax
80105dba:	78 21                	js     80105ddd <create+0x178>
80105dbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105dbf:	8b 40 04             	mov    0x4(%eax),%eax
80105dc2:	89 44 24 08          	mov    %eax,0x8(%esp)
80105dc6:	c7 44 24 04 73 89 10 	movl   $0x80108973,0x4(%esp)
80105dcd:	80 
80105dce:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105dd1:	89 04 24             	mov    %eax,(%esp)
80105dd4:	e8 7d c3 ff ff       	call   80102156 <dirlink>
80105dd9:	85 c0                	test   %eax,%eax
80105ddb:	79 0c                	jns    80105de9 <create+0x184>
      panic("create dots");
80105ddd:	c7 04 24 a6 89 10 80 	movl   $0x801089a6,(%esp)
80105de4:	e8 51 a7 ff ff       	call   8010053a <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
80105de9:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105dec:	8b 40 04             	mov    0x4(%eax),%eax
80105def:	89 44 24 08          	mov    %eax,0x8(%esp)
80105df3:	8d 45 de             	lea    -0x22(%ebp),%eax
80105df6:	89 44 24 04          	mov    %eax,0x4(%esp)
80105dfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105dfd:	89 04 24             	mov    %eax,(%esp)
80105e00:	e8 51 c3 ff ff       	call   80102156 <dirlink>
80105e05:	85 c0                	test   %eax,%eax
80105e07:	79 0c                	jns    80105e15 <create+0x1b0>
    panic("create: dirlink");
80105e09:	c7 04 24 b2 89 10 80 	movl   $0x801089b2,(%esp)
80105e10:	e8 25 a7 ff ff       	call   8010053a <panic>

  iunlockput(dp);
80105e15:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105e18:	89 04 24             	mov    %eax,(%esp)
80105e1b:	e8 d6 bc ff ff       	call   80101af6 <iunlockput>

  return ip;
80105e20:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80105e23:	c9                   	leave  
80105e24:	c3                   	ret    

80105e25 <sys_open>:

int
sys_open(void)
{
80105e25:	55                   	push   %ebp
80105e26:	89 e5                	mov    %esp,%ebp
80105e28:	83 ec 38             	sub    $0x38,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105e2b:	8d 45 e8             	lea    -0x18(%ebp),%eax
80105e2e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105e32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105e39:	e8 e1 f6 ff ff       	call   8010551f <argstr>
80105e3e:	85 c0                	test   %eax,%eax
80105e40:	78 17                	js     80105e59 <sys_open+0x34>
80105e42:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105e45:	89 44 24 04          	mov    %eax,0x4(%esp)
80105e49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105e50:	e8 39 f6 ff ff       	call   8010548e <argint>
80105e55:	85 c0                	test   %eax,%eax
80105e57:	79 0a                	jns    80105e63 <sys_open+0x3e>
    return -1;
80105e59:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105e5e:	e9 46 01 00 00       	jmp    80105fa9 <sys_open+0x184>
  if(omode & O_CREATE){
80105e63:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105e66:	25 00 02 00 00       	and    $0x200,%eax
80105e6b:	85 c0                	test   %eax,%eax
80105e6d:	74 40                	je     80105eaf <sys_open+0x8a>
    begin_trans();
80105e6f:	e8 92 d3 ff ff       	call   80103206 <begin_trans>
    ip = create(path, T_FILE, 0, 0);
80105e74:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105e77:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
80105e7e:	00 
80105e7f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80105e86:	00 
80105e87:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
80105e8e:	00 
80105e8f:	89 04 24             	mov    %eax,(%esp)
80105e92:	e8 ce fd ff ff       	call   80105c65 <create>
80105e97:	89 45 f4             	mov    %eax,-0xc(%ebp)
    commit_trans();
80105e9a:	e8 b0 d3 ff ff       	call   8010324f <commit_trans>
    if(ip == 0)
80105e9f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105ea3:	75 5c                	jne    80105f01 <sys_open+0xdc>
      return -1;
80105ea5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105eaa:	e9 fa 00 00 00       	jmp    80105fa9 <sys_open+0x184>
  } else {
    if((ip = namei(path)) == 0)
80105eaf:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105eb2:	89 04 24             	mov    %eax,(%esp)
80105eb5:	e8 5d c5 ff ff       	call   80102417 <namei>
80105eba:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105ebd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105ec1:	75 0a                	jne    80105ecd <sys_open+0xa8>
      return -1;
80105ec3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ec8:	e9 dc 00 00 00       	jmp    80105fa9 <sys_open+0x184>
    ilock(ip);
80105ecd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105ed0:	89 04 24             	mov    %eax,(%esp)
80105ed3:	e8 97 b9 ff ff       	call   8010186f <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105ed8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105edb:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105edf:	66 83 f8 01          	cmp    $0x1,%ax
80105ee3:	75 1c                	jne    80105f01 <sys_open+0xdc>
80105ee5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105ee8:	85 c0                	test   %eax,%eax
80105eea:	74 15                	je     80105f01 <sys_open+0xdc>
      iunlockput(ip);
80105eec:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105eef:	89 04 24             	mov    %eax,(%esp)
80105ef2:	e8 ff bb ff ff       	call   80101af6 <iunlockput>
      return -1;
80105ef7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105efc:	e9 a8 00 00 00       	jmp    80105fa9 <sys_open+0x184>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105f01:	e8 12 b0 ff ff       	call   80100f18 <filealloc>
80105f06:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105f09:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105f0d:	74 14                	je     80105f23 <sys_open+0xfe>
80105f0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105f12:	89 04 24             	mov    %eax,(%esp)
80105f15:	e8 43 f7 ff ff       	call   8010565d <fdalloc>
80105f1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
80105f1d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80105f21:	79 23                	jns    80105f46 <sys_open+0x121>
    if(f)
80105f23:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105f27:	74 0b                	je     80105f34 <sys_open+0x10f>
      fileclose(f);
80105f29:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105f2c:	89 04 24             	mov    %eax,(%esp)
80105f2f:	e8 8d b0 ff ff       	call   80100fc1 <fileclose>
    iunlockput(ip);
80105f34:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105f37:	89 04 24             	mov    %eax,(%esp)
80105f3a:	e8 b7 bb ff ff       	call   80101af6 <iunlockput>
    return -1;
80105f3f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105f44:	eb 63                	jmp    80105fa9 <sys_open+0x184>
  }
  iunlock(ip);
80105f46:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105f49:	89 04 24             	mov    %eax,(%esp)
80105f4c:	e8 6f ba ff ff       	call   801019c0 <iunlock>

  f->type = FD_INODE;
80105f51:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105f54:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  f->ip = ip;
80105f5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105f5d:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105f60:	89 50 10             	mov    %edx,0x10(%eax)
  f->off = 0;
80105f63:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105f66:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  f->readable = !(omode & O_WRONLY);
80105f6d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105f70:	83 e0 01             	and    $0x1,%eax
80105f73:	85 c0                	test   %eax,%eax
80105f75:	0f 94 c2             	sete   %dl
80105f78:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105f7b:	88 50 08             	mov    %dl,0x8(%eax)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105f7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105f81:	83 e0 01             	and    $0x1,%eax
80105f84:	84 c0                	test   %al,%al
80105f86:	75 0a                	jne    80105f92 <sys_open+0x16d>
80105f88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105f8b:	83 e0 02             	and    $0x2,%eax
80105f8e:	85 c0                	test   %eax,%eax
80105f90:	74 07                	je     80105f99 <sys_open+0x174>
80105f92:	b8 01 00 00 00       	mov    $0x1,%eax
80105f97:	eb 05                	jmp    80105f9e <sys_open+0x179>
80105f99:	b8 00 00 00 00       	mov    $0x0,%eax
80105f9e:	89 c2                	mov    %eax,%edx
80105fa0:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105fa3:	88 50 09             	mov    %dl,0x9(%eax)
  return fd;
80105fa6:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
80105fa9:	c9                   	leave  
80105faa:	c3                   	ret    

80105fab <sys_mkdir>:

int
sys_mkdir(void)
{
80105fab:	55                   	push   %ebp
80105fac:	89 e5                	mov    %esp,%ebp
80105fae:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  begin_trans();
80105fb1:	e8 50 d2 ff ff       	call   80103206 <begin_trans>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
80105fb6:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105fb9:	89 44 24 04          	mov    %eax,0x4(%esp)
80105fbd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105fc4:	e8 56 f5 ff ff       	call   8010551f <argstr>
80105fc9:	85 c0                	test   %eax,%eax
80105fcb:	78 2c                	js     80105ff9 <sys_mkdir+0x4e>
80105fcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105fd0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
80105fd7:	00 
80105fd8:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80105fdf:	00 
80105fe0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80105fe7:	00 
80105fe8:	89 04 24             	mov    %eax,(%esp)
80105feb:	e8 75 fc ff ff       	call   80105c65 <create>
80105ff0:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105ff3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105ff7:	75 0c                	jne    80106005 <sys_mkdir+0x5a>
    commit_trans();
80105ff9:	e8 51 d2 ff ff       	call   8010324f <commit_trans>
    return -1;
80105ffe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106003:	eb 15                	jmp    8010601a <sys_mkdir+0x6f>
  }
  iunlockput(ip);
80106005:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106008:	89 04 24             	mov    %eax,(%esp)
8010600b:	e8 e6 ba ff ff       	call   80101af6 <iunlockput>
  commit_trans();
80106010:	e8 3a d2 ff ff       	call   8010324f <commit_trans>
  return 0;
80106015:	b8 00 00 00 00       	mov    $0x0,%eax
}
8010601a:	c9                   	leave  
8010601b:	c3                   	ret    

8010601c <sys_mknod>:

int
sys_mknod(void)
{
8010601c:	55                   	push   %ebp
8010601d:	89 e5                	mov    %esp,%ebp
8010601f:	83 ec 38             	sub    $0x38,%esp
  struct inode *ip;
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
80106022:	e8 df d1 ff ff       	call   80103206 <begin_trans>
  if((len=argstr(0, &path)) < 0 ||
80106027:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010602a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010602e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106035:	e8 e5 f4 ff ff       	call   8010551f <argstr>
8010603a:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010603d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80106041:	78 5e                	js     801060a1 <sys_mknod+0x85>
     argint(1, &major) < 0 ||
80106043:	8d 45 e8             	lea    -0x18(%ebp),%eax
80106046:	89 44 24 04          	mov    %eax,0x4(%esp)
8010604a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80106051:	e8 38 f4 ff ff       	call   8010548e <argint>
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
80106056:	85 c0                	test   %eax,%eax
80106058:	78 47                	js     801060a1 <sys_mknod+0x85>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
8010605a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010605d:	89 44 24 04          	mov    %eax,0x4(%esp)
80106061:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80106068:	e8 21 f4 ff ff       	call   8010548e <argint>
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
8010606d:	85 c0                	test   %eax,%eax
8010606f:	78 30                	js     801060a1 <sys_mknod+0x85>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
80106071:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106074:	0f bf c8             	movswl %ax,%ecx
80106077:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010607a:	0f bf d0             	movswl %ax,%edx
8010607d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80106080:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
80106084:	89 54 24 08          	mov    %edx,0x8(%esp)
80106088:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
8010608f:	00 
80106090:	89 04 24             	mov    %eax,(%esp)
80106093:	e8 cd fb ff ff       	call   80105c65 <create>
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
80106098:	89 45 f0             	mov    %eax,-0x10(%ebp)
8010609b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010609f:	75 0c                	jne    801060ad <sys_mknod+0x91>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    commit_trans();
801060a1:	e8 a9 d1 ff ff       	call   8010324f <commit_trans>
    return -1;
801060a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801060ab:	eb 15                	jmp    801060c2 <sys_mknod+0xa6>
  }
  iunlockput(ip);
801060ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
801060b0:	89 04 24             	mov    %eax,(%esp)
801060b3:	e8 3e ba ff ff       	call   80101af6 <iunlockput>
  commit_trans();
801060b8:	e8 92 d1 ff ff       	call   8010324f <commit_trans>
  return 0;
801060bd:	b8 00 00 00 00       	mov    $0x0,%eax
}
801060c2:	c9                   	leave  
801060c3:	c3                   	ret    

801060c4 <sys_chdir>:

int
sys_chdir(void)
{
801060c4:	55                   	push   %ebp
801060c5:	89 e5                	mov    %esp,%ebp
801060c7:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0)
801060ca:	8d 45 f0             	lea    -0x10(%ebp),%eax
801060cd:	89 44 24 04          	mov    %eax,0x4(%esp)
801060d1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801060d8:	e8 42 f4 ff ff       	call   8010551f <argstr>
801060dd:	85 c0                	test   %eax,%eax
801060df:	78 14                	js     801060f5 <sys_chdir+0x31>
801060e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801060e4:	89 04 24             	mov    %eax,(%esp)
801060e7:	e8 2b c3 ff ff       	call   80102417 <namei>
801060ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
801060ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801060f3:	75 07                	jne    801060fc <sys_chdir+0x38>
    return -1;
801060f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801060fa:	eb 57                	jmp    80106153 <sys_chdir+0x8f>
  ilock(ip);
801060fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801060ff:	89 04 24             	mov    %eax,(%esp)
80106102:	e8 68 b7 ff ff       	call   8010186f <ilock>
  if(ip->type != T_DIR){
80106107:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010610a:	0f b7 40 10          	movzwl 0x10(%eax),%eax
8010610e:	66 83 f8 01          	cmp    $0x1,%ax
80106112:	74 12                	je     80106126 <sys_chdir+0x62>
    iunlockput(ip);
80106114:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106117:	89 04 24             	mov    %eax,(%esp)
8010611a:	e8 d7 b9 ff ff       	call   80101af6 <iunlockput>
    return -1;
8010611f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106124:	eb 2d                	jmp    80106153 <sys_chdir+0x8f>
  }
  iunlock(ip);
80106126:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106129:	89 04 24             	mov    %eax,(%esp)
8010612c:	e8 8f b8 ff ff       	call   801019c0 <iunlock>
  iput(proc->cwd);
80106131:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106137:	8b 40 68             	mov    0x68(%eax),%eax
8010613a:	89 04 24             	mov    %eax,(%esp)
8010613d:	e8 e3 b8 ff ff       	call   80101a25 <iput>
  proc->cwd = ip;
80106142:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106148:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010614b:	89 50 68             	mov    %edx,0x68(%eax)
  return 0;
8010614e:	b8 00 00 00 00       	mov    $0x0,%eax
}
80106153:	c9                   	leave  
80106154:	c3                   	ret    

80106155 <sys_exec>:

int
sys_exec(void)
{
80106155:	55                   	push   %ebp
80106156:	89 e5                	mov    %esp,%ebp
80106158:	81 ec a8 00 00 00    	sub    $0xa8,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
8010615e:	8d 45 f0             	lea    -0x10(%ebp),%eax
80106161:	89 44 24 04          	mov    %eax,0x4(%esp)
80106165:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010616c:	e8 ae f3 ff ff       	call   8010551f <argstr>
80106171:	85 c0                	test   %eax,%eax
80106173:	78 1a                	js     8010618f <sys_exec+0x3a>
80106175:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
8010617b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010617f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80106186:	e8 03 f3 ff ff       	call   8010548e <argint>
8010618b:	85 c0                	test   %eax,%eax
8010618d:	79 0a                	jns    80106199 <sys_exec+0x44>
    return -1;
8010618f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106194:	e9 cd 00 00 00       	jmp    80106266 <sys_exec+0x111>
  }
  memset(argv, 0, sizeof(argv));
80106199:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
801061a0:	00 
801061a1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801061a8:	00 
801061a9:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
801061af:	89 04 24             	mov    %eax,(%esp)
801061b2:	e8 7b ef ff ff       	call   80105132 <memset>
  for(i=0;; i++){
801061b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(i >= NELEM(argv))
801061be:	8b 45 f4             	mov    -0xc(%ebp),%eax
801061c1:	83 f8 1f             	cmp    $0x1f,%eax
801061c4:	76 0a                	jbe    801061d0 <sys_exec+0x7b>
      return -1;
801061c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801061cb:	e9 96 00 00 00       	jmp    80106266 <sys_exec+0x111>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801061d0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801061d6:	8b 55 f4             	mov    -0xc(%ebp),%edx
801061d9:	c1 e2 02             	shl    $0x2,%edx
801061dc:	89 d1                	mov    %edx,%ecx
801061de:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
801061e4:	8d 14 11             	lea    (%ecx,%edx,1),%edx
801061e7:	89 44 24 04          	mov    %eax,0x4(%esp)
801061eb:	89 14 24             	mov    %edx,(%esp)
801061ee:	e8 fd f1 ff ff       	call   801053f0 <fetchint>
801061f3:	85 c0                	test   %eax,%eax
801061f5:	79 07                	jns    801061fe <sys_exec+0xa9>
      return -1;
801061f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801061fc:	eb 68                	jmp    80106266 <sys_exec+0x111>
    if(uarg == 0){
801061fe:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
80106204:	85 c0                	test   %eax,%eax
80106206:	75 26                	jne    8010622e <sys_exec+0xd9>
      argv[i] = 0;
80106208:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010620b:	c7 84 85 70 ff ff ff 	movl   $0x0,-0x90(%ebp,%eax,4)
80106212:	00 00 00 00 
      break;
80106216:	90                   	nop
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80106217:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010621a:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
80106220:	89 54 24 04          	mov    %edx,0x4(%esp)
80106224:	89 04 24             	mov    %eax,(%esp)
80106227:	e8 cc a8 ff ff       	call   80100af8 <exec>
8010622c:	eb 38                	jmp    80106266 <sys_exec+0x111>
      return -1;
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
8010622e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106231:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
80106238:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
8010623e:	01 d0                	add    %edx,%eax
80106240:	8b 95 68 ff ff ff    	mov    -0x98(%ebp),%edx
80106246:	89 44 24 04          	mov    %eax,0x4(%esp)
8010624a:	89 14 24             	mov    %edx,(%esp)
8010624d:	e8 d8 f1 ff ff       	call   8010542a <fetchstr>
80106252:	85 c0                	test   %eax,%eax
80106254:	79 07                	jns    8010625d <sys_exec+0x108>
      return -1;
80106256:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010625b:	eb 09                	jmp    80106266 <sys_exec+0x111>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
8010625d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
80106261:	e9 58 ff ff ff       	jmp    801061be <sys_exec+0x69>
  return exec(path, argv);
}
80106266:	c9                   	leave  
80106267:	c3                   	ret    

80106268 <sys_pipe>:

int
sys_pipe(void)
{
80106268:	55                   	push   %ebp
80106269:	89 e5                	mov    %esp,%ebp
8010626b:	83 ec 38             	sub    $0x38,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010626e:	8d 45 ec             	lea    -0x14(%ebp),%eax
80106271:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
80106278:	00 
80106279:	89 44 24 04          	mov    %eax,0x4(%esp)
8010627d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106284:	e8 34 f2 ff ff       	call   801054bd <argptr>
80106289:	85 c0                	test   %eax,%eax
8010628b:	79 0a                	jns    80106297 <sys_pipe+0x2f>
    return -1;
8010628d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106292:	e9 9b 00 00 00       	jmp    80106332 <sys_pipe+0xca>
  if(pipealloc(&rf, &wf) < 0)
80106297:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010629a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010629e:	8d 45 e8             	lea    -0x18(%ebp),%eax
801062a1:	89 04 24             	mov    %eax,(%esp)
801062a4:	e8 4f d9 ff ff       	call   80103bf8 <pipealloc>
801062a9:	85 c0                	test   %eax,%eax
801062ab:	79 07                	jns    801062b4 <sys_pipe+0x4c>
    return -1;
801062ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801062b2:	eb 7e                	jmp    80106332 <sys_pipe+0xca>
  fd0 = -1;
801062b4:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801062bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
801062be:	89 04 24             	mov    %eax,(%esp)
801062c1:	e8 97 f3 ff ff       	call   8010565d <fdalloc>
801062c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
801062c9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801062cd:	78 14                	js     801062e3 <sys_pipe+0x7b>
801062cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801062d2:	89 04 24             	mov    %eax,(%esp)
801062d5:	e8 83 f3 ff ff       	call   8010565d <fdalloc>
801062da:	89 45 f4             	mov    %eax,-0xc(%ebp)
801062dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801062e1:	79 37                	jns    8010631a <sys_pipe+0xb2>
    if(fd0 >= 0)
801062e3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801062e7:	78 14                	js     801062fd <sys_pipe+0x95>
      proc->ofile[fd0] = 0;
801062e9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801062ef:	8b 55 f0             	mov    -0x10(%ebp),%edx
801062f2:	83 c2 08             	add    $0x8,%edx
801062f5:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
801062fc:	00 
    fileclose(rf);
801062fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
80106300:	89 04 24             	mov    %eax,(%esp)
80106303:	e8 b9 ac ff ff       	call   80100fc1 <fileclose>
    fileclose(wf);
80106308:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010630b:	89 04 24             	mov    %eax,(%esp)
8010630e:	e8 ae ac ff ff       	call   80100fc1 <fileclose>
    return -1;
80106313:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106318:	eb 18                	jmp    80106332 <sys_pipe+0xca>
  }
  fd[0] = fd0;
8010631a:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010631d:	8b 55 f0             	mov    -0x10(%ebp),%edx
80106320:	89 10                	mov    %edx,(%eax)
  fd[1] = fd1;
80106322:	8b 45 ec             	mov    -0x14(%ebp),%eax
80106325:	8d 50 04             	lea    0x4(%eax),%edx
80106328:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010632b:	89 02                	mov    %eax,(%edx)
  return 0;
8010632d:	b8 00 00 00 00       	mov    $0x0,%eax
}
80106332:	c9                   	leave  
80106333:	c3                   	ret    

80106334 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80106334:	55                   	push   %ebp
80106335:	89 e5                	mov    %esp,%ebp
80106337:	83 ec 08             	sub    $0x8,%esp
  return fork();
8010633a:	e8 6b df ff ff       	call   801042aa <fork>
}
8010633f:	c9                   	leave  
80106340:	c3                   	ret    

80106341 <sys_exit>:

int
sys_exit(void)
{
80106341:	55                   	push   %ebp
80106342:	89 e5                	mov    %esp,%ebp
80106344:	83 ec 08             	sub    $0x8,%esp
  exit();
80106347:	e8 ce e0 ff ff       	call   8010441a <exit>
  return 0;  // not reached
8010634c:	b8 00 00 00 00       	mov    $0x0,%eax
} 
80106351:	c9                   	leave  
80106352:	c3                   	ret    

80106353 <sys_exit1>:

int
sys_exit1(void) 
{
80106353:	55                   	push   %ebp
80106354:	89 e5                	mov    %esp,%ebp
80106356:	83 ec 28             	sub    $0x28,%esp
  int status; 
  if(argint(0, &status) < 0) 
80106359:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010635c:	89 44 24 04          	mov    %eax,0x4(%esp)
80106360:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106367:	e8 22 f1 ff ff       	call   8010548e <argint>
8010636c:	85 c0                	test   %eax,%eax
8010636e:	79 07                	jns    80106377 <sys_exit1+0x24>
	return -1; 
80106370:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106375:	eb 10                	jmp    80106387 <sys_exit1+0x34>
  
 exit1(status); 
80106377:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010637a:	89 04 24             	mov    %eax,(%esp)
8010637d:	e8 b4 e1 ff ff       	call   80104536 <exit1>
 return 0; 
80106382:	b8 00 00 00 00       	mov    $0x0,%eax
} //added
80106387:	c9                   	leave  
80106388:	c3                   	ret    

80106389 <sys_wait>:

int
sys_wait(void)
{
80106389:	55                   	push   %ebp
8010638a:	89 e5                	mov    %esp,%ebp
8010638c:	83 ec 08             	sub    $0x8,%esp
  return wait();
8010638f:	e8 26 e3 ff ff       	call   801046ba <wait>
} 
80106394:	c9                   	leave  
80106395:	c3                   	ret    

80106396 <sys_wait1>:

int
sys_wait1(void)
{
80106396:	55                   	push   %ebp
80106397:	89 e5                	mov    %esp,%ebp
80106399:	83 ec 28             	sub    $0x28,%esp
  char* tmp;
  int *status;
  if(argptr(0, &tmp, 4))
8010639c:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
801063a3:	00 
801063a4:	8d 45 f0             	lea    -0x10(%ebp),%eax
801063a7:	89 44 24 04          	mov    %eax,0x4(%esp)
801063ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801063b2:	e8 06 f1 ff ff       	call   801054bd <argptr>
801063b7:	85 c0                	test   %eax,%eax
801063b9:	74 06                	je     801063c1 <sys_wait1+0x2b>
  {
  	status = (int*)tmp;
801063bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
801063be:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return wait1(status);
801063c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801063c4:	89 04 24             	mov    %eax,(%esp)
801063c7:	e8 01 e4 ff ff       	call   801047cd <wait1>
} //added
801063cc:	c9                   	leave  
801063cd:	c3                   	ret    

801063ce <sys_waitpid>:

int
sys_waitpid(void) 
{
801063ce:	55                   	push   %ebp
801063cf:	89 e5                	mov    %esp,%ebp
801063d1:	83 ec 28             	sub    $0x28,%esp
 char *tmp; 
 int *status;
 int pid; 
 int options; 
 if(argint(0, &pid) < 0) 
801063d4:	8d 45 ec             	lea    -0x14(%ebp),%eax
801063d7:	89 44 24 04          	mov    %eax,0x4(%esp)
801063db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801063e2:	e8 a7 f0 ff ff       	call   8010548e <argint>
801063e7:	85 c0                	test   %eax,%eax
801063e9:	79 07                	jns    801063f2 <sys_waitpid+0x24>
 {
	return -1; 
801063eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801063f0:	eb 58                	jmp    8010644a <sys_waitpid+0x7c>
 } 
 if(argptr(1, &tmp, 4) < 0);  
801063f2:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
801063f9:	00 
801063fa:	8d 45 f0             	lea    -0x10(%ebp),%eax
801063fd:	89 44 24 04          	mov    %eax,0x4(%esp)
80106401:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80106408:	e8 b0 f0 ff ff       	call   801054bd <argptr>
 
	status = (int*) tmp;  
8010640d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80106410:	89 45 f4             	mov    %eax,-0xc(%ebp)
 if(argint(2, &options) < 0)
80106413:	8d 45 e8             	lea    -0x18(%ebp),%eax
80106416:	89 44 24 04          	mov    %eax,0x4(%esp)
8010641a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80106421:	e8 68 f0 ff ff       	call   8010548e <argint>
80106426:	85 c0                	test   %eax,%eax
80106428:	79 07                	jns    80106431 <sys_waitpid+0x63>
 {
	return -1; 
8010642a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010642f:	eb 19                	jmp    8010644a <sys_waitpid+0x7c>
 } 
 return waitpid(pid, status, options);  
80106431:	8b 55 e8             	mov    -0x18(%ebp),%edx
80106434:	8b 45 ec             	mov    -0x14(%ebp),%eax
80106437:	89 54 24 08          	mov    %edx,0x8(%esp)
8010643b:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010643e:	89 54 24 04          	mov    %edx,0x4(%esp)
80106442:	89 04 24             	mov    %eax,(%esp)
80106445:	e8 96 e4 ff ff       	call   801048e0 <waitpid>
} //added 
8010644a:	c9                   	leave  
8010644b:	c3                   	ret    

8010644c <sys_kill>:

int
sys_kill(void)
{
8010644c:	55                   	push   %ebp
8010644d:	89 e5                	mov    %esp,%ebp
8010644f:	83 ec 28             	sub    $0x28,%esp
  int pid;

  if(argint(0, &pid) < 0)
80106452:	8d 45 f4             	lea    -0xc(%ebp),%eax
80106455:	89 44 24 04          	mov    %eax,0x4(%esp)
80106459:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106460:	e8 29 f0 ff ff       	call   8010548e <argint>
80106465:	85 c0                	test   %eax,%eax
80106467:	79 07                	jns    80106470 <sys_kill+0x24>
    return -1;
80106469:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010646e:	eb 0b                	jmp    8010647b <sys_kill+0x2f>
  return kill(pid);
80106470:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106473:	89 04 24             	mov    %eax,(%esp)
80106476:	e8 96 e8 ff ff       	call   80104d11 <kill>
}
8010647b:	c9                   	leave  
8010647c:	c3                   	ret    

8010647d <sys_getpid>:

int
sys_getpid(void)
{
8010647d:	55                   	push   %ebp
8010647e:	89 e5                	mov    %esp,%ebp
  return proc->pid;
80106480:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106486:	8b 40 10             	mov    0x10(%eax),%eax
}
80106489:	5d                   	pop    %ebp
8010648a:	c3                   	ret    

8010648b <sys_sbrk>:

int
sys_sbrk(void)
{
8010648b:	55                   	push   %ebp
8010648c:	89 e5                	mov    %esp,%ebp
8010648e:	83 ec 28             	sub    $0x28,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
80106491:	8d 45 f0             	lea    -0x10(%ebp),%eax
80106494:	89 44 24 04          	mov    %eax,0x4(%esp)
80106498:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010649f:	e8 ea ef ff ff       	call   8010548e <argint>
801064a4:	85 c0                	test   %eax,%eax
801064a6:	79 07                	jns    801064af <sys_sbrk+0x24>
    return -1;
801064a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801064ad:	eb 24                	jmp    801064d3 <sys_sbrk+0x48>
  addr = proc->sz;
801064af:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801064b5:	8b 00                	mov    (%eax),%eax
801064b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(growproc(n) < 0)
801064ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
801064bd:	89 04 24             	mov    %eax,(%esp)
801064c0:	e8 40 dd ff ff       	call   80104205 <growproc>
801064c5:	85 c0                	test   %eax,%eax
801064c7:	79 07                	jns    801064d0 <sys_sbrk+0x45>
    return -1;
801064c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801064ce:	eb 03                	jmp    801064d3 <sys_sbrk+0x48>
  return addr;
801064d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
801064d3:	c9                   	leave  
801064d4:	c3                   	ret    

801064d5 <sys_sleep>:

int
sys_sleep(void)
{
801064d5:	55                   	push   %ebp
801064d6:	89 e5                	mov    %esp,%ebp
801064d8:	83 ec 28             	sub    $0x28,%esp
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
801064db:	8d 45 f0             	lea    -0x10(%ebp),%eax
801064de:	89 44 24 04          	mov    %eax,0x4(%esp)
801064e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801064e9:	e8 a0 ef ff ff       	call   8010548e <argint>
801064ee:	85 c0                	test   %eax,%eax
801064f0:	79 07                	jns    801064f9 <sys_sleep+0x24>
    return -1;
801064f2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801064f7:	eb 6c                	jmp    80106565 <sys_sleep+0x90>
  acquire(&tickslock);
801064f9:	c7 04 24 80 84 11 80 	movl   $0x80118480,(%esp)
80106500:	e8 de e9 ff ff       	call   80104ee3 <acquire>
  ticks0 = ticks;
80106505:	a1 c0 8c 11 80       	mov    0x80118cc0,%eax
8010650a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(ticks - ticks0 < n){
8010650d:	eb 34                	jmp    80106543 <sys_sleep+0x6e>
    if(proc->killed){
8010650f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106515:	8b 40 24             	mov    0x24(%eax),%eax
80106518:	85 c0                	test   %eax,%eax
8010651a:	74 13                	je     8010652f <sys_sleep+0x5a>
      release(&tickslock);
8010651c:	c7 04 24 80 84 11 80 	movl   $0x80118480,(%esp)
80106523:	e8 1c ea ff ff       	call   80104f44 <release>
      return -1;
80106528:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010652d:	eb 36                	jmp    80106565 <sys_sleep+0x90>
    }
    sleep(&ticks, &tickslock);
8010652f:	c7 44 24 04 80 84 11 	movl   $0x80118480,0x4(%esp)
80106536:	80 
80106537:	c7 04 24 c0 8c 11 80 	movl   $0x80118cc0,(%esp)
8010653e:	e8 c6 e6 ff ff       	call   80104c09 <sleep>
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80106543:	a1 c0 8c 11 80       	mov    0x80118cc0,%eax
80106548:	89 c2                	mov    %eax,%edx
8010654a:	2b 55 f4             	sub    -0xc(%ebp),%edx
8010654d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80106550:	39 c2                	cmp    %eax,%edx
80106552:	72 bb                	jb     8010650f <sys_sleep+0x3a>
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80106554:	c7 04 24 80 84 11 80 	movl   $0x80118480,(%esp)
8010655b:	e8 e4 e9 ff ff       	call   80104f44 <release>
  return 0;
80106560:	b8 00 00 00 00       	mov    $0x0,%eax
}
80106565:	c9                   	leave  
80106566:	c3                   	ret    

80106567 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80106567:	55                   	push   %ebp
80106568:	89 e5                	mov    %esp,%ebp
8010656a:	83 ec 28             	sub    $0x28,%esp
  uint xticks;
  
  acquire(&tickslock);
8010656d:	c7 04 24 80 84 11 80 	movl   $0x80118480,(%esp)
80106574:	e8 6a e9 ff ff       	call   80104ee3 <acquire>
  xticks = ticks;
80106579:	a1 c0 8c 11 80       	mov    0x80118cc0,%eax
8010657e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  release(&tickslock);
80106581:	c7 04 24 80 84 11 80 	movl   $0x80118480,(%esp)
80106588:	e8 b7 e9 ff ff       	call   80104f44 <release>
  return xticks;
8010658d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80106590:	c9                   	leave  
80106591:	c3                   	ret    
	...

80106594 <outb>:
80106594:	55                   	push   %ebp
80106595:	89 e5                	mov    %esp,%ebp
80106597:	83 ec 08             	sub    $0x8,%esp
8010659a:	8b 55 08             	mov    0x8(%ebp),%edx
8010659d:	8b 45 0c             	mov    0xc(%ebp),%eax
801065a0:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
801065a4:	88 45 f8             	mov    %al,-0x8(%ebp)
801065a7:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
801065ab:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
801065af:	ee                   	out    %al,(%dx)
801065b0:	c9                   	leave  
801065b1:	c3                   	ret    

801065b2 <timerinit>:
801065b2:	55                   	push   %ebp
801065b3:	89 e5                	mov    %esp,%ebp
801065b5:	83 ec 18             	sub    $0x18,%esp
801065b8:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
801065bf:	00 
801065c0:	c7 04 24 43 00 00 00 	movl   $0x43,(%esp)
801065c7:	e8 c8 ff ff ff       	call   80106594 <outb>
801065cc:	c7 44 24 04 9c 00 00 	movl   $0x9c,0x4(%esp)
801065d3:	00 
801065d4:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
801065db:	e8 b4 ff ff ff       	call   80106594 <outb>
801065e0:	c7 44 24 04 2e 00 00 	movl   $0x2e,0x4(%esp)
801065e7:	00 
801065e8:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
801065ef:	e8 a0 ff ff ff       	call   80106594 <outb>
801065f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801065fb:	e8 81 d4 ff ff       	call   80103a81 <picenable>
80106600:	c9                   	leave  
80106601:	c3                   	ret    
	...

80106604 <alltraps>:
80106604:	1e                   	push   %ds
80106605:	06                   	push   %es
80106606:	0f a0                	push   %fs
80106608:	0f a8                	push   %gs
8010660a:	60                   	pusha  
8010660b:	66 b8 10 00          	mov    $0x10,%ax
8010660f:	8e d8                	mov    %eax,%ds
80106611:	8e c0                	mov    %eax,%es
80106613:	66 b8 18 00          	mov    $0x18,%ax
80106617:	8e e0                	mov    %eax,%fs
80106619:	8e e8                	mov    %eax,%gs
8010661b:	54                   	push   %esp
8010661c:	e8 d5 01 00 00       	call   801067f6 <trap>
80106621:	83 c4 04             	add    $0x4,%esp

80106624 <trapret>:
80106624:	61                   	popa   
80106625:	0f a9                	pop    %gs
80106627:	0f a1                	pop    %fs
80106629:	07                   	pop    %es
8010662a:	1f                   	pop    %ds
8010662b:	83 c4 08             	add    $0x8,%esp
8010662e:	cf                   	iret   
	...

80106630 <lidt>:

struct gatedesc;

static inline void
lidt(struct gatedesc *p, int size)
{
80106630:	55                   	push   %ebp
80106631:	89 e5                	mov    %esp,%ebp
80106633:	83 ec 10             	sub    $0x10,%esp
  volatile ushort pd[3];

  pd[0] = size-1;
80106636:	8b 45 0c             	mov    0xc(%ebp),%eax
80106639:	83 e8 01             	sub    $0x1,%eax
8010663c:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80106640:	8b 45 08             	mov    0x8(%ebp),%eax
80106643:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80106647:	8b 45 08             	mov    0x8(%ebp),%eax
8010664a:	c1 e8 10             	shr    $0x10,%eax
8010664d:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
80106651:	8d 45 fa             	lea    -0x6(%ebp),%eax
80106654:	0f 01 18             	lidtl  (%eax)
}
80106657:	c9                   	leave  
80106658:	c3                   	ret    

80106659 <rcr2>:
  return result;
}

static inline uint
rcr2(void)
{
80106659:	55                   	push   %ebp
8010665a:	89 e5                	mov    %esp,%ebp
8010665c:	83 ec 10             	sub    $0x10,%esp
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
8010665f:	0f 20 d0             	mov    %cr2,%eax
80106662:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return val;
80106665:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80106668:	c9                   	leave  
80106669:	c3                   	ret    

8010666a <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
8010666a:	55                   	push   %ebp
8010666b:	89 e5                	mov    %esp,%ebp
8010666d:	83 ec 28             	sub    $0x28,%esp
  int i;

  for(i = 0; i < 256; i++)
80106670:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80106677:	e9 bf 00 00 00       	jmp    8010673b <tvinit+0xd1>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
8010667c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010667f:	8b 55 f4             	mov    -0xc(%ebp),%edx
80106682:	8b 14 95 a4 b0 10 80 	mov    -0x7fef4f5c(,%edx,4),%edx
80106689:	66 89 14 c5 c0 84 11 	mov    %dx,-0x7fee7b40(,%eax,8)
80106690:	80 
80106691:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106694:	66 c7 04 c5 c2 84 11 	movw   $0x8,-0x7fee7b3e(,%eax,8)
8010669b:	80 08 00 
8010669e:	8b 45 f4             	mov    -0xc(%ebp),%eax
801066a1:	0f b6 14 c5 c4 84 11 	movzbl -0x7fee7b3c(,%eax,8),%edx
801066a8:	80 
801066a9:	83 e2 e0             	and    $0xffffffe0,%edx
801066ac:	88 14 c5 c4 84 11 80 	mov    %dl,-0x7fee7b3c(,%eax,8)
801066b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801066b6:	0f b6 14 c5 c4 84 11 	movzbl -0x7fee7b3c(,%eax,8),%edx
801066bd:	80 
801066be:	83 e2 1f             	and    $0x1f,%edx
801066c1:	88 14 c5 c4 84 11 80 	mov    %dl,-0x7fee7b3c(,%eax,8)
801066c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801066cb:	0f b6 14 c5 c5 84 11 	movzbl -0x7fee7b3b(,%eax,8),%edx
801066d2:	80 
801066d3:	83 e2 f0             	and    $0xfffffff0,%edx
801066d6:	83 ca 0e             	or     $0xe,%edx
801066d9:	88 14 c5 c5 84 11 80 	mov    %dl,-0x7fee7b3b(,%eax,8)
801066e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801066e3:	0f b6 14 c5 c5 84 11 	movzbl -0x7fee7b3b(,%eax,8),%edx
801066ea:	80 
801066eb:	83 e2 ef             	and    $0xffffffef,%edx
801066ee:	88 14 c5 c5 84 11 80 	mov    %dl,-0x7fee7b3b(,%eax,8)
801066f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801066f8:	0f b6 14 c5 c5 84 11 	movzbl -0x7fee7b3b(,%eax,8),%edx
801066ff:	80 
80106700:	83 e2 9f             	and    $0xffffff9f,%edx
80106703:	88 14 c5 c5 84 11 80 	mov    %dl,-0x7fee7b3b(,%eax,8)
8010670a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010670d:	0f b6 14 c5 c5 84 11 	movzbl -0x7fee7b3b(,%eax,8),%edx
80106714:	80 
80106715:	83 ca 80             	or     $0xffffff80,%edx
80106718:	88 14 c5 c5 84 11 80 	mov    %dl,-0x7fee7b3b(,%eax,8)
8010671f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106722:	8b 55 f4             	mov    -0xc(%ebp),%edx
80106725:	8b 14 95 a4 b0 10 80 	mov    -0x7fef4f5c(,%edx,4),%edx
8010672c:	c1 ea 10             	shr    $0x10,%edx
8010672f:	66 89 14 c5 c6 84 11 	mov    %dx,-0x7fee7b3a(,%eax,8)
80106736:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80106737:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
8010673b:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
80106742:	0f 8e 34 ff ff ff    	jle    8010667c <tvinit+0x12>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80106748:	a1 a4 b1 10 80       	mov    0x8010b1a4,%eax
8010674d:	66 a3 c0 86 11 80    	mov    %ax,0x801186c0
80106753:	66 c7 05 c2 86 11 80 	movw   $0x8,0x801186c2
8010675a:	08 00 
8010675c:	0f b6 05 c4 86 11 80 	movzbl 0x801186c4,%eax
80106763:	83 e0 e0             	and    $0xffffffe0,%eax
80106766:	a2 c4 86 11 80       	mov    %al,0x801186c4
8010676b:	0f b6 05 c4 86 11 80 	movzbl 0x801186c4,%eax
80106772:	83 e0 1f             	and    $0x1f,%eax
80106775:	a2 c4 86 11 80       	mov    %al,0x801186c4
8010677a:	0f b6 05 c5 86 11 80 	movzbl 0x801186c5,%eax
80106781:	83 c8 0f             	or     $0xf,%eax
80106784:	a2 c5 86 11 80       	mov    %al,0x801186c5
80106789:	0f b6 05 c5 86 11 80 	movzbl 0x801186c5,%eax
80106790:	83 e0 ef             	and    $0xffffffef,%eax
80106793:	a2 c5 86 11 80       	mov    %al,0x801186c5
80106798:	0f b6 05 c5 86 11 80 	movzbl 0x801186c5,%eax
8010679f:	83 c8 60             	or     $0x60,%eax
801067a2:	a2 c5 86 11 80       	mov    %al,0x801186c5
801067a7:	0f b6 05 c5 86 11 80 	movzbl 0x801186c5,%eax
801067ae:	83 c8 80             	or     $0xffffff80,%eax
801067b1:	a2 c5 86 11 80       	mov    %al,0x801186c5
801067b6:	a1 a4 b1 10 80       	mov    0x8010b1a4,%eax
801067bb:	c1 e8 10             	shr    $0x10,%eax
801067be:	66 a3 c6 86 11 80    	mov    %ax,0x801186c6
  
  initlock(&tickslock, "time");
801067c4:	c7 44 24 04 c4 89 10 	movl   $0x801089c4,0x4(%esp)
801067cb:	80 
801067cc:	c7 04 24 80 84 11 80 	movl   $0x80118480,(%esp)
801067d3:	e8 ea e6 ff ff       	call   80104ec2 <initlock>
}
801067d8:	c9                   	leave  
801067d9:	c3                   	ret    

801067da <idtinit>:

void
idtinit(void)
{
801067da:	55                   	push   %ebp
801067db:	89 e5                	mov    %esp,%ebp
801067dd:	83 ec 08             	sub    $0x8,%esp
  lidt(idt, sizeof(idt));
801067e0:	c7 44 24 04 00 08 00 	movl   $0x800,0x4(%esp)
801067e7:	00 
801067e8:	c7 04 24 c0 84 11 80 	movl   $0x801184c0,(%esp)
801067ef:	e8 3c fe ff ff       	call   80106630 <lidt>
}
801067f4:	c9                   	leave  
801067f5:	c3                   	ret    

801067f6 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
801067f6:	55                   	push   %ebp
801067f7:	89 e5                	mov    %esp,%ebp
801067f9:	57                   	push   %edi
801067fa:	56                   	push   %esi
801067fb:	53                   	push   %ebx
801067fc:	83 ec 3c             	sub    $0x3c,%esp
  if(tf->trapno == T_SYSCALL){
801067ff:	8b 45 08             	mov    0x8(%ebp),%eax
80106802:	8b 40 30             	mov    0x30(%eax),%eax
80106805:	83 f8 40             	cmp    $0x40,%eax
80106808:	75 3e                	jne    80106848 <trap+0x52>
    if(proc->killed)
8010680a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106810:	8b 40 24             	mov    0x24(%eax),%eax
80106813:	85 c0                	test   %eax,%eax
80106815:	74 05                	je     8010681c <trap+0x26>
      exit();
80106817:	e8 fe db ff ff       	call   8010441a <exit>
    proc->tf = tf;
8010681c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106822:	8b 55 08             	mov    0x8(%ebp),%edx
80106825:	89 50 18             	mov    %edx,0x18(%eax)
    syscall();
80106828:	e8 29 ed ff ff       	call   80105556 <syscall>
    if(proc->killed)
8010682d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106833:	8b 40 24             	mov    0x24(%eax),%eax
80106836:	85 c0                	test   %eax,%eax
80106838:	0f 84 34 02 00 00    	je     80106a72 <trap+0x27c>
      exit();
8010683e:	e8 d7 db ff ff       	call   8010441a <exit>
    return;
80106843:	e9 2b 02 00 00       	jmp    80106a73 <trap+0x27d>
  }

  switch(tf->trapno){
80106848:	8b 45 08             	mov    0x8(%ebp),%eax
8010684b:	8b 40 30             	mov    0x30(%eax),%eax
8010684e:	83 e8 20             	sub    $0x20,%eax
80106851:	83 f8 1f             	cmp    $0x1f,%eax
80106854:	0f 87 bc 00 00 00    	ja     80106916 <trap+0x120>
8010685a:	8b 04 85 6c 8a 10 80 	mov    -0x7fef7594(,%eax,4),%eax
80106861:	ff e0                	jmp    *%eax
  case T_IRQ0 + IRQ_TIMER:
    if(cpu->id == 0){
80106863:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106869:	0f b6 00             	movzbl (%eax),%eax
8010686c:	84 c0                	test   %al,%al
8010686e:	75 31                	jne    801068a1 <trap+0xab>
      acquire(&tickslock);
80106870:	c7 04 24 80 84 11 80 	movl   $0x80118480,(%esp)
80106877:	e8 67 e6 ff ff       	call   80104ee3 <acquire>
      ticks++;
8010687c:	a1 c0 8c 11 80       	mov    0x80118cc0,%eax
80106881:	83 c0 01             	add    $0x1,%eax
80106884:	a3 c0 8c 11 80       	mov    %eax,0x80118cc0
      wakeup(&ticks);
80106889:	c7 04 24 c0 8c 11 80 	movl   $0x80118cc0,(%esp)
80106890:	e8 51 e4 ff ff       	call   80104ce6 <wakeup>
      release(&tickslock);
80106895:	c7 04 24 80 84 11 80 	movl   $0x80118480,(%esp)
8010689c:	e8 a3 e6 ff ff       	call   80104f44 <release>
    }
    lapiceoi();
801068a1:	e8 2e c6 ff ff       	call   80102ed4 <lapiceoi>
    break;
801068a6:	e9 41 01 00 00       	jmp    801069ec <trap+0x1f6>
  case T_IRQ0 + IRQ_IDE:
    ideintr();
801068ab:	e8 3f be ff ff       	call   801026ef <ideintr>
    lapiceoi();
801068b0:	e8 1f c6 ff ff       	call   80102ed4 <lapiceoi>
    break;
801068b5:	e9 32 01 00 00       	jmp    801069ec <trap+0x1f6>
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
801068ba:	e8 f8 c3 ff ff       	call   80102cb7 <kbdintr>
    lapiceoi();
801068bf:	e8 10 c6 ff ff       	call   80102ed4 <lapiceoi>
    break;
801068c4:	e9 23 01 00 00       	jmp    801069ec <trap+0x1f6>
  case T_IRQ0 + IRQ_COM1:
    uartintr();
801068c9:	e8 9d 03 00 00       	call   80106c6b <uartintr>
    lapiceoi();
801068ce:	e8 01 c6 ff ff       	call   80102ed4 <lapiceoi>
    break;
801068d3:	e9 14 01 00 00       	jmp    801069ec <trap+0x1f6>
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
801068d8:	8b 45 08             	mov    0x8(%ebp),%eax
801068db:	8b 48 38             	mov    0x38(%eax),%ecx
            cpu->id, tf->cs, tf->eip);
801068de:	8b 45 08             	mov    0x8(%ebp),%eax
801068e1:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
801068e5:	0f b7 d0             	movzwl %ax,%edx
            cpu->id, tf->cs, tf->eip);
801068e8:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801068ee:	0f b6 00             	movzbl (%eax),%eax
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
801068f1:	0f b6 c0             	movzbl %al,%eax
801068f4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
801068f8:	89 54 24 08          	mov    %edx,0x8(%esp)
801068fc:	89 44 24 04          	mov    %eax,0x4(%esp)
80106900:	c7 04 24 cc 89 10 80 	movl   $0x801089cc,(%esp)
80106907:	e8 8e 9a ff ff       	call   8010039a <cprintf>
            cpu->id, tf->cs, tf->eip);
    lapiceoi();
8010690c:	e8 c3 c5 ff ff       	call   80102ed4 <lapiceoi>
    break;
80106911:	e9 d6 00 00 00       	jmp    801069ec <trap+0x1f6>
   
  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80106916:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010691c:	85 c0                	test   %eax,%eax
8010691e:	74 11                	je     80106931 <trap+0x13b>
80106920:	8b 45 08             	mov    0x8(%ebp),%eax
80106923:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
80106927:	0f b7 c0             	movzwl %ax,%eax
8010692a:	83 e0 03             	and    $0x3,%eax
8010692d:	85 c0                	test   %eax,%eax
8010692f:	75 46                	jne    80106977 <trap+0x181>
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80106931:	e8 23 fd ff ff       	call   80106659 <rcr2>
80106936:	8b 55 08             	mov    0x8(%ebp),%edx
80106939:	8b 5a 38             	mov    0x38(%edx),%ebx
              tf->trapno, cpu->id, tf->eip, rcr2());
8010693c:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80106943:	0f b6 12             	movzbl (%edx),%edx
   
  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80106946:	0f b6 ca             	movzbl %dl,%ecx
80106949:	8b 55 08             	mov    0x8(%ebp),%edx
8010694c:	8b 52 30             	mov    0x30(%edx),%edx
8010694f:	89 44 24 10          	mov    %eax,0x10(%esp)
80106953:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
80106957:	89 4c 24 08          	mov    %ecx,0x8(%esp)
8010695b:	89 54 24 04          	mov    %edx,0x4(%esp)
8010695f:	c7 04 24 f0 89 10 80 	movl   $0x801089f0,(%esp)
80106966:	e8 2f 9a ff ff       	call   8010039a <cprintf>
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
8010696b:	c7 04 24 22 8a 10 80 	movl   $0x80108a22,(%esp)
80106972:	e8 c3 9b ff ff       	call   8010053a <panic>
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80106977:	e8 dd fc ff ff       	call   80106659 <rcr2>
8010697c:	89 c2                	mov    %eax,%edx
8010697e:	8b 45 08             	mov    0x8(%ebp),%eax
80106981:	8b 78 38             	mov    0x38(%eax),%edi
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
80106984:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010698a:	0f b6 00             	movzbl (%eax),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010698d:	0f b6 f0             	movzbl %al,%esi
80106990:	8b 45 08             	mov    0x8(%ebp),%eax
80106993:	8b 58 34             	mov    0x34(%eax),%ebx
80106996:	8b 45 08             	mov    0x8(%ebp),%eax
80106999:	8b 48 30             	mov    0x30(%eax),%ecx
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
8010699c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801069a2:	83 c0 6c             	add    $0x6c,%eax
801069a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
801069a8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801069ae:	8b 40 10             	mov    0x10(%eax),%eax
801069b1:	89 54 24 1c          	mov    %edx,0x1c(%esp)
801069b5:	89 7c 24 18          	mov    %edi,0x18(%esp)
801069b9:	89 74 24 14          	mov    %esi,0x14(%esp)
801069bd:	89 5c 24 10          	mov    %ebx,0x10(%esp)
801069c1:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
801069c5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801069c8:	89 54 24 08          	mov    %edx,0x8(%esp)
801069cc:	89 44 24 04          	mov    %eax,0x4(%esp)
801069d0:	c7 04 24 28 8a 10 80 	movl   $0x80108a28,(%esp)
801069d7:	e8 be 99 ff ff       	call   8010039a <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
            rcr2());
    proc->killed = 1;
801069dc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801069e2:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801069e9:	eb 01                	jmp    801069ec <trap+0x1f6>
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
801069eb:	90                   	nop
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running 
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801069ec:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801069f2:	85 c0                	test   %eax,%eax
801069f4:	74 24                	je     80106a1a <trap+0x224>
801069f6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801069fc:	8b 40 24             	mov    0x24(%eax),%eax
801069ff:	85 c0                	test   %eax,%eax
80106a01:	74 17                	je     80106a1a <trap+0x224>
80106a03:	8b 45 08             	mov    0x8(%ebp),%eax
80106a06:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
80106a0a:	0f b7 c0             	movzwl %ax,%eax
80106a0d:	83 e0 03             	and    $0x3,%eax
80106a10:	83 f8 03             	cmp    $0x3,%eax
80106a13:	75 05                	jne    80106a1a <trap+0x224>
    exit();
80106a15:	e8 00 da ff ff       	call   8010441a <exit>

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80106a1a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106a20:	85 c0                	test   %eax,%eax
80106a22:	74 1e                	je     80106a42 <trap+0x24c>
80106a24:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106a2a:	8b 40 0c             	mov    0xc(%eax),%eax
80106a2d:	83 f8 04             	cmp    $0x4,%eax
80106a30:	75 10                	jne    80106a42 <trap+0x24c>
80106a32:	8b 45 08             	mov    0x8(%ebp),%eax
80106a35:	8b 40 30             	mov    0x30(%eax),%eax
80106a38:	83 f8 20             	cmp    $0x20,%eax
80106a3b:	75 05                	jne    80106a42 <trap+0x24c>
    yield();
80106a3d:	e8 69 e1 ff ff       	call   80104bab <yield>

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80106a42:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106a48:	85 c0                	test   %eax,%eax
80106a4a:	74 27                	je     80106a73 <trap+0x27d>
80106a4c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106a52:	8b 40 24             	mov    0x24(%eax),%eax
80106a55:	85 c0                	test   %eax,%eax
80106a57:	74 1a                	je     80106a73 <trap+0x27d>
80106a59:	8b 45 08             	mov    0x8(%ebp),%eax
80106a5c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
80106a60:	0f b7 c0             	movzwl %ax,%eax
80106a63:	83 e0 03             	and    $0x3,%eax
80106a66:	83 f8 03             	cmp    $0x3,%eax
80106a69:	75 08                	jne    80106a73 <trap+0x27d>
    exit();
80106a6b:	e8 aa d9 ff ff       	call   8010441a <exit>
80106a70:	eb 01                	jmp    80106a73 <trap+0x27d>
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
    return;
80106a72:	90                   	nop
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80106a73:	83 c4 3c             	add    $0x3c,%esp
80106a76:	5b                   	pop    %ebx
80106a77:	5e                   	pop    %esi
80106a78:	5f                   	pop    %edi
80106a79:	5d                   	pop    %ebp
80106a7a:	c3                   	ret    
	...

80106a7c <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
80106a7c:	55                   	push   %ebp
80106a7d:	89 e5                	mov    %esp,%ebp
80106a7f:	83 ec 14             	sub    $0x14,%esp
80106a82:	8b 45 08             	mov    0x8(%ebp),%eax
80106a85:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80106a89:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
80106a8d:	89 c2                	mov    %eax,%edx
80106a8f:	ec                   	in     (%dx),%al
80106a90:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
80106a93:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
80106a97:	c9                   	leave  
80106a98:	c3                   	ret    

80106a99 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
80106a99:	55                   	push   %ebp
80106a9a:	89 e5                	mov    %esp,%ebp
80106a9c:	83 ec 08             	sub    $0x8,%esp
80106a9f:	8b 55 08             	mov    0x8(%ebp),%edx
80106aa2:	8b 45 0c             	mov    0xc(%ebp),%eax
80106aa5:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
80106aa9:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80106aac:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
80106ab0:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80106ab4:	ee                   	out    %al,(%dx)
}
80106ab5:	c9                   	leave  
80106ab6:	c3                   	ret    

80106ab7 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80106ab7:	55                   	push   %ebp
80106ab8:	89 e5                	mov    %esp,%ebp
80106aba:	83 ec 28             	sub    $0x28,%esp
  char *p;

  // Turn off the FIFO
  outb(COM1+2, 0);
80106abd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106ac4:	00 
80106ac5:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
80106acc:	e8 c8 ff ff ff       	call   80106a99 <outb>
  
  // 9600 baud, 8 data bits, 1 stop bit, parity off.
  outb(COM1+3, 0x80);    // Unlock divisor
80106ad1:	c7 44 24 04 80 00 00 	movl   $0x80,0x4(%esp)
80106ad8:	00 
80106ad9:	c7 04 24 fb 03 00 00 	movl   $0x3fb,(%esp)
80106ae0:	e8 b4 ff ff ff       	call   80106a99 <outb>
  outb(COM1+0, 115200/9600);
80106ae5:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
80106aec:	00 
80106aed:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106af4:	e8 a0 ff ff ff       	call   80106a99 <outb>
  outb(COM1+1, 0);
80106af9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106b00:	00 
80106b01:	c7 04 24 f9 03 00 00 	movl   $0x3f9,(%esp)
80106b08:	e8 8c ff ff ff       	call   80106a99 <outb>
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
80106b0d:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
80106b14:	00 
80106b15:	c7 04 24 fb 03 00 00 	movl   $0x3fb,(%esp)
80106b1c:	e8 78 ff ff ff       	call   80106a99 <outb>
  outb(COM1+4, 0);
80106b21:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106b28:	00 
80106b29:	c7 04 24 fc 03 00 00 	movl   $0x3fc,(%esp)
80106b30:	e8 64 ff ff ff       	call   80106a99 <outb>
  outb(COM1+1, 0x01);    // Enable receive interrupts.
80106b35:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80106b3c:	00 
80106b3d:	c7 04 24 f9 03 00 00 	movl   $0x3f9,(%esp)
80106b44:	e8 50 ff ff ff       	call   80106a99 <outb>

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80106b49:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
80106b50:	e8 27 ff ff ff       	call   80106a7c <inb>
80106b55:	3c ff                	cmp    $0xff,%al
80106b57:	74 6c                	je     80106bc5 <uartinit+0x10e>
    return;
  uart = 1;
80106b59:	c7 05 6c b6 10 80 01 	movl   $0x1,0x8010b66c
80106b60:	00 00 00 

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
80106b63:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
80106b6a:	e8 0d ff ff ff       	call   80106a7c <inb>
  inb(COM1+0);
80106b6f:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106b76:	e8 01 ff ff ff       	call   80106a7c <inb>
  picenable(IRQ_COM1);
80106b7b:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
80106b82:	e8 fa ce ff ff       	call   80103a81 <picenable>
  ioapicenable(IRQ_COM1, 0);
80106b87:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106b8e:	00 
80106b8f:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
80106b96:	e8 d7 bd ff ff       	call   80102972 <ioapicenable>
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80106b9b:	c7 45 f4 ec 8a 10 80 	movl   $0x80108aec,-0xc(%ebp)
80106ba2:	eb 15                	jmp    80106bb9 <uartinit+0x102>
    uartputc(*p);
80106ba4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106ba7:	0f b6 00             	movzbl (%eax),%eax
80106baa:	0f be c0             	movsbl %al,%eax
80106bad:	89 04 24             	mov    %eax,(%esp)
80106bb0:	e8 13 00 00 00       	call   80106bc8 <uartputc>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80106bb5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80106bb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106bbc:	0f b6 00             	movzbl (%eax),%eax
80106bbf:	84 c0                	test   %al,%al
80106bc1:	75 e1                	jne    80106ba4 <uartinit+0xed>
80106bc3:	eb 01                	jmp    80106bc6 <uartinit+0x10f>
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
    return;
80106bc5:	90                   	nop
  ioapicenable(IRQ_COM1, 0);
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}
80106bc6:	c9                   	leave  
80106bc7:	c3                   	ret    

80106bc8 <uartputc>:

void
uartputc(int c)
{
80106bc8:	55                   	push   %ebp
80106bc9:	89 e5                	mov    %esp,%ebp
80106bcb:	83 ec 28             	sub    $0x28,%esp
  int i;

  if(!uart)
80106bce:	a1 6c b6 10 80       	mov    0x8010b66c,%eax
80106bd3:	85 c0                	test   %eax,%eax
80106bd5:	74 4d                	je     80106c24 <uartputc+0x5c>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80106bd7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80106bde:	eb 10                	jmp    80106bf0 <uartputc+0x28>
    microdelay(10);
80106be0:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
80106be7:	e8 0d c3 ff ff       	call   80102ef9 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80106bec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80106bf0:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
80106bf4:	7f 16                	jg     80106c0c <uartputc+0x44>
80106bf6:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
80106bfd:	e8 7a fe ff ff       	call   80106a7c <inb>
80106c02:	0f b6 c0             	movzbl %al,%eax
80106c05:	83 e0 20             	and    $0x20,%eax
80106c08:	85 c0                	test   %eax,%eax
80106c0a:	74 d4                	je     80106be0 <uartputc+0x18>
    microdelay(10);
  outb(COM1+0, c);
80106c0c:	8b 45 08             	mov    0x8(%ebp),%eax
80106c0f:	0f b6 c0             	movzbl %al,%eax
80106c12:	89 44 24 04          	mov    %eax,0x4(%esp)
80106c16:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106c1d:	e8 77 fe ff ff       	call   80106a99 <outb>
80106c22:	eb 01                	jmp    80106c25 <uartputc+0x5d>
uartputc(int c)
{
  int i;

  if(!uart)
    return;
80106c24:	90                   	nop
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80106c25:	c9                   	leave  
80106c26:	c3                   	ret    

80106c27 <uartgetc>:

static int
uartgetc(void)
{
80106c27:	55                   	push   %ebp
80106c28:	89 e5                	mov    %esp,%ebp
80106c2a:	83 ec 04             	sub    $0x4,%esp
  if(!uart)
80106c2d:	a1 6c b6 10 80       	mov    0x8010b66c,%eax
80106c32:	85 c0                	test   %eax,%eax
80106c34:	75 07                	jne    80106c3d <uartgetc+0x16>
    return -1;
80106c36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106c3b:	eb 2c                	jmp    80106c69 <uartgetc+0x42>
  if(!(inb(COM1+5) & 0x01))
80106c3d:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
80106c44:	e8 33 fe ff ff       	call   80106a7c <inb>
80106c49:	0f b6 c0             	movzbl %al,%eax
80106c4c:	83 e0 01             	and    $0x1,%eax
80106c4f:	85 c0                	test   %eax,%eax
80106c51:	75 07                	jne    80106c5a <uartgetc+0x33>
    return -1;
80106c53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106c58:	eb 0f                	jmp    80106c69 <uartgetc+0x42>
  return inb(COM1+0);
80106c5a:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106c61:	e8 16 fe ff ff       	call   80106a7c <inb>
80106c66:	0f b6 c0             	movzbl %al,%eax
}
80106c69:	c9                   	leave  
80106c6a:	c3                   	ret    

80106c6b <uartintr>:

void
uartintr(void)
{
80106c6b:	55                   	push   %ebp
80106c6c:	89 e5                	mov    %esp,%ebp
80106c6e:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
80106c71:	c7 04 24 27 6c 10 80 	movl   $0x80106c27,(%esp)
80106c78:	e8 2e 9b ff ff       	call   801007ab <consoleintr>
}
80106c7d:	c9                   	leave  
80106c7e:	c3                   	ret    
	...

80106c80 <vector0>:
80106c80:	6a 00                	push   $0x0
80106c82:	6a 00                	push   $0x0
80106c84:	e9 7b f9 ff ff       	jmp    80106604 <alltraps>

80106c89 <vector1>:
80106c89:	6a 00                	push   $0x0
80106c8b:	6a 01                	push   $0x1
80106c8d:	e9 72 f9 ff ff       	jmp    80106604 <alltraps>

80106c92 <vector2>:
80106c92:	6a 00                	push   $0x0
80106c94:	6a 02                	push   $0x2
80106c96:	e9 69 f9 ff ff       	jmp    80106604 <alltraps>

80106c9b <vector3>:
80106c9b:	6a 00                	push   $0x0
80106c9d:	6a 03                	push   $0x3
80106c9f:	e9 60 f9 ff ff       	jmp    80106604 <alltraps>

80106ca4 <vector4>:
80106ca4:	6a 00                	push   $0x0
80106ca6:	6a 04                	push   $0x4
80106ca8:	e9 57 f9 ff ff       	jmp    80106604 <alltraps>

80106cad <vector5>:
80106cad:	6a 00                	push   $0x0
80106caf:	6a 05                	push   $0x5
80106cb1:	e9 4e f9 ff ff       	jmp    80106604 <alltraps>

80106cb6 <vector6>:
80106cb6:	6a 00                	push   $0x0
80106cb8:	6a 06                	push   $0x6
80106cba:	e9 45 f9 ff ff       	jmp    80106604 <alltraps>

80106cbf <vector7>:
80106cbf:	6a 00                	push   $0x0
80106cc1:	6a 07                	push   $0x7
80106cc3:	e9 3c f9 ff ff       	jmp    80106604 <alltraps>

80106cc8 <vector8>:
80106cc8:	6a 08                	push   $0x8
80106cca:	e9 35 f9 ff ff       	jmp    80106604 <alltraps>

80106ccf <vector9>:
80106ccf:	6a 00                	push   $0x0
80106cd1:	6a 09                	push   $0x9
80106cd3:	e9 2c f9 ff ff       	jmp    80106604 <alltraps>

80106cd8 <vector10>:
80106cd8:	6a 0a                	push   $0xa
80106cda:	e9 25 f9 ff ff       	jmp    80106604 <alltraps>

80106cdf <vector11>:
80106cdf:	6a 0b                	push   $0xb
80106ce1:	e9 1e f9 ff ff       	jmp    80106604 <alltraps>

80106ce6 <vector12>:
80106ce6:	6a 0c                	push   $0xc
80106ce8:	e9 17 f9 ff ff       	jmp    80106604 <alltraps>

80106ced <vector13>:
80106ced:	6a 0d                	push   $0xd
80106cef:	e9 10 f9 ff ff       	jmp    80106604 <alltraps>

80106cf4 <vector14>:
80106cf4:	6a 0e                	push   $0xe
80106cf6:	e9 09 f9 ff ff       	jmp    80106604 <alltraps>

80106cfb <vector15>:
80106cfb:	6a 00                	push   $0x0
80106cfd:	6a 0f                	push   $0xf
80106cff:	e9 00 f9 ff ff       	jmp    80106604 <alltraps>

80106d04 <vector16>:
80106d04:	6a 00                	push   $0x0
80106d06:	6a 10                	push   $0x10
80106d08:	e9 f7 f8 ff ff       	jmp    80106604 <alltraps>

80106d0d <vector17>:
80106d0d:	6a 11                	push   $0x11
80106d0f:	e9 f0 f8 ff ff       	jmp    80106604 <alltraps>

80106d14 <vector18>:
80106d14:	6a 00                	push   $0x0
80106d16:	6a 12                	push   $0x12
80106d18:	e9 e7 f8 ff ff       	jmp    80106604 <alltraps>

80106d1d <vector19>:
80106d1d:	6a 00                	push   $0x0
80106d1f:	6a 13                	push   $0x13
80106d21:	e9 de f8 ff ff       	jmp    80106604 <alltraps>

80106d26 <vector20>:
80106d26:	6a 00                	push   $0x0
80106d28:	6a 14                	push   $0x14
80106d2a:	e9 d5 f8 ff ff       	jmp    80106604 <alltraps>

80106d2f <vector21>:
80106d2f:	6a 00                	push   $0x0
80106d31:	6a 15                	push   $0x15
80106d33:	e9 cc f8 ff ff       	jmp    80106604 <alltraps>

80106d38 <vector22>:
80106d38:	6a 00                	push   $0x0
80106d3a:	6a 16                	push   $0x16
80106d3c:	e9 c3 f8 ff ff       	jmp    80106604 <alltraps>

80106d41 <vector23>:
80106d41:	6a 00                	push   $0x0
80106d43:	6a 17                	push   $0x17
80106d45:	e9 ba f8 ff ff       	jmp    80106604 <alltraps>

80106d4a <vector24>:
80106d4a:	6a 00                	push   $0x0
80106d4c:	6a 18                	push   $0x18
80106d4e:	e9 b1 f8 ff ff       	jmp    80106604 <alltraps>

80106d53 <vector25>:
80106d53:	6a 00                	push   $0x0
80106d55:	6a 19                	push   $0x19
80106d57:	e9 a8 f8 ff ff       	jmp    80106604 <alltraps>

80106d5c <vector26>:
80106d5c:	6a 00                	push   $0x0
80106d5e:	6a 1a                	push   $0x1a
80106d60:	e9 9f f8 ff ff       	jmp    80106604 <alltraps>

80106d65 <vector27>:
80106d65:	6a 00                	push   $0x0
80106d67:	6a 1b                	push   $0x1b
80106d69:	e9 96 f8 ff ff       	jmp    80106604 <alltraps>

80106d6e <vector28>:
80106d6e:	6a 00                	push   $0x0
80106d70:	6a 1c                	push   $0x1c
80106d72:	e9 8d f8 ff ff       	jmp    80106604 <alltraps>

80106d77 <vector29>:
80106d77:	6a 00                	push   $0x0
80106d79:	6a 1d                	push   $0x1d
80106d7b:	e9 84 f8 ff ff       	jmp    80106604 <alltraps>

80106d80 <vector30>:
80106d80:	6a 00                	push   $0x0
80106d82:	6a 1e                	push   $0x1e
80106d84:	e9 7b f8 ff ff       	jmp    80106604 <alltraps>

80106d89 <vector31>:
80106d89:	6a 00                	push   $0x0
80106d8b:	6a 1f                	push   $0x1f
80106d8d:	e9 72 f8 ff ff       	jmp    80106604 <alltraps>

80106d92 <vector32>:
80106d92:	6a 00                	push   $0x0
80106d94:	6a 20                	push   $0x20
80106d96:	e9 69 f8 ff ff       	jmp    80106604 <alltraps>

80106d9b <vector33>:
80106d9b:	6a 00                	push   $0x0
80106d9d:	6a 21                	push   $0x21
80106d9f:	e9 60 f8 ff ff       	jmp    80106604 <alltraps>

80106da4 <vector34>:
80106da4:	6a 00                	push   $0x0
80106da6:	6a 22                	push   $0x22
80106da8:	e9 57 f8 ff ff       	jmp    80106604 <alltraps>

80106dad <vector35>:
80106dad:	6a 00                	push   $0x0
80106daf:	6a 23                	push   $0x23
80106db1:	e9 4e f8 ff ff       	jmp    80106604 <alltraps>

80106db6 <vector36>:
80106db6:	6a 00                	push   $0x0
80106db8:	6a 24                	push   $0x24
80106dba:	e9 45 f8 ff ff       	jmp    80106604 <alltraps>

80106dbf <vector37>:
80106dbf:	6a 00                	push   $0x0
80106dc1:	6a 25                	push   $0x25
80106dc3:	e9 3c f8 ff ff       	jmp    80106604 <alltraps>

80106dc8 <vector38>:
80106dc8:	6a 00                	push   $0x0
80106dca:	6a 26                	push   $0x26
80106dcc:	e9 33 f8 ff ff       	jmp    80106604 <alltraps>

80106dd1 <vector39>:
80106dd1:	6a 00                	push   $0x0
80106dd3:	6a 27                	push   $0x27
80106dd5:	e9 2a f8 ff ff       	jmp    80106604 <alltraps>

80106dda <vector40>:
80106dda:	6a 00                	push   $0x0
80106ddc:	6a 28                	push   $0x28
80106dde:	e9 21 f8 ff ff       	jmp    80106604 <alltraps>

80106de3 <vector41>:
80106de3:	6a 00                	push   $0x0
80106de5:	6a 29                	push   $0x29
80106de7:	e9 18 f8 ff ff       	jmp    80106604 <alltraps>

80106dec <vector42>:
80106dec:	6a 00                	push   $0x0
80106dee:	6a 2a                	push   $0x2a
80106df0:	e9 0f f8 ff ff       	jmp    80106604 <alltraps>

80106df5 <vector43>:
80106df5:	6a 00                	push   $0x0
80106df7:	6a 2b                	push   $0x2b
80106df9:	e9 06 f8 ff ff       	jmp    80106604 <alltraps>

80106dfe <vector44>:
80106dfe:	6a 00                	push   $0x0
80106e00:	6a 2c                	push   $0x2c
80106e02:	e9 fd f7 ff ff       	jmp    80106604 <alltraps>

80106e07 <vector45>:
80106e07:	6a 00                	push   $0x0
80106e09:	6a 2d                	push   $0x2d
80106e0b:	e9 f4 f7 ff ff       	jmp    80106604 <alltraps>

80106e10 <vector46>:
80106e10:	6a 00                	push   $0x0
80106e12:	6a 2e                	push   $0x2e
80106e14:	e9 eb f7 ff ff       	jmp    80106604 <alltraps>

80106e19 <vector47>:
80106e19:	6a 00                	push   $0x0
80106e1b:	6a 2f                	push   $0x2f
80106e1d:	e9 e2 f7 ff ff       	jmp    80106604 <alltraps>

80106e22 <vector48>:
80106e22:	6a 00                	push   $0x0
80106e24:	6a 30                	push   $0x30
80106e26:	e9 d9 f7 ff ff       	jmp    80106604 <alltraps>

80106e2b <vector49>:
80106e2b:	6a 00                	push   $0x0
80106e2d:	6a 31                	push   $0x31
80106e2f:	e9 d0 f7 ff ff       	jmp    80106604 <alltraps>

80106e34 <vector50>:
80106e34:	6a 00                	push   $0x0
80106e36:	6a 32                	push   $0x32
80106e38:	e9 c7 f7 ff ff       	jmp    80106604 <alltraps>

80106e3d <vector51>:
80106e3d:	6a 00                	push   $0x0
80106e3f:	6a 33                	push   $0x33
80106e41:	e9 be f7 ff ff       	jmp    80106604 <alltraps>

80106e46 <vector52>:
80106e46:	6a 00                	push   $0x0
80106e48:	6a 34                	push   $0x34
80106e4a:	e9 b5 f7 ff ff       	jmp    80106604 <alltraps>

80106e4f <vector53>:
80106e4f:	6a 00                	push   $0x0
80106e51:	6a 35                	push   $0x35
80106e53:	e9 ac f7 ff ff       	jmp    80106604 <alltraps>

80106e58 <vector54>:
80106e58:	6a 00                	push   $0x0
80106e5a:	6a 36                	push   $0x36
80106e5c:	e9 a3 f7 ff ff       	jmp    80106604 <alltraps>

80106e61 <vector55>:
80106e61:	6a 00                	push   $0x0
80106e63:	6a 37                	push   $0x37
80106e65:	e9 9a f7 ff ff       	jmp    80106604 <alltraps>

80106e6a <vector56>:
80106e6a:	6a 00                	push   $0x0
80106e6c:	6a 38                	push   $0x38
80106e6e:	e9 91 f7 ff ff       	jmp    80106604 <alltraps>

80106e73 <vector57>:
80106e73:	6a 00                	push   $0x0
80106e75:	6a 39                	push   $0x39
80106e77:	e9 88 f7 ff ff       	jmp    80106604 <alltraps>

80106e7c <vector58>:
80106e7c:	6a 00                	push   $0x0
80106e7e:	6a 3a                	push   $0x3a
80106e80:	e9 7f f7 ff ff       	jmp    80106604 <alltraps>

80106e85 <vector59>:
80106e85:	6a 00                	push   $0x0
80106e87:	6a 3b                	push   $0x3b
80106e89:	e9 76 f7 ff ff       	jmp    80106604 <alltraps>

80106e8e <vector60>:
80106e8e:	6a 00                	push   $0x0
80106e90:	6a 3c                	push   $0x3c
80106e92:	e9 6d f7 ff ff       	jmp    80106604 <alltraps>

80106e97 <vector61>:
80106e97:	6a 00                	push   $0x0
80106e99:	6a 3d                	push   $0x3d
80106e9b:	e9 64 f7 ff ff       	jmp    80106604 <alltraps>

80106ea0 <vector62>:
80106ea0:	6a 00                	push   $0x0
80106ea2:	6a 3e                	push   $0x3e
80106ea4:	e9 5b f7 ff ff       	jmp    80106604 <alltraps>

80106ea9 <vector63>:
80106ea9:	6a 00                	push   $0x0
80106eab:	6a 3f                	push   $0x3f
80106ead:	e9 52 f7 ff ff       	jmp    80106604 <alltraps>

80106eb2 <vector64>:
80106eb2:	6a 00                	push   $0x0
80106eb4:	6a 40                	push   $0x40
80106eb6:	e9 49 f7 ff ff       	jmp    80106604 <alltraps>

80106ebb <vector65>:
80106ebb:	6a 00                	push   $0x0
80106ebd:	6a 41                	push   $0x41
80106ebf:	e9 40 f7 ff ff       	jmp    80106604 <alltraps>

80106ec4 <vector66>:
80106ec4:	6a 00                	push   $0x0
80106ec6:	6a 42                	push   $0x42
80106ec8:	e9 37 f7 ff ff       	jmp    80106604 <alltraps>

80106ecd <vector67>:
80106ecd:	6a 00                	push   $0x0
80106ecf:	6a 43                	push   $0x43
80106ed1:	e9 2e f7 ff ff       	jmp    80106604 <alltraps>

80106ed6 <vector68>:
80106ed6:	6a 00                	push   $0x0
80106ed8:	6a 44                	push   $0x44
80106eda:	e9 25 f7 ff ff       	jmp    80106604 <alltraps>

80106edf <vector69>:
80106edf:	6a 00                	push   $0x0
80106ee1:	6a 45                	push   $0x45
80106ee3:	e9 1c f7 ff ff       	jmp    80106604 <alltraps>

80106ee8 <vector70>:
80106ee8:	6a 00                	push   $0x0
80106eea:	6a 46                	push   $0x46
80106eec:	e9 13 f7 ff ff       	jmp    80106604 <alltraps>

80106ef1 <vector71>:
80106ef1:	6a 00                	push   $0x0
80106ef3:	6a 47                	push   $0x47
80106ef5:	e9 0a f7 ff ff       	jmp    80106604 <alltraps>

80106efa <vector72>:
80106efa:	6a 00                	push   $0x0
80106efc:	6a 48                	push   $0x48
80106efe:	e9 01 f7 ff ff       	jmp    80106604 <alltraps>

80106f03 <vector73>:
80106f03:	6a 00                	push   $0x0
80106f05:	6a 49                	push   $0x49
80106f07:	e9 f8 f6 ff ff       	jmp    80106604 <alltraps>

80106f0c <vector74>:
80106f0c:	6a 00                	push   $0x0
80106f0e:	6a 4a                	push   $0x4a
80106f10:	e9 ef f6 ff ff       	jmp    80106604 <alltraps>

80106f15 <vector75>:
80106f15:	6a 00                	push   $0x0
80106f17:	6a 4b                	push   $0x4b
80106f19:	e9 e6 f6 ff ff       	jmp    80106604 <alltraps>

80106f1e <vector76>:
80106f1e:	6a 00                	push   $0x0
80106f20:	6a 4c                	push   $0x4c
80106f22:	e9 dd f6 ff ff       	jmp    80106604 <alltraps>

80106f27 <vector77>:
80106f27:	6a 00                	push   $0x0
80106f29:	6a 4d                	push   $0x4d
80106f2b:	e9 d4 f6 ff ff       	jmp    80106604 <alltraps>

80106f30 <vector78>:
80106f30:	6a 00                	push   $0x0
80106f32:	6a 4e                	push   $0x4e
80106f34:	e9 cb f6 ff ff       	jmp    80106604 <alltraps>

80106f39 <vector79>:
80106f39:	6a 00                	push   $0x0
80106f3b:	6a 4f                	push   $0x4f
80106f3d:	e9 c2 f6 ff ff       	jmp    80106604 <alltraps>

80106f42 <vector80>:
80106f42:	6a 00                	push   $0x0
80106f44:	6a 50                	push   $0x50
80106f46:	e9 b9 f6 ff ff       	jmp    80106604 <alltraps>

80106f4b <vector81>:
80106f4b:	6a 00                	push   $0x0
80106f4d:	6a 51                	push   $0x51
80106f4f:	e9 b0 f6 ff ff       	jmp    80106604 <alltraps>

80106f54 <vector82>:
80106f54:	6a 00                	push   $0x0
80106f56:	6a 52                	push   $0x52
80106f58:	e9 a7 f6 ff ff       	jmp    80106604 <alltraps>

80106f5d <vector83>:
80106f5d:	6a 00                	push   $0x0
80106f5f:	6a 53                	push   $0x53
80106f61:	e9 9e f6 ff ff       	jmp    80106604 <alltraps>

80106f66 <vector84>:
80106f66:	6a 00                	push   $0x0
80106f68:	6a 54                	push   $0x54
80106f6a:	e9 95 f6 ff ff       	jmp    80106604 <alltraps>

80106f6f <vector85>:
80106f6f:	6a 00                	push   $0x0
80106f71:	6a 55                	push   $0x55
80106f73:	e9 8c f6 ff ff       	jmp    80106604 <alltraps>

80106f78 <vector86>:
80106f78:	6a 00                	push   $0x0
80106f7a:	6a 56                	push   $0x56
80106f7c:	e9 83 f6 ff ff       	jmp    80106604 <alltraps>

80106f81 <vector87>:
80106f81:	6a 00                	push   $0x0
80106f83:	6a 57                	push   $0x57
80106f85:	e9 7a f6 ff ff       	jmp    80106604 <alltraps>

80106f8a <vector88>:
80106f8a:	6a 00                	push   $0x0
80106f8c:	6a 58                	push   $0x58
80106f8e:	e9 71 f6 ff ff       	jmp    80106604 <alltraps>

80106f93 <vector89>:
80106f93:	6a 00                	push   $0x0
80106f95:	6a 59                	push   $0x59
80106f97:	e9 68 f6 ff ff       	jmp    80106604 <alltraps>

80106f9c <vector90>:
80106f9c:	6a 00                	push   $0x0
80106f9e:	6a 5a                	push   $0x5a
80106fa0:	e9 5f f6 ff ff       	jmp    80106604 <alltraps>

80106fa5 <vector91>:
80106fa5:	6a 00                	push   $0x0
80106fa7:	6a 5b                	push   $0x5b
80106fa9:	e9 56 f6 ff ff       	jmp    80106604 <alltraps>

80106fae <vector92>:
80106fae:	6a 00                	push   $0x0
80106fb0:	6a 5c                	push   $0x5c
80106fb2:	e9 4d f6 ff ff       	jmp    80106604 <alltraps>

80106fb7 <vector93>:
80106fb7:	6a 00                	push   $0x0
80106fb9:	6a 5d                	push   $0x5d
80106fbb:	e9 44 f6 ff ff       	jmp    80106604 <alltraps>

80106fc0 <vector94>:
80106fc0:	6a 00                	push   $0x0
80106fc2:	6a 5e                	push   $0x5e
80106fc4:	e9 3b f6 ff ff       	jmp    80106604 <alltraps>

80106fc9 <vector95>:
80106fc9:	6a 00                	push   $0x0
80106fcb:	6a 5f                	push   $0x5f
80106fcd:	e9 32 f6 ff ff       	jmp    80106604 <alltraps>

80106fd2 <vector96>:
80106fd2:	6a 00                	push   $0x0
80106fd4:	6a 60                	push   $0x60
80106fd6:	e9 29 f6 ff ff       	jmp    80106604 <alltraps>

80106fdb <vector97>:
80106fdb:	6a 00                	push   $0x0
80106fdd:	6a 61                	push   $0x61
80106fdf:	e9 20 f6 ff ff       	jmp    80106604 <alltraps>

80106fe4 <vector98>:
80106fe4:	6a 00                	push   $0x0
80106fe6:	6a 62                	push   $0x62
80106fe8:	e9 17 f6 ff ff       	jmp    80106604 <alltraps>

80106fed <vector99>:
80106fed:	6a 00                	push   $0x0
80106fef:	6a 63                	push   $0x63
80106ff1:	e9 0e f6 ff ff       	jmp    80106604 <alltraps>

80106ff6 <vector100>:
80106ff6:	6a 00                	push   $0x0
80106ff8:	6a 64                	push   $0x64
80106ffa:	e9 05 f6 ff ff       	jmp    80106604 <alltraps>

80106fff <vector101>:
80106fff:	6a 00                	push   $0x0
80107001:	6a 65                	push   $0x65
80107003:	e9 fc f5 ff ff       	jmp    80106604 <alltraps>

80107008 <vector102>:
80107008:	6a 00                	push   $0x0
8010700a:	6a 66                	push   $0x66
8010700c:	e9 f3 f5 ff ff       	jmp    80106604 <alltraps>

80107011 <vector103>:
80107011:	6a 00                	push   $0x0
80107013:	6a 67                	push   $0x67
80107015:	e9 ea f5 ff ff       	jmp    80106604 <alltraps>

8010701a <vector104>:
8010701a:	6a 00                	push   $0x0
8010701c:	6a 68                	push   $0x68
8010701e:	e9 e1 f5 ff ff       	jmp    80106604 <alltraps>

80107023 <vector105>:
80107023:	6a 00                	push   $0x0
80107025:	6a 69                	push   $0x69
80107027:	e9 d8 f5 ff ff       	jmp    80106604 <alltraps>

8010702c <vector106>:
8010702c:	6a 00                	push   $0x0
8010702e:	6a 6a                	push   $0x6a
80107030:	e9 cf f5 ff ff       	jmp    80106604 <alltraps>

80107035 <vector107>:
80107035:	6a 00                	push   $0x0
80107037:	6a 6b                	push   $0x6b
80107039:	e9 c6 f5 ff ff       	jmp    80106604 <alltraps>

8010703e <vector108>:
8010703e:	6a 00                	push   $0x0
80107040:	6a 6c                	push   $0x6c
80107042:	e9 bd f5 ff ff       	jmp    80106604 <alltraps>

80107047 <vector109>:
80107047:	6a 00                	push   $0x0
80107049:	6a 6d                	push   $0x6d
8010704b:	e9 b4 f5 ff ff       	jmp    80106604 <alltraps>

80107050 <vector110>:
80107050:	6a 00                	push   $0x0
80107052:	6a 6e                	push   $0x6e
80107054:	e9 ab f5 ff ff       	jmp    80106604 <alltraps>

80107059 <vector111>:
80107059:	6a 00                	push   $0x0
8010705b:	6a 6f                	push   $0x6f
8010705d:	e9 a2 f5 ff ff       	jmp    80106604 <alltraps>

80107062 <vector112>:
80107062:	6a 00                	push   $0x0
80107064:	6a 70                	push   $0x70
80107066:	e9 99 f5 ff ff       	jmp    80106604 <alltraps>

8010706b <vector113>:
8010706b:	6a 00                	push   $0x0
8010706d:	6a 71                	push   $0x71
8010706f:	e9 90 f5 ff ff       	jmp    80106604 <alltraps>

80107074 <vector114>:
80107074:	6a 00                	push   $0x0
80107076:	6a 72                	push   $0x72
80107078:	e9 87 f5 ff ff       	jmp    80106604 <alltraps>

8010707d <vector115>:
8010707d:	6a 00                	push   $0x0
8010707f:	6a 73                	push   $0x73
80107081:	e9 7e f5 ff ff       	jmp    80106604 <alltraps>

80107086 <vector116>:
80107086:	6a 00                	push   $0x0
80107088:	6a 74                	push   $0x74
8010708a:	e9 75 f5 ff ff       	jmp    80106604 <alltraps>

8010708f <vector117>:
8010708f:	6a 00                	push   $0x0
80107091:	6a 75                	push   $0x75
80107093:	e9 6c f5 ff ff       	jmp    80106604 <alltraps>

80107098 <vector118>:
80107098:	6a 00                	push   $0x0
8010709a:	6a 76                	push   $0x76
8010709c:	e9 63 f5 ff ff       	jmp    80106604 <alltraps>

801070a1 <vector119>:
801070a1:	6a 00                	push   $0x0
801070a3:	6a 77                	push   $0x77
801070a5:	e9 5a f5 ff ff       	jmp    80106604 <alltraps>

801070aa <vector120>:
801070aa:	6a 00                	push   $0x0
801070ac:	6a 78                	push   $0x78
801070ae:	e9 51 f5 ff ff       	jmp    80106604 <alltraps>

801070b3 <vector121>:
801070b3:	6a 00                	push   $0x0
801070b5:	6a 79                	push   $0x79
801070b7:	e9 48 f5 ff ff       	jmp    80106604 <alltraps>

801070bc <vector122>:
801070bc:	6a 00                	push   $0x0
801070be:	6a 7a                	push   $0x7a
801070c0:	e9 3f f5 ff ff       	jmp    80106604 <alltraps>

801070c5 <vector123>:
801070c5:	6a 00                	push   $0x0
801070c7:	6a 7b                	push   $0x7b
801070c9:	e9 36 f5 ff ff       	jmp    80106604 <alltraps>

801070ce <vector124>:
801070ce:	6a 00                	push   $0x0
801070d0:	6a 7c                	push   $0x7c
801070d2:	e9 2d f5 ff ff       	jmp    80106604 <alltraps>

801070d7 <vector125>:
801070d7:	6a 00                	push   $0x0
801070d9:	6a 7d                	push   $0x7d
801070db:	e9 24 f5 ff ff       	jmp    80106604 <alltraps>

801070e0 <vector126>:
801070e0:	6a 00                	push   $0x0
801070e2:	6a 7e                	push   $0x7e
801070e4:	e9 1b f5 ff ff       	jmp    80106604 <alltraps>

801070e9 <vector127>:
801070e9:	6a 00                	push   $0x0
801070eb:	6a 7f                	push   $0x7f
801070ed:	e9 12 f5 ff ff       	jmp    80106604 <alltraps>

801070f2 <vector128>:
801070f2:	6a 00                	push   $0x0
801070f4:	68 80 00 00 00       	push   $0x80
801070f9:	e9 06 f5 ff ff       	jmp    80106604 <alltraps>

801070fe <vector129>:
801070fe:	6a 00                	push   $0x0
80107100:	68 81 00 00 00       	push   $0x81
80107105:	e9 fa f4 ff ff       	jmp    80106604 <alltraps>

8010710a <vector130>:
8010710a:	6a 00                	push   $0x0
8010710c:	68 82 00 00 00       	push   $0x82
80107111:	e9 ee f4 ff ff       	jmp    80106604 <alltraps>

80107116 <vector131>:
80107116:	6a 00                	push   $0x0
80107118:	68 83 00 00 00       	push   $0x83
8010711d:	e9 e2 f4 ff ff       	jmp    80106604 <alltraps>

80107122 <vector132>:
80107122:	6a 00                	push   $0x0
80107124:	68 84 00 00 00       	push   $0x84
80107129:	e9 d6 f4 ff ff       	jmp    80106604 <alltraps>

8010712e <vector133>:
8010712e:	6a 00                	push   $0x0
80107130:	68 85 00 00 00       	push   $0x85
80107135:	e9 ca f4 ff ff       	jmp    80106604 <alltraps>

8010713a <vector134>:
8010713a:	6a 00                	push   $0x0
8010713c:	68 86 00 00 00       	push   $0x86
80107141:	e9 be f4 ff ff       	jmp    80106604 <alltraps>

80107146 <vector135>:
80107146:	6a 00                	push   $0x0
80107148:	68 87 00 00 00       	push   $0x87
8010714d:	e9 b2 f4 ff ff       	jmp    80106604 <alltraps>

80107152 <vector136>:
80107152:	6a 00                	push   $0x0
80107154:	68 88 00 00 00       	push   $0x88
80107159:	e9 a6 f4 ff ff       	jmp    80106604 <alltraps>

8010715e <vector137>:
8010715e:	6a 00                	push   $0x0
80107160:	68 89 00 00 00       	push   $0x89
80107165:	e9 9a f4 ff ff       	jmp    80106604 <alltraps>

8010716a <vector138>:
8010716a:	6a 00                	push   $0x0
8010716c:	68 8a 00 00 00       	push   $0x8a
80107171:	e9 8e f4 ff ff       	jmp    80106604 <alltraps>

80107176 <vector139>:
80107176:	6a 00                	push   $0x0
80107178:	68 8b 00 00 00       	push   $0x8b
8010717d:	e9 82 f4 ff ff       	jmp    80106604 <alltraps>

80107182 <vector140>:
80107182:	6a 00                	push   $0x0
80107184:	68 8c 00 00 00       	push   $0x8c
80107189:	e9 76 f4 ff ff       	jmp    80106604 <alltraps>

8010718e <vector141>:
8010718e:	6a 00                	push   $0x0
80107190:	68 8d 00 00 00       	push   $0x8d
80107195:	e9 6a f4 ff ff       	jmp    80106604 <alltraps>

8010719a <vector142>:
8010719a:	6a 00                	push   $0x0
8010719c:	68 8e 00 00 00       	push   $0x8e
801071a1:	e9 5e f4 ff ff       	jmp    80106604 <alltraps>

801071a6 <vector143>:
801071a6:	6a 00                	push   $0x0
801071a8:	68 8f 00 00 00       	push   $0x8f
801071ad:	e9 52 f4 ff ff       	jmp    80106604 <alltraps>

801071b2 <vector144>:
801071b2:	6a 00                	push   $0x0
801071b4:	68 90 00 00 00       	push   $0x90
801071b9:	e9 46 f4 ff ff       	jmp    80106604 <alltraps>

801071be <vector145>:
801071be:	6a 00                	push   $0x0
801071c0:	68 91 00 00 00       	push   $0x91
801071c5:	e9 3a f4 ff ff       	jmp    80106604 <alltraps>

801071ca <vector146>:
801071ca:	6a 00                	push   $0x0
801071cc:	68 92 00 00 00       	push   $0x92
801071d1:	e9 2e f4 ff ff       	jmp    80106604 <alltraps>

801071d6 <vector147>:
801071d6:	6a 00                	push   $0x0
801071d8:	68 93 00 00 00       	push   $0x93
801071dd:	e9 22 f4 ff ff       	jmp    80106604 <alltraps>

801071e2 <vector148>:
801071e2:	6a 00                	push   $0x0
801071e4:	68 94 00 00 00       	push   $0x94
801071e9:	e9 16 f4 ff ff       	jmp    80106604 <alltraps>

801071ee <vector149>:
801071ee:	6a 00                	push   $0x0
801071f0:	68 95 00 00 00       	push   $0x95
801071f5:	e9 0a f4 ff ff       	jmp    80106604 <alltraps>

801071fa <vector150>:
801071fa:	6a 00                	push   $0x0
801071fc:	68 96 00 00 00       	push   $0x96
80107201:	e9 fe f3 ff ff       	jmp    80106604 <alltraps>

80107206 <vector151>:
80107206:	6a 00                	push   $0x0
80107208:	68 97 00 00 00       	push   $0x97
8010720d:	e9 f2 f3 ff ff       	jmp    80106604 <alltraps>

80107212 <vector152>:
80107212:	6a 00                	push   $0x0
80107214:	68 98 00 00 00       	push   $0x98
80107219:	e9 e6 f3 ff ff       	jmp    80106604 <alltraps>

8010721e <vector153>:
8010721e:	6a 00                	push   $0x0
80107220:	68 99 00 00 00       	push   $0x99
80107225:	e9 da f3 ff ff       	jmp    80106604 <alltraps>

8010722a <vector154>:
8010722a:	6a 00                	push   $0x0
8010722c:	68 9a 00 00 00       	push   $0x9a
80107231:	e9 ce f3 ff ff       	jmp    80106604 <alltraps>

80107236 <vector155>:
80107236:	6a 00                	push   $0x0
80107238:	68 9b 00 00 00       	push   $0x9b
8010723d:	e9 c2 f3 ff ff       	jmp    80106604 <alltraps>

80107242 <vector156>:
80107242:	6a 00                	push   $0x0
80107244:	68 9c 00 00 00       	push   $0x9c
80107249:	e9 b6 f3 ff ff       	jmp    80106604 <alltraps>

8010724e <vector157>:
8010724e:	6a 00                	push   $0x0
80107250:	68 9d 00 00 00       	push   $0x9d
80107255:	e9 aa f3 ff ff       	jmp    80106604 <alltraps>

8010725a <vector158>:
8010725a:	6a 00                	push   $0x0
8010725c:	68 9e 00 00 00       	push   $0x9e
80107261:	e9 9e f3 ff ff       	jmp    80106604 <alltraps>

80107266 <vector159>:
80107266:	6a 00                	push   $0x0
80107268:	68 9f 00 00 00       	push   $0x9f
8010726d:	e9 92 f3 ff ff       	jmp    80106604 <alltraps>

80107272 <vector160>:
80107272:	6a 00                	push   $0x0
80107274:	68 a0 00 00 00       	push   $0xa0
80107279:	e9 86 f3 ff ff       	jmp    80106604 <alltraps>

8010727e <vector161>:
8010727e:	6a 00                	push   $0x0
80107280:	68 a1 00 00 00       	push   $0xa1
80107285:	e9 7a f3 ff ff       	jmp    80106604 <alltraps>

8010728a <vector162>:
8010728a:	6a 00                	push   $0x0
8010728c:	68 a2 00 00 00       	push   $0xa2
80107291:	e9 6e f3 ff ff       	jmp    80106604 <alltraps>

80107296 <vector163>:
80107296:	6a 00                	push   $0x0
80107298:	68 a3 00 00 00       	push   $0xa3
8010729d:	e9 62 f3 ff ff       	jmp    80106604 <alltraps>

801072a2 <vector164>:
801072a2:	6a 00                	push   $0x0
801072a4:	68 a4 00 00 00       	push   $0xa4
801072a9:	e9 56 f3 ff ff       	jmp    80106604 <alltraps>

801072ae <vector165>:
801072ae:	6a 00                	push   $0x0
801072b0:	68 a5 00 00 00       	push   $0xa5
801072b5:	e9 4a f3 ff ff       	jmp    80106604 <alltraps>

801072ba <vector166>:
801072ba:	6a 00                	push   $0x0
801072bc:	68 a6 00 00 00       	push   $0xa6
801072c1:	e9 3e f3 ff ff       	jmp    80106604 <alltraps>

801072c6 <vector167>:
801072c6:	6a 00                	push   $0x0
801072c8:	68 a7 00 00 00       	push   $0xa7
801072cd:	e9 32 f3 ff ff       	jmp    80106604 <alltraps>

801072d2 <vector168>:
801072d2:	6a 00                	push   $0x0
801072d4:	68 a8 00 00 00       	push   $0xa8
801072d9:	e9 26 f3 ff ff       	jmp    80106604 <alltraps>

801072de <vector169>:
801072de:	6a 00                	push   $0x0
801072e0:	68 a9 00 00 00       	push   $0xa9
801072e5:	e9 1a f3 ff ff       	jmp    80106604 <alltraps>

801072ea <vector170>:
801072ea:	6a 00                	push   $0x0
801072ec:	68 aa 00 00 00       	push   $0xaa
801072f1:	e9 0e f3 ff ff       	jmp    80106604 <alltraps>

801072f6 <vector171>:
801072f6:	6a 00                	push   $0x0
801072f8:	68 ab 00 00 00       	push   $0xab
801072fd:	e9 02 f3 ff ff       	jmp    80106604 <alltraps>

80107302 <vector172>:
80107302:	6a 00                	push   $0x0
80107304:	68 ac 00 00 00       	push   $0xac
80107309:	e9 f6 f2 ff ff       	jmp    80106604 <alltraps>

8010730e <vector173>:
8010730e:	6a 00                	push   $0x0
80107310:	68 ad 00 00 00       	push   $0xad
80107315:	e9 ea f2 ff ff       	jmp    80106604 <alltraps>

8010731a <vector174>:
8010731a:	6a 00                	push   $0x0
8010731c:	68 ae 00 00 00       	push   $0xae
80107321:	e9 de f2 ff ff       	jmp    80106604 <alltraps>

80107326 <vector175>:
80107326:	6a 00                	push   $0x0
80107328:	68 af 00 00 00       	push   $0xaf
8010732d:	e9 d2 f2 ff ff       	jmp    80106604 <alltraps>

80107332 <vector176>:
80107332:	6a 00                	push   $0x0
80107334:	68 b0 00 00 00       	push   $0xb0
80107339:	e9 c6 f2 ff ff       	jmp    80106604 <alltraps>

8010733e <vector177>:
8010733e:	6a 00                	push   $0x0
80107340:	68 b1 00 00 00       	push   $0xb1
80107345:	e9 ba f2 ff ff       	jmp    80106604 <alltraps>

8010734a <vector178>:
8010734a:	6a 00                	push   $0x0
8010734c:	68 b2 00 00 00       	push   $0xb2
80107351:	e9 ae f2 ff ff       	jmp    80106604 <alltraps>

80107356 <vector179>:
80107356:	6a 00                	push   $0x0
80107358:	68 b3 00 00 00       	push   $0xb3
8010735d:	e9 a2 f2 ff ff       	jmp    80106604 <alltraps>

80107362 <vector180>:
80107362:	6a 00                	push   $0x0
80107364:	68 b4 00 00 00       	push   $0xb4
80107369:	e9 96 f2 ff ff       	jmp    80106604 <alltraps>

8010736e <vector181>:
8010736e:	6a 00                	push   $0x0
80107370:	68 b5 00 00 00       	push   $0xb5
80107375:	e9 8a f2 ff ff       	jmp    80106604 <alltraps>

8010737a <vector182>:
8010737a:	6a 00                	push   $0x0
8010737c:	68 b6 00 00 00       	push   $0xb6
80107381:	e9 7e f2 ff ff       	jmp    80106604 <alltraps>

80107386 <vector183>:
80107386:	6a 00                	push   $0x0
80107388:	68 b7 00 00 00       	push   $0xb7
8010738d:	e9 72 f2 ff ff       	jmp    80106604 <alltraps>

80107392 <vector184>:
80107392:	6a 00                	push   $0x0
80107394:	68 b8 00 00 00       	push   $0xb8
80107399:	e9 66 f2 ff ff       	jmp    80106604 <alltraps>

8010739e <vector185>:
8010739e:	6a 00                	push   $0x0
801073a0:	68 b9 00 00 00       	push   $0xb9
801073a5:	e9 5a f2 ff ff       	jmp    80106604 <alltraps>

801073aa <vector186>:
801073aa:	6a 00                	push   $0x0
801073ac:	68 ba 00 00 00       	push   $0xba
801073b1:	e9 4e f2 ff ff       	jmp    80106604 <alltraps>

801073b6 <vector187>:
801073b6:	6a 00                	push   $0x0
801073b8:	68 bb 00 00 00       	push   $0xbb
801073bd:	e9 42 f2 ff ff       	jmp    80106604 <alltraps>

801073c2 <vector188>:
801073c2:	6a 00                	push   $0x0
801073c4:	68 bc 00 00 00       	push   $0xbc
801073c9:	e9 36 f2 ff ff       	jmp    80106604 <alltraps>

801073ce <vector189>:
801073ce:	6a 00                	push   $0x0
801073d0:	68 bd 00 00 00       	push   $0xbd
801073d5:	e9 2a f2 ff ff       	jmp    80106604 <alltraps>

801073da <vector190>:
801073da:	6a 00                	push   $0x0
801073dc:	68 be 00 00 00       	push   $0xbe
801073e1:	e9 1e f2 ff ff       	jmp    80106604 <alltraps>

801073e6 <vector191>:
801073e6:	6a 00                	push   $0x0
801073e8:	68 bf 00 00 00       	push   $0xbf
801073ed:	e9 12 f2 ff ff       	jmp    80106604 <alltraps>

801073f2 <vector192>:
801073f2:	6a 00                	push   $0x0
801073f4:	68 c0 00 00 00       	push   $0xc0
801073f9:	e9 06 f2 ff ff       	jmp    80106604 <alltraps>

801073fe <vector193>:
801073fe:	6a 00                	push   $0x0
80107400:	68 c1 00 00 00       	push   $0xc1
80107405:	e9 fa f1 ff ff       	jmp    80106604 <alltraps>

8010740a <vector194>:
8010740a:	6a 00                	push   $0x0
8010740c:	68 c2 00 00 00       	push   $0xc2
80107411:	e9 ee f1 ff ff       	jmp    80106604 <alltraps>

80107416 <vector195>:
80107416:	6a 00                	push   $0x0
80107418:	68 c3 00 00 00       	push   $0xc3
8010741d:	e9 e2 f1 ff ff       	jmp    80106604 <alltraps>

80107422 <vector196>:
80107422:	6a 00                	push   $0x0
80107424:	68 c4 00 00 00       	push   $0xc4
80107429:	e9 d6 f1 ff ff       	jmp    80106604 <alltraps>

8010742e <vector197>:
8010742e:	6a 00                	push   $0x0
80107430:	68 c5 00 00 00       	push   $0xc5
80107435:	e9 ca f1 ff ff       	jmp    80106604 <alltraps>

8010743a <vector198>:
8010743a:	6a 00                	push   $0x0
8010743c:	68 c6 00 00 00       	push   $0xc6
80107441:	e9 be f1 ff ff       	jmp    80106604 <alltraps>

80107446 <vector199>:
80107446:	6a 00                	push   $0x0
80107448:	68 c7 00 00 00       	push   $0xc7
8010744d:	e9 b2 f1 ff ff       	jmp    80106604 <alltraps>

80107452 <vector200>:
80107452:	6a 00                	push   $0x0
80107454:	68 c8 00 00 00       	push   $0xc8
80107459:	e9 a6 f1 ff ff       	jmp    80106604 <alltraps>

8010745e <vector201>:
8010745e:	6a 00                	push   $0x0
80107460:	68 c9 00 00 00       	push   $0xc9
80107465:	e9 9a f1 ff ff       	jmp    80106604 <alltraps>

8010746a <vector202>:
8010746a:	6a 00                	push   $0x0
8010746c:	68 ca 00 00 00       	push   $0xca
80107471:	e9 8e f1 ff ff       	jmp    80106604 <alltraps>

80107476 <vector203>:
80107476:	6a 00                	push   $0x0
80107478:	68 cb 00 00 00       	push   $0xcb
8010747d:	e9 82 f1 ff ff       	jmp    80106604 <alltraps>

80107482 <vector204>:
80107482:	6a 00                	push   $0x0
80107484:	68 cc 00 00 00       	push   $0xcc
80107489:	e9 76 f1 ff ff       	jmp    80106604 <alltraps>

8010748e <vector205>:
8010748e:	6a 00                	push   $0x0
80107490:	68 cd 00 00 00       	push   $0xcd
80107495:	e9 6a f1 ff ff       	jmp    80106604 <alltraps>

8010749a <vector206>:
8010749a:	6a 00                	push   $0x0
8010749c:	68 ce 00 00 00       	push   $0xce
801074a1:	e9 5e f1 ff ff       	jmp    80106604 <alltraps>

801074a6 <vector207>:
801074a6:	6a 00                	push   $0x0
801074a8:	68 cf 00 00 00       	push   $0xcf
801074ad:	e9 52 f1 ff ff       	jmp    80106604 <alltraps>

801074b2 <vector208>:
801074b2:	6a 00                	push   $0x0
801074b4:	68 d0 00 00 00       	push   $0xd0
801074b9:	e9 46 f1 ff ff       	jmp    80106604 <alltraps>

801074be <vector209>:
801074be:	6a 00                	push   $0x0
801074c0:	68 d1 00 00 00       	push   $0xd1
801074c5:	e9 3a f1 ff ff       	jmp    80106604 <alltraps>

801074ca <vector210>:
801074ca:	6a 00                	push   $0x0
801074cc:	68 d2 00 00 00       	push   $0xd2
801074d1:	e9 2e f1 ff ff       	jmp    80106604 <alltraps>

801074d6 <vector211>:
801074d6:	6a 00                	push   $0x0
801074d8:	68 d3 00 00 00       	push   $0xd3
801074dd:	e9 22 f1 ff ff       	jmp    80106604 <alltraps>

801074e2 <vector212>:
801074e2:	6a 00                	push   $0x0
801074e4:	68 d4 00 00 00       	push   $0xd4
801074e9:	e9 16 f1 ff ff       	jmp    80106604 <alltraps>

801074ee <vector213>:
801074ee:	6a 00                	push   $0x0
801074f0:	68 d5 00 00 00       	push   $0xd5
801074f5:	e9 0a f1 ff ff       	jmp    80106604 <alltraps>

801074fa <vector214>:
801074fa:	6a 00                	push   $0x0
801074fc:	68 d6 00 00 00       	push   $0xd6
80107501:	e9 fe f0 ff ff       	jmp    80106604 <alltraps>

80107506 <vector215>:
80107506:	6a 00                	push   $0x0
80107508:	68 d7 00 00 00       	push   $0xd7
8010750d:	e9 f2 f0 ff ff       	jmp    80106604 <alltraps>

80107512 <vector216>:
80107512:	6a 00                	push   $0x0
80107514:	68 d8 00 00 00       	push   $0xd8
80107519:	e9 e6 f0 ff ff       	jmp    80106604 <alltraps>

8010751e <vector217>:
8010751e:	6a 00                	push   $0x0
80107520:	68 d9 00 00 00       	push   $0xd9
80107525:	e9 da f0 ff ff       	jmp    80106604 <alltraps>

8010752a <vector218>:
8010752a:	6a 00                	push   $0x0
8010752c:	68 da 00 00 00       	push   $0xda
80107531:	e9 ce f0 ff ff       	jmp    80106604 <alltraps>

80107536 <vector219>:
80107536:	6a 00                	push   $0x0
80107538:	68 db 00 00 00       	push   $0xdb
8010753d:	e9 c2 f0 ff ff       	jmp    80106604 <alltraps>

80107542 <vector220>:
80107542:	6a 00                	push   $0x0
80107544:	68 dc 00 00 00       	push   $0xdc
80107549:	e9 b6 f0 ff ff       	jmp    80106604 <alltraps>

8010754e <vector221>:
8010754e:	6a 00                	push   $0x0
80107550:	68 dd 00 00 00       	push   $0xdd
80107555:	e9 aa f0 ff ff       	jmp    80106604 <alltraps>

8010755a <vector222>:
8010755a:	6a 00                	push   $0x0
8010755c:	68 de 00 00 00       	push   $0xde
80107561:	e9 9e f0 ff ff       	jmp    80106604 <alltraps>

80107566 <vector223>:
80107566:	6a 00                	push   $0x0
80107568:	68 df 00 00 00       	push   $0xdf
8010756d:	e9 92 f0 ff ff       	jmp    80106604 <alltraps>

80107572 <vector224>:
80107572:	6a 00                	push   $0x0
80107574:	68 e0 00 00 00       	push   $0xe0
80107579:	e9 86 f0 ff ff       	jmp    80106604 <alltraps>

8010757e <vector225>:
8010757e:	6a 00                	push   $0x0
80107580:	68 e1 00 00 00       	push   $0xe1
80107585:	e9 7a f0 ff ff       	jmp    80106604 <alltraps>

8010758a <vector226>:
8010758a:	6a 00                	push   $0x0
8010758c:	68 e2 00 00 00       	push   $0xe2
80107591:	e9 6e f0 ff ff       	jmp    80106604 <alltraps>

80107596 <vector227>:
80107596:	6a 00                	push   $0x0
80107598:	68 e3 00 00 00       	push   $0xe3
8010759d:	e9 62 f0 ff ff       	jmp    80106604 <alltraps>

801075a2 <vector228>:
801075a2:	6a 00                	push   $0x0
801075a4:	68 e4 00 00 00       	push   $0xe4
801075a9:	e9 56 f0 ff ff       	jmp    80106604 <alltraps>

801075ae <vector229>:
801075ae:	6a 00                	push   $0x0
801075b0:	68 e5 00 00 00       	push   $0xe5
801075b5:	e9 4a f0 ff ff       	jmp    80106604 <alltraps>

801075ba <vector230>:
801075ba:	6a 00                	push   $0x0
801075bc:	68 e6 00 00 00       	push   $0xe6
801075c1:	e9 3e f0 ff ff       	jmp    80106604 <alltraps>

801075c6 <vector231>:
801075c6:	6a 00                	push   $0x0
801075c8:	68 e7 00 00 00       	push   $0xe7
801075cd:	e9 32 f0 ff ff       	jmp    80106604 <alltraps>

801075d2 <vector232>:
801075d2:	6a 00                	push   $0x0
801075d4:	68 e8 00 00 00       	push   $0xe8
801075d9:	e9 26 f0 ff ff       	jmp    80106604 <alltraps>

801075de <vector233>:
801075de:	6a 00                	push   $0x0
801075e0:	68 e9 00 00 00       	push   $0xe9
801075e5:	e9 1a f0 ff ff       	jmp    80106604 <alltraps>

801075ea <vector234>:
801075ea:	6a 00                	push   $0x0
801075ec:	68 ea 00 00 00       	push   $0xea
801075f1:	e9 0e f0 ff ff       	jmp    80106604 <alltraps>

801075f6 <vector235>:
801075f6:	6a 00                	push   $0x0
801075f8:	68 eb 00 00 00       	push   $0xeb
801075fd:	e9 02 f0 ff ff       	jmp    80106604 <alltraps>

80107602 <vector236>:
80107602:	6a 00                	push   $0x0
80107604:	68 ec 00 00 00       	push   $0xec
80107609:	e9 f6 ef ff ff       	jmp    80106604 <alltraps>

8010760e <vector237>:
8010760e:	6a 00                	push   $0x0
80107610:	68 ed 00 00 00       	push   $0xed
80107615:	e9 ea ef ff ff       	jmp    80106604 <alltraps>

8010761a <vector238>:
8010761a:	6a 00                	push   $0x0
8010761c:	68 ee 00 00 00       	push   $0xee
80107621:	e9 de ef ff ff       	jmp    80106604 <alltraps>

80107626 <vector239>:
80107626:	6a 00                	push   $0x0
80107628:	68 ef 00 00 00       	push   $0xef
8010762d:	e9 d2 ef ff ff       	jmp    80106604 <alltraps>

80107632 <vector240>:
80107632:	6a 00                	push   $0x0
80107634:	68 f0 00 00 00       	push   $0xf0
80107639:	e9 c6 ef ff ff       	jmp    80106604 <alltraps>

8010763e <vector241>:
8010763e:	6a 00                	push   $0x0
80107640:	68 f1 00 00 00       	push   $0xf1
80107645:	e9 ba ef ff ff       	jmp    80106604 <alltraps>

8010764a <vector242>:
8010764a:	6a 00                	push   $0x0
8010764c:	68 f2 00 00 00       	push   $0xf2
80107651:	e9 ae ef ff ff       	jmp    80106604 <alltraps>

80107656 <vector243>:
80107656:	6a 00                	push   $0x0
80107658:	68 f3 00 00 00       	push   $0xf3
8010765d:	e9 a2 ef ff ff       	jmp    80106604 <alltraps>

80107662 <vector244>:
80107662:	6a 00                	push   $0x0
80107664:	68 f4 00 00 00       	push   $0xf4
80107669:	e9 96 ef ff ff       	jmp    80106604 <alltraps>

8010766e <vector245>:
8010766e:	6a 00                	push   $0x0
80107670:	68 f5 00 00 00       	push   $0xf5
80107675:	e9 8a ef ff ff       	jmp    80106604 <alltraps>

8010767a <vector246>:
8010767a:	6a 00                	push   $0x0
8010767c:	68 f6 00 00 00       	push   $0xf6
80107681:	e9 7e ef ff ff       	jmp    80106604 <alltraps>

80107686 <vector247>:
80107686:	6a 00                	push   $0x0
80107688:	68 f7 00 00 00       	push   $0xf7
8010768d:	e9 72 ef ff ff       	jmp    80106604 <alltraps>

80107692 <vector248>:
80107692:	6a 00                	push   $0x0
80107694:	68 f8 00 00 00       	push   $0xf8
80107699:	e9 66 ef ff ff       	jmp    80106604 <alltraps>

8010769e <vector249>:
8010769e:	6a 00                	push   $0x0
801076a0:	68 f9 00 00 00       	push   $0xf9
801076a5:	e9 5a ef ff ff       	jmp    80106604 <alltraps>

801076aa <vector250>:
801076aa:	6a 00                	push   $0x0
801076ac:	68 fa 00 00 00       	push   $0xfa
801076b1:	e9 4e ef ff ff       	jmp    80106604 <alltraps>

801076b6 <vector251>:
801076b6:	6a 00                	push   $0x0
801076b8:	68 fb 00 00 00       	push   $0xfb
801076bd:	e9 42 ef ff ff       	jmp    80106604 <alltraps>

801076c2 <vector252>:
801076c2:	6a 00                	push   $0x0
801076c4:	68 fc 00 00 00       	push   $0xfc
801076c9:	e9 36 ef ff ff       	jmp    80106604 <alltraps>

801076ce <vector253>:
801076ce:	6a 00                	push   $0x0
801076d0:	68 fd 00 00 00       	push   $0xfd
801076d5:	e9 2a ef ff ff       	jmp    80106604 <alltraps>

801076da <vector254>:
801076da:	6a 00                	push   $0x0
801076dc:	68 fe 00 00 00       	push   $0xfe
801076e1:	e9 1e ef ff ff       	jmp    80106604 <alltraps>

801076e6 <vector255>:
801076e6:	6a 00                	push   $0x0
801076e8:	68 ff 00 00 00       	push   $0xff
801076ed:	e9 12 ef ff ff       	jmp    80106604 <alltraps>
	...

801076f4 <lgdt>:

struct segdesc;

static inline void
lgdt(struct segdesc *p, int size)
{
801076f4:	55                   	push   %ebp
801076f5:	89 e5                	mov    %esp,%ebp
801076f7:	83 ec 10             	sub    $0x10,%esp
  volatile ushort pd[3];

  pd[0] = size-1;
801076fa:	8b 45 0c             	mov    0xc(%ebp),%eax
801076fd:	83 e8 01             	sub    $0x1,%eax
80107700:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80107704:	8b 45 08             	mov    0x8(%ebp),%eax
80107707:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
8010770b:	8b 45 08             	mov    0x8(%ebp),%eax
8010770e:	c1 e8 10             	shr    $0x10,%eax
80107711:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80107715:	8d 45 fa             	lea    -0x6(%ebp),%eax
80107718:	0f 01 10             	lgdtl  (%eax)
}
8010771b:	c9                   	leave  
8010771c:	c3                   	ret    

8010771d <ltr>:
  asm volatile("lidt (%0)" : : "r" (pd));
}

static inline void
ltr(ushort sel)
{
8010771d:	55                   	push   %ebp
8010771e:	89 e5                	mov    %esp,%ebp
80107720:	83 ec 04             	sub    $0x4,%esp
80107723:	8b 45 08             	mov    0x8(%ebp),%eax
80107726:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  asm volatile("ltr %0" : : "r" (sel));
8010772a:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
8010772e:	0f 00 d8             	ltr    %ax
}
80107731:	c9                   	leave  
80107732:	c3                   	ret    

80107733 <loadgs>:
  return eflags;
}

static inline void
loadgs(ushort v)
{
80107733:	55                   	push   %ebp
80107734:	89 e5                	mov    %esp,%ebp
80107736:	83 ec 04             	sub    $0x4,%esp
80107739:	8b 45 08             	mov    0x8(%ebp),%eax
8010773c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  asm volatile("movw %0, %%gs" : : "r" (v));
80107740:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80107744:	8e e8                	mov    %eax,%gs
}
80107746:	c9                   	leave  
80107747:	c3                   	ret    

80107748 <lcr3>:
  return val;
}

static inline void
lcr3(uint val) 
{
80107748:	55                   	push   %ebp
80107749:	89 e5                	mov    %esp,%ebp
  asm volatile("movl %0,%%cr3" : : "r" (val));
8010774b:	8b 45 08             	mov    0x8(%ebp),%eax
8010774e:	0f 22 d8             	mov    %eax,%cr3
}
80107751:	5d                   	pop    %ebp
80107752:	c3                   	ret    

80107753 <v2p>:
#define KERNBASE 0x80000000         // First kernel virtual address
#define KERNLINK (KERNBASE+EXTMEM)  // Address where kernel is linked

#ifndef __ASSEMBLER__

static inline uint v2p(void *a) { return ((uint) (a))  - KERNBASE; }
80107753:	55                   	push   %ebp
80107754:	89 e5                	mov    %esp,%ebp
80107756:	8b 45 08             	mov    0x8(%ebp),%eax
80107759:	2d 00 00 00 80       	sub    $0x80000000,%eax
8010775e:	5d                   	pop    %ebp
8010775f:	c3                   	ret    

80107760 <p2v>:
static inline void *p2v(uint a) { return (void *) ((a) + KERNBASE); }
80107760:	55                   	push   %ebp
80107761:	89 e5                	mov    %esp,%ebp
80107763:	8b 45 08             	mov    0x8(%ebp),%eax
80107766:	2d 00 00 00 80       	sub    $0x80000000,%eax
8010776b:	5d                   	pop    %ebp
8010776c:	c3                   	ret    

8010776d <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
8010776d:	55                   	push   %ebp
8010776e:	89 e5                	mov    %esp,%ebp
80107770:	53                   	push   %ebx
80107771:	83 ec 24             	sub    $0x24,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80107774:	e8 ff b6 ff ff       	call   80102e78 <cpunum>
80107779:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
8010777f:	05 40 f9 10 80       	add    $0x8010f940,%eax
80107784:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80107787:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010778a:	66 c7 40 78 ff ff    	movw   $0xffff,0x78(%eax)
80107790:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107793:	66 c7 40 7a 00 00    	movw   $0x0,0x7a(%eax)
80107799:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010779c:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
801077a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077a3:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
801077a7:	83 e2 f0             	and    $0xfffffff0,%edx
801077aa:	83 ca 0a             	or     $0xa,%edx
801077ad:	88 50 7d             	mov    %dl,0x7d(%eax)
801077b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077b3:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
801077b7:	83 ca 10             	or     $0x10,%edx
801077ba:	88 50 7d             	mov    %dl,0x7d(%eax)
801077bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077c0:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
801077c4:	83 e2 9f             	and    $0xffffff9f,%edx
801077c7:	88 50 7d             	mov    %dl,0x7d(%eax)
801077ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077cd:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
801077d1:	83 ca 80             	or     $0xffffff80,%edx
801077d4:	88 50 7d             	mov    %dl,0x7d(%eax)
801077d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077da:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
801077de:	83 ca 0f             	or     $0xf,%edx
801077e1:	88 50 7e             	mov    %dl,0x7e(%eax)
801077e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077e7:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
801077eb:	83 e2 ef             	and    $0xffffffef,%edx
801077ee:	88 50 7e             	mov    %dl,0x7e(%eax)
801077f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077f4:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
801077f8:	83 e2 df             	and    $0xffffffdf,%edx
801077fb:	88 50 7e             	mov    %dl,0x7e(%eax)
801077fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107801:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80107805:	83 ca 40             	or     $0x40,%edx
80107808:	88 50 7e             	mov    %dl,0x7e(%eax)
8010780b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010780e:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80107812:	83 ca 80             	or     $0xffffff80,%edx
80107815:	88 50 7e             	mov    %dl,0x7e(%eax)
80107818:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010781b:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010781f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107822:	66 c7 80 80 00 00 00 	movw   $0xffff,0x80(%eax)
80107829:	ff ff 
8010782b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010782e:	66 c7 80 82 00 00 00 	movw   $0x0,0x82(%eax)
80107835:	00 00 
80107837:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010783a:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
80107841:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107844:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
8010784b:	83 e2 f0             	and    $0xfffffff0,%edx
8010784e:	83 ca 02             	or     $0x2,%edx
80107851:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
80107857:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010785a:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
80107861:	83 ca 10             	or     $0x10,%edx
80107864:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
8010786a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010786d:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
80107874:	83 e2 9f             	and    $0xffffff9f,%edx
80107877:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
8010787d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107880:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
80107887:	83 ca 80             	or     $0xffffff80,%edx
8010788a:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
80107890:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107893:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
8010789a:	83 ca 0f             	or     $0xf,%edx
8010789d:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
801078a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078a6:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
801078ad:	83 e2 ef             	and    $0xffffffef,%edx
801078b0:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
801078b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078b9:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
801078c0:	83 e2 df             	and    $0xffffffdf,%edx
801078c3:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
801078c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078cc:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
801078d3:	83 ca 40             	or     $0x40,%edx
801078d6:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
801078dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078df:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
801078e6:	83 ca 80             	or     $0xffffff80,%edx
801078e9:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
801078ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078f2:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801078f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078fc:	66 c7 80 90 00 00 00 	movw   $0xffff,0x90(%eax)
80107903:	ff ff 
80107905:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107908:	66 c7 80 92 00 00 00 	movw   $0x0,0x92(%eax)
8010790f:	00 00 
80107911:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107914:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
8010791b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010791e:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
80107925:	83 e2 f0             	and    $0xfffffff0,%edx
80107928:	83 ca 0a             	or     $0xa,%edx
8010792b:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80107931:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107934:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
8010793b:	83 ca 10             	or     $0x10,%edx
8010793e:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80107944:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107947:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
8010794e:	83 ca 60             	or     $0x60,%edx
80107951:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80107957:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010795a:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
80107961:	83 ca 80             	or     $0xffffff80,%edx
80107964:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
8010796a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010796d:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
80107974:	83 ca 0f             	or     $0xf,%edx
80107977:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
8010797d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107980:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
80107987:	83 e2 ef             	and    $0xffffffef,%edx
8010798a:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
80107990:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107993:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
8010799a:	83 e2 df             	and    $0xffffffdf,%edx
8010799d:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801079a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079a6:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801079ad:	83 ca 40             	or     $0x40,%edx
801079b0:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801079b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079b9:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801079c0:	83 ca 80             	or     $0xffffff80,%edx
801079c3:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801079c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079cc:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801079d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079d6:	66 c7 80 98 00 00 00 	movw   $0xffff,0x98(%eax)
801079dd:	ff ff 
801079df:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079e2:	66 c7 80 9a 00 00 00 	movw   $0x0,0x9a(%eax)
801079e9:	00 00 
801079eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079ee:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
801079f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079f8:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
801079ff:	83 e2 f0             	and    $0xfffffff0,%edx
80107a02:	83 ca 02             	or     $0x2,%edx
80107a05:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
80107a0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a0e:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80107a15:	83 ca 10             	or     $0x10,%edx
80107a18:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
80107a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a21:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80107a28:	83 ca 60             	or     $0x60,%edx
80107a2b:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
80107a31:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a34:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80107a3b:	83 ca 80             	or     $0xffffff80,%edx
80107a3e:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
80107a44:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a47:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
80107a4e:	83 ca 0f             	or     $0xf,%edx
80107a51:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
80107a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a5a:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
80107a61:	83 e2 ef             	and    $0xffffffef,%edx
80107a64:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
80107a6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a6d:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
80107a74:	83 e2 df             	and    $0xffffffdf,%edx
80107a77:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
80107a7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a80:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
80107a87:	83 ca 40             	or     $0x40,%edx
80107a8a:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
80107a90:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a93:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
80107a9a:	83 ca 80             	or     $0xffffff80,%edx
80107a9d:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
80107aa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107aa6:	c6 80 9f 00 00 00 00 	movb   $0x0,0x9f(%eax)

  // Map cpu, and curproc
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80107aad:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ab0:	05 b4 00 00 00       	add    $0xb4,%eax
80107ab5:	89 c3                	mov    %eax,%ebx
80107ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107aba:	05 b4 00 00 00       	add    $0xb4,%eax
80107abf:	c1 e8 10             	shr    $0x10,%eax
80107ac2:	89 c1                	mov    %eax,%ecx
80107ac4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ac7:	05 b4 00 00 00       	add    $0xb4,%eax
80107acc:	c1 e8 18             	shr    $0x18,%eax
80107acf:	89 c2                	mov    %eax,%edx
80107ad1:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ad4:	66 c7 80 88 00 00 00 	movw   $0x0,0x88(%eax)
80107adb:	00 00 
80107add:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ae0:	66 89 98 8a 00 00 00 	mov    %bx,0x8a(%eax)
80107ae7:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107aea:	88 88 8c 00 00 00    	mov    %cl,0x8c(%eax)
80107af0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107af3:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
80107afa:	83 e1 f0             	and    $0xfffffff0,%ecx
80107afd:	83 c9 02             	or     $0x2,%ecx
80107b00:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107b06:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b09:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
80107b10:	83 c9 10             	or     $0x10,%ecx
80107b13:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b1c:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
80107b23:	83 e1 9f             	and    $0xffffff9f,%ecx
80107b26:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107b2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b2f:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
80107b36:	83 c9 80             	or     $0xffffff80,%ecx
80107b39:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107b3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b42:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107b49:	83 e1 f0             	and    $0xfffffff0,%ecx
80107b4c:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
80107b52:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b55:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107b5c:	83 e1 ef             	and    $0xffffffef,%ecx
80107b5f:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
80107b65:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b68:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107b6f:	83 e1 df             	and    $0xffffffdf,%ecx
80107b72:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
80107b78:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b7b:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107b82:	83 c9 40             	or     $0x40,%ecx
80107b85:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
80107b8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b8e:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107b95:	83 c9 80             	or     $0xffffff80,%ecx
80107b98:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
80107b9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ba1:	88 90 8f 00 00 00    	mov    %dl,0x8f(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
80107ba7:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107baa:	83 c0 70             	add    $0x70,%eax
80107bad:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
80107bb4:	00 
80107bb5:	89 04 24             	mov    %eax,(%esp)
80107bb8:	e8 37 fb ff ff       	call   801076f4 <lgdt>
  loadgs(SEG_KCPU << 3);
80107bbd:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
80107bc4:	e8 6a fb ff ff       	call   80107733 <loadgs>
  
  // Initialize cpu-local storage.
  cpu = c;
80107bc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107bcc:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  proc = 0;
80107bd2:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80107bd9:	00 00 00 00 
}
80107bdd:	83 c4 24             	add    $0x24,%esp
80107be0:	5b                   	pop    %ebx
80107be1:	5d                   	pop    %ebp
80107be2:	c3                   	ret    

80107be3 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80107be3:	55                   	push   %ebp
80107be4:	89 e5                	mov    %esp,%ebp
80107be6:	83 ec 28             	sub    $0x28,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80107be9:	8b 45 0c             	mov    0xc(%ebp),%eax
80107bec:	c1 e8 16             	shr    $0x16,%eax
80107bef:	c1 e0 02             	shl    $0x2,%eax
80107bf2:	03 45 08             	add    0x8(%ebp),%eax
80107bf5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(*pde & PTE_P){
80107bf8:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107bfb:	8b 00                	mov    (%eax),%eax
80107bfd:	83 e0 01             	and    $0x1,%eax
80107c00:	84 c0                	test   %al,%al
80107c02:	74 17                	je     80107c1b <walkpgdir+0x38>
    pgtab = (pte_t*)p2v(PTE_ADDR(*pde));
80107c04:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107c07:	8b 00                	mov    (%eax),%eax
80107c09:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107c0e:	89 04 24             	mov    %eax,(%esp)
80107c11:	e8 4a fb ff ff       	call   80107760 <p2v>
80107c16:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107c19:	eb 4b                	jmp    80107c66 <walkpgdir+0x83>
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80107c1b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80107c1f:	74 0e                	je     80107c2f <walkpgdir+0x4c>
80107c21:	e8 d8 ae ff ff       	call   80102afe <kalloc>
80107c26:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107c29:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80107c2d:	75 07                	jne    80107c36 <walkpgdir+0x53>
      return 0;
80107c2f:	b8 00 00 00 00       	mov    $0x0,%eax
80107c34:	eb 41                	jmp    80107c77 <walkpgdir+0x94>
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
80107c36:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107c3d:	00 
80107c3e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107c45:	00 
80107c46:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107c49:	89 04 24             	mov    %eax,(%esp)
80107c4c:	e8 e1 d4 ff ff       	call   80105132 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table 
    // entries, if necessary.
    *pde = v2p(pgtab) | PTE_P | PTE_W | PTE_U;
80107c51:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107c54:	89 04 24             	mov    %eax,(%esp)
80107c57:	e8 f7 fa ff ff       	call   80107753 <v2p>
80107c5c:	89 c2                	mov    %eax,%edx
80107c5e:	83 ca 07             	or     $0x7,%edx
80107c61:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107c64:	89 10                	mov    %edx,(%eax)
  }
  return &pgtab[PTX(va)];
80107c66:	8b 45 0c             	mov    0xc(%ebp),%eax
80107c69:	c1 e8 0c             	shr    $0xc,%eax
80107c6c:	25 ff 03 00 00       	and    $0x3ff,%eax
80107c71:	c1 e0 02             	shl    $0x2,%eax
80107c74:	03 45 f4             	add    -0xc(%ebp),%eax
}
80107c77:	c9                   	leave  
80107c78:	c3                   	ret    

80107c79 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80107c79:	55                   	push   %ebp
80107c7a:	89 e5                	mov    %esp,%ebp
80107c7c:	83 ec 28             	sub    $0x28,%esp
  char *a, *last;
  pte_t *pte;
  
  a = (char*)PGROUNDDOWN((uint)va);
80107c7f:	8b 45 0c             	mov    0xc(%ebp),%eax
80107c82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107c87:	89 45 ec             	mov    %eax,-0x14(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80107c8a:	8b 45 0c             	mov    0xc(%ebp),%eax
80107c8d:	03 45 10             	add    0x10(%ebp),%eax
80107c90:	83 e8 01             	sub    $0x1,%eax
80107c93:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107c98:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80107c9b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
80107ca2:	00 
80107ca3:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107ca6:	89 44 24 04          	mov    %eax,0x4(%esp)
80107caa:	8b 45 08             	mov    0x8(%ebp),%eax
80107cad:	89 04 24             	mov    %eax,(%esp)
80107cb0:	e8 2e ff ff ff       	call   80107be3 <walkpgdir>
80107cb5:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107cb8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80107cbc:	75 07                	jne    80107cc5 <mappages+0x4c>
      return -1;
80107cbe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107cc3:	eb 46                	jmp    80107d0b <mappages+0x92>
    if(*pte & PTE_P)
80107cc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107cc8:	8b 00                	mov    (%eax),%eax
80107cca:	83 e0 01             	and    $0x1,%eax
80107ccd:	84 c0                	test   %al,%al
80107ccf:	74 0c                	je     80107cdd <mappages+0x64>
      panic("remap");
80107cd1:	c7 04 24 f4 8a 10 80 	movl   $0x80108af4,(%esp)
80107cd8:	e8 5d 88 ff ff       	call   8010053a <panic>
    *pte = pa | perm | PTE_P;
80107cdd:	8b 45 18             	mov    0x18(%ebp),%eax
80107ce0:	0b 45 14             	or     0x14(%ebp),%eax
80107ce3:	89 c2                	mov    %eax,%edx
80107ce5:	83 ca 01             	or     $0x1,%edx
80107ce8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ceb:	89 10                	mov    %edx,(%eax)
    if(a == last)
80107ced:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107cf0:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80107cf3:	74 10                	je     80107d05 <mappages+0x8c>
      break;
    a += PGSIZE;
80107cf5:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
    pa += PGSIZE;
80107cfc:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
  }
80107d03:	eb 96                	jmp    80107c9b <mappages+0x22>
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
    if(a == last)
      break;
80107d05:	90                   	nop
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
80107d06:	b8 00 00 00 00       	mov    $0x0,%eax
}
80107d0b:	c9                   	leave  
80107d0c:	c3                   	ret    

80107d0d <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80107d0d:	55                   	push   %ebp
80107d0e:	89 e5                	mov    %esp,%ebp
80107d10:	53                   	push   %ebx
80107d11:	83 ec 34             	sub    $0x34,%esp
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80107d14:	e8 e5 ad ff ff       	call   80102afe <kalloc>
80107d19:	89 45 f0             	mov    %eax,-0x10(%ebp)
80107d1c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80107d20:	75 0a                	jne    80107d2c <setupkvm+0x1f>
    return 0;
80107d22:	b8 00 00 00 00       	mov    $0x0,%eax
80107d27:	e9 99 00 00 00       	jmp    80107dc5 <setupkvm+0xb8>
  memset(pgdir, 0, PGSIZE);
80107d2c:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107d33:	00 
80107d34:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107d3b:	00 
80107d3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107d3f:	89 04 24             	mov    %eax,(%esp)
80107d42:	e8 eb d3 ff ff       	call   80105132 <memset>
  if (p2v(PHYSTOP) > (void*)DEVSPACE)
80107d47:	c7 04 24 00 00 00 0e 	movl   $0xe000000,(%esp)
80107d4e:	e8 0d fa ff ff       	call   80107760 <p2v>
80107d53:	3d 00 00 00 fe       	cmp    $0xfe000000,%eax
80107d58:	76 0c                	jbe    80107d66 <setupkvm+0x59>
    panic("PHYSTOP too high");
80107d5a:	c7 04 24 fa 8a 10 80 	movl   $0x80108afa,(%esp)
80107d61:	e8 d4 87 ff ff       	call   8010053a <panic>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107d66:	c7 45 f4 c0 b4 10 80 	movl   $0x8010b4c0,-0xc(%ebp)
80107d6d:	eb 49                	jmp    80107db8 <setupkvm+0xab>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start, 
80107d6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107d72:	8b 48 0c             	mov    0xc(%eax),%ecx
80107d75:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107d78:	8b 50 04             	mov    0x4(%eax),%edx
80107d7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107d7e:	8b 58 08             	mov    0x8(%eax),%ebx
80107d81:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107d84:	8b 40 04             	mov    0x4(%eax),%eax
80107d87:	29 c3                	sub    %eax,%ebx
80107d89:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107d8c:	8b 00                	mov    (%eax),%eax
80107d8e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
80107d92:	89 54 24 0c          	mov    %edx,0xc(%esp)
80107d96:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80107d9a:	89 44 24 04          	mov    %eax,0x4(%esp)
80107d9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107da1:	89 04 24             	mov    %eax,(%esp)
80107da4:	e8 d0 fe ff ff       	call   80107c79 <mappages>
80107da9:	85 c0                	test   %eax,%eax
80107dab:	79 07                	jns    80107db4 <setupkvm+0xa7>
                (uint)k->phys_start, k->perm) < 0)
      return 0;
80107dad:	b8 00 00 00 00       	mov    $0x0,%eax
80107db2:	eb 11                	jmp    80107dc5 <setupkvm+0xb8>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (p2v(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107db4:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
80107db8:	b8 00 b5 10 80       	mov    $0x8010b500,%eax
80107dbd:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80107dc0:	72 ad                	jb     80107d6f <setupkvm+0x62>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start, 
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
80107dc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80107dc5:	83 c4 34             	add    $0x34,%esp
80107dc8:	5b                   	pop    %ebx
80107dc9:	5d                   	pop    %ebp
80107dca:	c3                   	ret    

80107dcb <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80107dcb:	55                   	push   %ebp
80107dcc:	89 e5                	mov    %esp,%ebp
80107dce:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107dd1:	e8 37 ff ff ff       	call   80107d0d <setupkvm>
80107dd6:	a3 18 8d 11 80       	mov    %eax,0x80118d18
  switchkvm();
80107ddb:	e8 02 00 00 00       	call   80107de2 <switchkvm>
}
80107de0:	c9                   	leave  
80107de1:	c3                   	ret    

80107de2 <switchkvm>:

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80107de2:	55                   	push   %ebp
80107de3:	89 e5                	mov    %esp,%ebp
80107de5:	83 ec 04             	sub    $0x4,%esp
  lcr3(v2p(kpgdir));   // switch to the kernel page table
80107de8:	a1 18 8d 11 80       	mov    0x80118d18,%eax
80107ded:	89 04 24             	mov    %eax,(%esp)
80107df0:	e8 5e f9 ff ff       	call   80107753 <v2p>
80107df5:	89 04 24             	mov    %eax,(%esp)
80107df8:	e8 4b f9 ff ff       	call   80107748 <lcr3>
}
80107dfd:	c9                   	leave  
80107dfe:	c3                   	ret    

80107dff <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80107dff:	55                   	push   %ebp
80107e00:	89 e5                	mov    %esp,%ebp
80107e02:	53                   	push   %ebx
80107e03:	83 ec 14             	sub    $0x14,%esp
  pushcli();
80107e06:	e8 21 d2 ff ff       	call   8010502c <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80107e0b:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107e11:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80107e18:	83 c2 08             	add    $0x8,%edx
80107e1b:	89 d3                	mov    %edx,%ebx
80107e1d:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80107e24:	83 c2 08             	add    $0x8,%edx
80107e27:	c1 ea 10             	shr    $0x10,%edx
80107e2a:	89 d1                	mov    %edx,%ecx
80107e2c:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80107e33:	83 c2 08             	add    $0x8,%edx
80107e36:	c1 ea 18             	shr    $0x18,%edx
80107e39:	66 c7 80 a0 00 00 00 	movw   $0x67,0xa0(%eax)
80107e40:	67 00 
80107e42:	66 89 98 a2 00 00 00 	mov    %bx,0xa2(%eax)
80107e49:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
80107e4f:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107e56:	83 e1 f0             	and    $0xfffffff0,%ecx
80107e59:	83 c9 09             	or     $0x9,%ecx
80107e5c:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107e62:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107e69:	83 c9 10             	or     $0x10,%ecx
80107e6c:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107e72:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107e79:	83 e1 9f             	and    $0xffffff9f,%ecx
80107e7c:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107e82:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107e89:	83 c9 80             	or     $0xffffff80,%ecx
80107e8c:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107e92:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107e99:	83 e1 f0             	and    $0xfffffff0,%ecx
80107e9c:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107ea2:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107ea9:	83 e1 ef             	and    $0xffffffef,%ecx
80107eac:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107eb2:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107eb9:	83 e1 df             	and    $0xffffffdf,%ecx
80107ebc:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107ec2:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107ec9:	83 c9 40             	or     $0x40,%ecx
80107ecc:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107ed2:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107ed9:	83 e1 7f             	and    $0x7f,%ecx
80107edc:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107ee2:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
  cpu->gdt[SEG_TSS].s = 0;
80107ee8:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107eee:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
80107ef5:	83 e2 ef             	and    $0xffffffef,%edx
80107ef8:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
  cpu->ts.ss0 = SEG_KDATA << 3;
80107efe:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107f04:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80107f0a:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107f10:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80107f17:	8b 52 08             	mov    0x8(%edx),%edx
80107f1a:	81 c2 00 10 00 00    	add    $0x1000,%edx
80107f20:	89 50 0c             	mov    %edx,0xc(%eax)
  ltr(SEG_TSS << 3);
80107f23:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
80107f2a:	e8 ee f7 ff ff       	call   8010771d <ltr>
  if(p->pgdir == 0)
80107f2f:	8b 45 08             	mov    0x8(%ebp),%eax
80107f32:	8b 40 04             	mov    0x4(%eax),%eax
80107f35:	85 c0                	test   %eax,%eax
80107f37:	75 0c                	jne    80107f45 <switchuvm+0x146>
    panic("switchuvm: no pgdir");
80107f39:	c7 04 24 0b 8b 10 80 	movl   $0x80108b0b,(%esp)
80107f40:	e8 f5 85 ff ff       	call   8010053a <panic>
  lcr3(v2p(p->pgdir));  // switch to new address space
80107f45:	8b 45 08             	mov    0x8(%ebp),%eax
80107f48:	8b 40 04             	mov    0x4(%eax),%eax
80107f4b:	89 04 24             	mov    %eax,(%esp)
80107f4e:	e8 00 f8 ff ff       	call   80107753 <v2p>
80107f53:	89 04 24             	mov    %eax,(%esp)
80107f56:	e8 ed f7 ff ff       	call   80107748 <lcr3>
  popcli();
80107f5b:	e8 14 d1 ff ff       	call   80105074 <popcli>
}
80107f60:	83 c4 14             	add    $0x14,%esp
80107f63:	5b                   	pop    %ebx
80107f64:	5d                   	pop    %ebp
80107f65:	c3                   	ret    

80107f66 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80107f66:	55                   	push   %ebp
80107f67:	89 e5                	mov    %esp,%ebp
80107f69:	83 ec 38             	sub    $0x38,%esp
  char *mem;
  
  if(sz >= PGSIZE)
80107f6c:	81 7d 10 ff 0f 00 00 	cmpl   $0xfff,0x10(%ebp)
80107f73:	76 0c                	jbe    80107f81 <inituvm+0x1b>
    panic("inituvm: more than a page");
80107f75:	c7 04 24 1f 8b 10 80 	movl   $0x80108b1f,(%esp)
80107f7c:	e8 b9 85 ff ff       	call   8010053a <panic>
  mem = kalloc();
80107f81:	e8 78 ab ff ff       	call   80102afe <kalloc>
80107f86:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(mem, 0, PGSIZE);
80107f89:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107f90:	00 
80107f91:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107f98:	00 
80107f99:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107f9c:	89 04 24             	mov    %eax,(%esp)
80107f9f:	e8 8e d1 ff ff       	call   80105132 <memset>
  mappages(pgdir, 0, PGSIZE, v2p(mem), PTE_W|PTE_U);
80107fa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107fa7:	89 04 24             	mov    %eax,(%esp)
80107faa:	e8 a4 f7 ff ff       	call   80107753 <v2p>
80107faf:	c7 44 24 10 06 00 00 	movl   $0x6,0x10(%esp)
80107fb6:	00 
80107fb7:	89 44 24 0c          	mov    %eax,0xc(%esp)
80107fbb:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107fc2:	00 
80107fc3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107fca:	00 
80107fcb:	8b 45 08             	mov    0x8(%ebp),%eax
80107fce:	89 04 24             	mov    %eax,(%esp)
80107fd1:	e8 a3 fc ff ff       	call   80107c79 <mappages>
  memmove(mem, init, sz);
80107fd6:	8b 45 10             	mov    0x10(%ebp),%eax
80107fd9:	89 44 24 08          	mov    %eax,0x8(%esp)
80107fdd:	8b 45 0c             	mov    0xc(%ebp),%eax
80107fe0:	89 44 24 04          	mov    %eax,0x4(%esp)
80107fe4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107fe7:	89 04 24             	mov    %eax,(%esp)
80107fea:	e8 16 d2 ff ff       	call   80105205 <memmove>
}
80107fef:	c9                   	leave  
80107ff0:	c3                   	ret    

80107ff1 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80107ff1:	55                   	push   %ebp
80107ff2:	89 e5                	mov    %esp,%ebp
80107ff4:	53                   	push   %ebx
80107ff5:	83 ec 24             	sub    $0x24,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80107ff8:	8b 45 0c             	mov    0xc(%ebp),%eax
80107ffb:	25 ff 0f 00 00       	and    $0xfff,%eax
80108000:	85 c0                	test   %eax,%eax
80108002:	74 0c                	je     80108010 <loaduvm+0x1f>
    panic("loaduvm: addr must be page aligned");
80108004:	c7 04 24 3c 8b 10 80 	movl   $0x80108b3c,(%esp)
8010800b:	e8 2a 85 ff ff       	call   8010053a <panic>
  for(i = 0; i < sz; i += PGSIZE){
80108010:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
80108017:	e9 ae 00 00 00       	jmp    801080ca <loaduvm+0xd9>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
8010801c:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010801f:	8b 55 0c             	mov    0xc(%ebp),%edx
80108022:	8d 04 02             	lea    (%edx,%eax,1),%eax
80108025:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
8010802c:	00 
8010802d:	89 44 24 04          	mov    %eax,0x4(%esp)
80108031:	8b 45 08             	mov    0x8(%ebp),%eax
80108034:	89 04 24             	mov    %eax,(%esp)
80108037:	e8 a7 fb ff ff       	call   80107be3 <walkpgdir>
8010803c:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010803f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80108043:	75 0c                	jne    80108051 <loaduvm+0x60>
      panic("loaduvm: address should exist");
80108045:	c7 04 24 5f 8b 10 80 	movl   $0x80108b5f,(%esp)
8010804c:	e8 e9 84 ff ff       	call   8010053a <panic>
    pa = PTE_ADDR(*pte);
80108051:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108054:	8b 00                	mov    (%eax),%eax
80108056:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010805b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(sz - i < PGSIZE)
8010805e:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108061:	8b 55 18             	mov    0x18(%ebp),%edx
80108064:	89 d1                	mov    %edx,%ecx
80108066:	29 c1                	sub    %eax,%ecx
80108068:	89 c8                	mov    %ecx,%eax
8010806a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
8010806f:	77 11                	ja     80108082 <loaduvm+0x91>
      n = sz - i;
80108071:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108074:	8b 55 18             	mov    0x18(%ebp),%edx
80108077:	89 d1                	mov    %edx,%ecx
80108079:	29 c1                	sub    %eax,%ecx
8010807b:	89 c8                	mov    %ecx,%eax
8010807d:	89 45 f0             	mov    %eax,-0x10(%ebp)
80108080:	eb 07                	jmp    80108089 <loaduvm+0x98>
    else
      n = PGSIZE;
80108082:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
    if(readi(ip, p2v(pa), offset+i, n) != n)
80108089:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010808c:	8b 55 14             	mov    0x14(%ebp),%edx
8010808f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
80108092:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108095:	89 04 24             	mov    %eax,(%esp)
80108098:	e8 c3 f6 ff ff       	call   80107760 <p2v>
8010809d:	8b 55 f0             	mov    -0x10(%ebp),%edx
801080a0:	89 54 24 0c          	mov    %edx,0xc(%esp)
801080a4:	89 5c 24 08          	mov    %ebx,0x8(%esp)
801080a8:	89 44 24 04          	mov    %eax,0x4(%esp)
801080ac:	8b 45 10             	mov    0x10(%ebp),%eax
801080af:	89 04 24             	mov    %eax,(%esp)
801080b2:	e8 b1 9c ff ff       	call   80101d68 <readi>
801080b7:	3b 45 f0             	cmp    -0x10(%ebp),%eax
801080ba:	74 07                	je     801080c3 <loaduvm+0xd2>
      return -1;
801080bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801080c1:	eb 18                	jmp    801080db <loaduvm+0xea>
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
801080c3:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
801080ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
801080cd:	3b 45 18             	cmp    0x18(%ebp),%eax
801080d0:	0f 82 46 ff ff ff    	jb     8010801c <loaduvm+0x2b>
    else
      n = PGSIZE;
    if(readi(ip, p2v(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
801080d6:	b8 00 00 00 00       	mov    $0x0,%eax
}
801080db:	83 c4 24             	add    $0x24,%esp
801080de:	5b                   	pop    %ebx
801080df:	5d                   	pop    %ebp
801080e0:	c3                   	ret    

801080e1 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
801080e1:	55                   	push   %ebp
801080e2:	89 e5                	mov    %esp,%ebp
801080e4:	83 ec 38             	sub    $0x38,%esp
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
801080e7:	8b 45 10             	mov    0x10(%ebp),%eax
801080ea:	85 c0                	test   %eax,%eax
801080ec:	79 0a                	jns    801080f8 <allocuvm+0x17>
    return 0;
801080ee:	b8 00 00 00 00       	mov    $0x0,%eax
801080f3:	e9 c1 00 00 00       	jmp    801081b9 <allocuvm+0xd8>
  if(newsz < oldsz)
801080f8:	8b 45 10             	mov    0x10(%ebp),%eax
801080fb:	3b 45 0c             	cmp    0xc(%ebp),%eax
801080fe:	73 08                	jae    80108108 <allocuvm+0x27>
    return oldsz;
80108100:	8b 45 0c             	mov    0xc(%ebp),%eax
80108103:	e9 b1 00 00 00       	jmp    801081b9 <allocuvm+0xd8>

  a = PGROUNDUP(oldsz);
80108108:	8b 45 0c             	mov    0xc(%ebp),%eax
8010810b:	05 ff 0f 00 00       	add    $0xfff,%eax
80108110:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108115:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(; a < newsz; a += PGSIZE){
80108118:	e9 8d 00 00 00       	jmp    801081aa <allocuvm+0xc9>
    mem = kalloc();
8010811d:	e8 dc a9 ff ff       	call   80102afe <kalloc>
80108122:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(mem == 0){
80108125:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80108129:	75 2c                	jne    80108157 <allocuvm+0x76>
      cprintf("allocuvm out of memory\n");
8010812b:	c7 04 24 7d 8b 10 80 	movl   $0x80108b7d,(%esp)
80108132:	e8 63 82 ff ff       	call   8010039a <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
80108137:	8b 45 0c             	mov    0xc(%ebp),%eax
8010813a:	89 44 24 08          	mov    %eax,0x8(%esp)
8010813e:	8b 45 10             	mov    0x10(%ebp),%eax
80108141:	89 44 24 04          	mov    %eax,0x4(%esp)
80108145:	8b 45 08             	mov    0x8(%ebp),%eax
80108148:	89 04 24             	mov    %eax,(%esp)
8010814b:	e8 6b 00 00 00       	call   801081bb <deallocuvm>
      return 0;
80108150:	b8 00 00 00 00       	mov    $0x0,%eax
80108155:	eb 62                	jmp    801081b9 <allocuvm+0xd8>
    }
    memset(mem, 0, PGSIZE);
80108157:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010815e:	00 
8010815f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80108166:	00 
80108167:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010816a:	89 04 24             	mov    %eax,(%esp)
8010816d:	e8 c0 cf ff ff       	call   80105132 <memset>
    mappages(pgdir, (char*)a, PGSIZE, v2p(mem), PTE_W|PTE_U);
80108172:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108175:	89 04 24             	mov    %eax,(%esp)
80108178:	e8 d6 f5 ff ff       	call   80107753 <v2p>
8010817d:	8b 55 f4             	mov    -0xc(%ebp),%edx
80108180:	c7 44 24 10 06 00 00 	movl   $0x6,0x10(%esp)
80108187:	00 
80108188:	89 44 24 0c          	mov    %eax,0xc(%esp)
8010818c:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80108193:	00 
80108194:	89 54 24 04          	mov    %edx,0x4(%esp)
80108198:	8b 45 08             	mov    0x8(%ebp),%eax
8010819b:	89 04 24             	mov    %eax,(%esp)
8010819e:	e8 d6 fa ff ff       	call   80107c79 <mappages>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
801081a3:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
801081aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
801081ad:	3b 45 10             	cmp    0x10(%ebp),%eax
801081b0:	0f 82 67 ff ff ff    	jb     8010811d <allocuvm+0x3c>
      return 0;
    }
    memset(mem, 0, PGSIZE);
    mappages(pgdir, (char*)a, PGSIZE, v2p(mem), PTE_W|PTE_U);
  }
  return newsz;
801081b6:	8b 45 10             	mov    0x10(%ebp),%eax
}
801081b9:	c9                   	leave  
801081ba:	c3                   	ret    

801081bb <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
801081bb:	55                   	push   %ebp
801081bc:	89 e5                	mov    %esp,%ebp
801081be:	83 ec 28             	sub    $0x28,%esp
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
801081c1:	8b 45 10             	mov    0x10(%ebp),%eax
801081c4:	3b 45 0c             	cmp    0xc(%ebp),%eax
801081c7:	72 08                	jb     801081d1 <deallocuvm+0x16>
    return oldsz;
801081c9:	8b 45 0c             	mov    0xc(%ebp),%eax
801081cc:	e9 a4 00 00 00       	jmp    80108275 <deallocuvm+0xba>

  a = PGROUNDUP(newsz);
801081d1:	8b 45 10             	mov    0x10(%ebp),%eax
801081d4:	05 ff 0f 00 00       	add    $0xfff,%eax
801081d9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801081de:	89 45 ec             	mov    %eax,-0x14(%ebp)
  for(; a  < oldsz; a += PGSIZE){
801081e1:	e9 80 00 00 00       	jmp    80108266 <deallocuvm+0xab>
    pte = walkpgdir(pgdir, (char*)a, 0);
801081e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
801081e9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801081f0:	00 
801081f1:	89 44 24 04          	mov    %eax,0x4(%esp)
801081f5:	8b 45 08             	mov    0x8(%ebp),%eax
801081f8:	89 04 24             	mov    %eax,(%esp)
801081fb:	e8 e3 f9 ff ff       	call   80107be3 <walkpgdir>
80108200:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(!pte)
80108203:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80108207:	75 09                	jne    80108212 <deallocuvm+0x57>
      a += (NPTENTRIES - 1) * PGSIZE;
80108209:	81 45 ec 00 f0 3f 00 	addl   $0x3ff000,-0x14(%ebp)
80108210:	eb 4d                	jmp    8010825f <deallocuvm+0xa4>
    else if((*pte & PTE_P) != 0){
80108212:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108215:	8b 00                	mov    (%eax),%eax
80108217:	83 e0 01             	and    $0x1,%eax
8010821a:	84 c0                	test   %al,%al
8010821c:	74 41                	je     8010825f <deallocuvm+0xa4>
      pa = PTE_ADDR(*pte);
8010821e:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108221:	8b 00                	mov    (%eax),%eax
80108223:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108228:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(pa == 0)
8010822b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010822f:	75 0c                	jne    8010823d <deallocuvm+0x82>
        panic("kfree");
80108231:	c7 04 24 95 8b 10 80 	movl   $0x80108b95,(%esp)
80108238:	e8 fd 82 ff ff       	call   8010053a <panic>
      char *v = p2v(pa);
8010823d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108240:	89 04 24             	mov    %eax,(%esp)
80108243:	e8 18 f5 ff ff       	call   80107760 <p2v>
80108248:	89 45 f4             	mov    %eax,-0xc(%ebp)
      kfree(v);
8010824b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010824e:	89 04 24             	mov    %eax,(%esp)
80108251:	e8 0f a8 ff ff       	call   80102a65 <kfree>
      *pte = 0;
80108256:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108259:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010825f:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
80108266:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108269:	3b 45 0c             	cmp    0xc(%ebp),%eax
8010826c:	0f 82 74 ff ff ff    	jb     801081e6 <deallocuvm+0x2b>
      char *v = p2v(pa);
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
80108272:	8b 45 10             	mov    0x10(%ebp),%eax
}
80108275:	c9                   	leave  
80108276:	c3                   	ret    

80108277 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80108277:	55                   	push   %ebp
80108278:	89 e5                	mov    %esp,%ebp
8010827a:	83 ec 28             	sub    $0x28,%esp
  uint i;

  if(pgdir == 0)
8010827d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
80108281:	75 0c                	jne    8010828f <freevm+0x18>
    panic("freevm: no pgdir");
80108283:	c7 04 24 9b 8b 10 80 	movl   $0x80108b9b,(%esp)
8010828a:	e8 ab 82 ff ff       	call   8010053a <panic>
  deallocuvm(pgdir, KERNBASE, 0);
8010828f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80108296:	00 
80108297:	c7 44 24 04 00 00 00 	movl   $0x80000000,0x4(%esp)
8010829e:	80 
8010829f:	8b 45 08             	mov    0x8(%ebp),%eax
801082a2:	89 04 24             	mov    %eax,(%esp)
801082a5:	e8 11 ff ff ff       	call   801081bb <deallocuvm>
  for(i = 0; i < NPDENTRIES; i++){
801082aa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
801082b1:	eb 3c                	jmp    801082ef <freevm+0x78>
    if(pgdir[i] & PTE_P){
801082b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
801082b6:	c1 e0 02             	shl    $0x2,%eax
801082b9:	03 45 08             	add    0x8(%ebp),%eax
801082bc:	8b 00                	mov    (%eax),%eax
801082be:	83 e0 01             	and    $0x1,%eax
801082c1:	84 c0                	test   %al,%al
801082c3:	74 26                	je     801082eb <freevm+0x74>
      char * v = p2v(PTE_ADDR(pgdir[i]));
801082c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
801082c8:	c1 e0 02             	shl    $0x2,%eax
801082cb:	03 45 08             	add    0x8(%ebp),%eax
801082ce:	8b 00                	mov    (%eax),%eax
801082d0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801082d5:	89 04 24             	mov    %eax,(%esp)
801082d8:	e8 83 f4 ff ff       	call   80107760 <p2v>
801082dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
      kfree(v);
801082e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801082e3:	89 04 24             	mov    %eax,(%esp)
801082e6:	e8 7a a7 ff ff       	call   80102a65 <kfree>
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
801082eb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
801082ef:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
801082f6:	76 bb                	jbe    801082b3 <freevm+0x3c>
    if(pgdir[i] & PTE_P){
      char * v = p2v(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
801082f8:	8b 45 08             	mov    0x8(%ebp),%eax
801082fb:	89 04 24             	mov    %eax,(%esp)
801082fe:	e8 62 a7 ff ff       	call   80102a65 <kfree>
}
80108303:	c9                   	leave  
80108304:	c3                   	ret    

80108305 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80108305:	55                   	push   %ebp
80108306:	89 e5                	mov    %esp,%ebp
80108308:	83 ec 28             	sub    $0x28,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
8010830b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80108312:	00 
80108313:	8b 45 0c             	mov    0xc(%ebp),%eax
80108316:	89 44 24 04          	mov    %eax,0x4(%esp)
8010831a:	8b 45 08             	mov    0x8(%ebp),%eax
8010831d:	89 04 24             	mov    %eax,(%esp)
80108320:	e8 be f8 ff ff       	call   80107be3 <walkpgdir>
80108325:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pte == 0)
80108328:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010832c:	75 0c                	jne    8010833a <clearpteu+0x35>
    panic("clearpteu");
8010832e:	c7 04 24 ac 8b 10 80 	movl   $0x80108bac,(%esp)
80108335:	e8 00 82 ff ff       	call   8010053a <panic>
  *pte &= ~PTE_U;
8010833a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010833d:	8b 00                	mov    (%eax),%eax
8010833f:	89 c2                	mov    %eax,%edx
80108341:	83 e2 fb             	and    $0xfffffffb,%edx
80108344:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108347:	89 10                	mov    %edx,(%eax)
}
80108349:	c9                   	leave  
8010834a:	c3                   	ret    

8010834b <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
8010834b:	55                   	push   %ebp
8010834c:	89 e5                	mov    %esp,%ebp
8010834e:	53                   	push   %ebx
8010834f:	83 ec 44             	sub    $0x44,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80108352:	e8 b6 f9 ff ff       	call   80107d0d <setupkvm>
80108357:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010835a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
8010835e:	75 0a                	jne    8010836a <copyuvm+0x1f>
    return 0;
80108360:	b8 00 00 00 00       	mov    $0x0,%eax
80108365:	e9 fd 00 00 00       	jmp    80108467 <copyuvm+0x11c>
  for(i = 0; i < sz; i += PGSIZE){
8010836a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80108371:	e9 cc 00 00 00       	jmp    80108442 <copyuvm+0xf7>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80108376:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108379:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80108380:	00 
80108381:	89 44 24 04          	mov    %eax,0x4(%esp)
80108385:	8b 45 08             	mov    0x8(%ebp),%eax
80108388:	89 04 24             	mov    %eax,(%esp)
8010838b:	e8 53 f8 ff ff       	call   80107be3 <walkpgdir>
80108390:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80108393:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80108397:	75 0c                	jne    801083a5 <copyuvm+0x5a>
      panic("copyuvm: pte should exist");
80108399:	c7 04 24 b6 8b 10 80 	movl   $0x80108bb6,(%esp)
801083a0:	e8 95 81 ff ff       	call   8010053a <panic>
    if(!(*pte & PTE_P))
801083a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801083a8:	8b 00                	mov    (%eax),%eax
801083aa:	83 e0 01             	and    $0x1,%eax
801083ad:	85 c0                	test   %eax,%eax
801083af:	75 0c                	jne    801083bd <copyuvm+0x72>
      panic("copyuvm: page not present");
801083b1:	c7 04 24 d0 8b 10 80 	movl   $0x80108bd0,(%esp)
801083b8:	e8 7d 81 ff ff       	call   8010053a <panic>
    pa = PTE_ADDR(*pte);
801083bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801083c0:	8b 00                	mov    (%eax),%eax
801083c2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801083c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    flags = PTE_FLAGS(*pte);
801083ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801083cd:	8b 00                	mov    (%eax),%eax
801083cf:	25 ff 0f 00 00       	and    $0xfff,%eax
801083d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((mem = kalloc()) == 0)
801083d7:	e8 22 a7 ff ff       	call   80102afe <kalloc>
801083dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
801083df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801083e3:	74 6e                	je     80108453 <copyuvm+0x108>
      goto bad;
    memmove(mem, (char*)p2v(pa), PGSIZE);
801083e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
801083e8:	89 04 24             	mov    %eax,(%esp)
801083eb:	e8 70 f3 ff ff       	call   80107760 <p2v>
801083f0:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
801083f7:	00 
801083f8:	89 44 24 04          	mov    %eax,0x4(%esp)
801083fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801083ff:	89 04 24             	mov    %eax,(%esp)
80108402:	e8 fe cd ff ff       	call   80105205 <memmove>
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), flags) < 0)
80108407:	8b 5d f0             	mov    -0x10(%ebp),%ebx
8010840a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010840d:	89 04 24             	mov    %eax,(%esp)
80108410:	e8 3e f3 ff ff       	call   80107753 <v2p>
80108415:	8b 55 ec             	mov    -0x14(%ebp),%edx
80108418:	89 5c 24 10          	mov    %ebx,0x10(%esp)
8010841c:	89 44 24 0c          	mov    %eax,0xc(%esp)
80108420:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80108427:	00 
80108428:	89 54 24 04          	mov    %edx,0x4(%esp)
8010842c:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010842f:	89 04 24             	mov    %eax,(%esp)
80108432:	e8 42 f8 ff ff       	call   80107c79 <mappages>
80108437:	85 c0                	test   %eax,%eax
80108439:	78 1b                	js     80108456 <copyuvm+0x10b>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
8010843b:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
80108442:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108445:	3b 45 0c             	cmp    0xc(%ebp),%eax
80108448:	0f 82 28 ff ff ff    	jb     80108376 <copyuvm+0x2b>
      goto bad;
    memmove(mem, (char*)p2v(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), flags) < 0)
      goto bad;
  }
  return d;
8010844e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80108451:	eb 14                	jmp    80108467 <copyuvm+0x11c>
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
80108453:	90                   	nop
80108454:	eb 01                	jmp    80108457 <copyuvm+0x10c>
    memmove(mem, (char*)p2v(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), flags) < 0)
      goto bad;
80108456:	90                   	nop
  }
  return d;

bad:
  freevm(d);
80108457:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010845a:	89 04 24             	mov    %eax,(%esp)
8010845d:	e8 15 fe ff ff       	call   80108277 <freevm>
  return 0;
80108462:	b8 00 00 00 00       	mov    $0x0,%eax
}
80108467:	83 c4 44             	add    $0x44,%esp
8010846a:	5b                   	pop    %ebx
8010846b:	5d                   	pop    %ebp
8010846c:	c3                   	ret    

8010846d <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
8010846d:	55                   	push   %ebp
8010846e:	89 e5                	mov    %esp,%ebp
80108470:	83 ec 28             	sub    $0x28,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80108473:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
8010847a:	00 
8010847b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010847e:	89 44 24 04          	mov    %eax,0x4(%esp)
80108482:	8b 45 08             	mov    0x8(%ebp),%eax
80108485:	89 04 24             	mov    %eax,(%esp)
80108488:	e8 56 f7 ff ff       	call   80107be3 <walkpgdir>
8010848d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((*pte & PTE_P) == 0)
80108490:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108493:	8b 00                	mov    (%eax),%eax
80108495:	83 e0 01             	and    $0x1,%eax
80108498:	85 c0                	test   %eax,%eax
8010849a:	75 07                	jne    801084a3 <uva2ka+0x36>
    return 0;
8010849c:	b8 00 00 00 00       	mov    $0x0,%eax
801084a1:	eb 25                	jmp    801084c8 <uva2ka+0x5b>
  if((*pte & PTE_U) == 0)
801084a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801084a6:	8b 00                	mov    (%eax),%eax
801084a8:	83 e0 04             	and    $0x4,%eax
801084ab:	85 c0                	test   %eax,%eax
801084ad:	75 07                	jne    801084b6 <uva2ka+0x49>
    return 0;
801084af:	b8 00 00 00 00       	mov    $0x0,%eax
801084b4:	eb 12                	jmp    801084c8 <uva2ka+0x5b>
  return (char*)p2v(PTE_ADDR(*pte));
801084b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801084b9:	8b 00                	mov    (%eax),%eax
801084bb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801084c0:	89 04 24             	mov    %eax,(%esp)
801084c3:	e8 98 f2 ff ff       	call   80107760 <p2v>
}
801084c8:	c9                   	leave  
801084c9:	c3                   	ret    

801084ca <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
801084ca:	55                   	push   %ebp
801084cb:	89 e5                	mov    %esp,%ebp
801084cd:	83 ec 28             	sub    $0x28,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
801084d0:	8b 45 10             	mov    0x10(%ebp),%eax
801084d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  while(len > 0){
801084d6:	e9 8b 00 00 00       	jmp    80108566 <copyout+0x9c>
    va0 = (uint)PGROUNDDOWN(va);
801084db:	8b 45 0c             	mov    0xc(%ebp),%eax
801084de:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801084e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    pa0 = uva2ka(pgdir, (char*)va0);
801084e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801084e9:	89 44 24 04          	mov    %eax,0x4(%esp)
801084ed:	8b 45 08             	mov    0x8(%ebp),%eax
801084f0:	89 04 24             	mov    %eax,(%esp)
801084f3:	e8 75 ff ff ff       	call   8010846d <uva2ka>
801084f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pa0 == 0)
801084fb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
801084ff:	75 07                	jne    80108508 <copyout+0x3e>
      return -1;
80108501:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80108506:	eb 6d                	jmp    80108575 <copyout+0xab>
    n = PGSIZE - (va - va0);
80108508:	8b 45 0c             	mov    0xc(%ebp),%eax
8010850b:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010850e:	89 d1                	mov    %edx,%ecx
80108510:	29 c1                	sub    %eax,%ecx
80108512:	89 c8                	mov    %ecx,%eax
80108514:	05 00 10 00 00       	add    $0x1000,%eax
80108519:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(n > len)
8010851c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010851f:	3b 45 14             	cmp    0x14(%ebp),%eax
80108522:	76 06                	jbe    8010852a <copyout+0x60>
      n = len;
80108524:	8b 45 14             	mov    0x14(%ebp),%eax
80108527:	89 45 f0             	mov    %eax,-0x10(%ebp)
    memmove(pa0 + (va - va0), buf, n);
8010852a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010852d:	8b 55 0c             	mov    0xc(%ebp),%edx
80108530:	89 d1                	mov    %edx,%ecx
80108532:	29 c1                	sub    %eax,%ecx
80108534:	89 c8                	mov    %ecx,%eax
80108536:	03 45 ec             	add    -0x14(%ebp),%eax
80108539:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010853c:	89 54 24 08          	mov    %edx,0x8(%esp)
80108540:	8b 55 e8             	mov    -0x18(%ebp),%edx
80108543:	89 54 24 04          	mov    %edx,0x4(%esp)
80108547:	89 04 24             	mov    %eax,(%esp)
8010854a:	e8 b6 cc ff ff       	call   80105205 <memmove>
    len -= n;
8010854f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108552:	29 45 14             	sub    %eax,0x14(%ebp)
    buf += n;
80108555:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108558:	01 45 e8             	add    %eax,-0x18(%ebp)
    va = va0 + PGSIZE;
8010855b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010855e:	05 00 10 00 00       	add    $0x1000,%eax
80108563:	89 45 0c             	mov    %eax,0xc(%ebp)
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80108566:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
8010856a:	0f 85 6b ff ff ff    	jne    801084db <copyout+0x11>
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
80108570:	b8 00 00 00 00       	mov    $0x0,%eax
}
80108575:	c9                   	leave  
80108576:	c3                   	ret    
