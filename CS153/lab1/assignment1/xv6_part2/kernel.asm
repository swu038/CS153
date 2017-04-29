
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
8010003a:	c7 44 24 04 c4 83 10 	movl   $0x801083c4,0x4(%esp)
80100041:	80 
80100042:	c7 04 24 80 c6 10 80 	movl   $0x8010c680,(%esp)
80100049:	e8 08 4d 00 00       	call   80104d56 <initlock>
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
801000be:	e8 b4 4c 00 00       	call   80104d77 <acquire>
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
80100105:	e8 ce 4c 00 00       	call   80104dd8 <release>
8010010a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010010d:	e9 93 00 00 00       	jmp    801001a5 <bget+0xf4>
80100112:	c7 44 24 04 80 c6 10 	movl   $0x8010c680,0x4(%esp)
80100119:	80 
8010011a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010011d:	89 04 24             	mov    %eax,(%esp)
80100120:	e8 7a 49 00 00       	call   80104a9f <sleep>
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
8010017d:	e8 56 4c 00 00       	call   80104dd8 <release>
80100182:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100185:	eb 1e                	jmp    801001a5 <bget+0xf4>
80100187:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010018a:	8b 40 0c             	mov    0xc(%eax),%eax
8010018d:	89 45 f4             	mov    %eax,-0xc(%ebp)
80100190:	81 7d f4 a4 db 10 80 	cmpl   $0x8010dba4,-0xc(%ebp)
80100197:	75 aa                	jne    80100143 <bget+0x92>
80100199:	c7 04 24 cb 83 10 80 	movl   $0x801083cb,(%esp)
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
801001f0:	c7 04 24 dc 83 10 80 	movl   $0x801083dc,(%esp)
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
8010022a:	c7 04 24 e3 83 10 80 	movl   $0x801083e3,(%esp)
80100231:	e8 04 03 00 00       	call   8010053a <panic>
80100236:	c7 04 24 80 c6 10 80 	movl   $0x8010c680,(%esp)
8010023d:	e8 35 4b 00 00       	call   80104d77 <acquire>
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
8010029e:	e8 d9 48 00 00       	call   80104b7c <wakeup>
801002a3:	c7 04 24 80 c6 10 80 	movl   $0x8010c680,(%esp)
801002aa:	e8 29 4b 00 00       	call   80104dd8 <release>
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
801003b5:	e8 bd 49 00 00       	call   80104d77 <acquire>

  if (fmt == 0)
801003ba:	8b 45 08             	mov    0x8(%ebp),%eax
801003bd:	85 c0                	test   %eax,%eax
801003bf:	75 0c                	jne    801003cd <cprintf+0x33>
    panic("null fmt");
801003c1:	c7 04 24 ea 83 10 80 	movl   $0x801083ea,(%esp)
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
801004ac:	c7 45 f4 f3 83 10 80 	movl   $0x801083f3,-0xc(%ebp)
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
80100533:	e8 a0 48 00 00       	call   80104dd8 <release>
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
8010055f:	c7 04 24 fa 83 10 80 	movl   $0x801083fa,(%esp)
80100566:	e8 2f fe ff ff       	call   8010039a <cprintf>
  cprintf(s);
8010056b:	8b 45 08             	mov    0x8(%ebp),%eax
8010056e:	89 04 24             	mov    %eax,(%esp)
80100571:	e8 24 fe ff ff       	call   8010039a <cprintf>
  cprintf("\n");
80100576:	c7 04 24 09 84 10 80 	movl   $0x80108409,(%esp)
8010057d:	e8 18 fe ff ff       	call   8010039a <cprintf>
  getcallerpcs(&s, pcs);
80100582:	8d 45 cc             	lea    -0x34(%ebp),%eax
80100585:	89 44 24 04          	mov    %eax,0x4(%esp)
80100589:	8d 45 08             	lea    0x8(%ebp),%eax
8010058c:	89 04 24             	mov    %eax,(%esp)
8010058f:	e8 93 48 00 00       	call   80104e27 <getcallerpcs>
  for(i=0; i<10; i++)
80100594:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
8010059b:	eb 1b                	jmp    801005b8 <panic+0x7e>
    cprintf(" %p", pcs[i]);
8010059d:	8b 45 f4             	mov    -0xc(%ebp),%eax
801005a0:	8b 44 85 cc          	mov    -0x34(%ebp,%eax,4),%eax
801005a4:	89 44 24 04          	mov    %eax,0x4(%esp)
801005a8:	c7 04 24 0b 84 10 80 	movl   $0x8010840b,(%esp)
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
801006b0:	e8 e4 49 00 00       	call   80105099 <memmove>
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
801006df:	e8 e2 48 00 00       	call   80104fc6 <memset>
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
80100774:	e8 9b 62 00 00       	call   80106a14 <uartputc>
80100779:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100780:	e8 8f 62 00 00       	call   80106a14 <uartputc>
80100785:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
8010078c:	e8 83 62 00 00       	call   80106a14 <uartputc>
80100791:	eb 0b                	jmp    8010079e <consputc+0x50>
  } else
    uartputc(c);
80100793:	8b 45 08             	mov    0x8(%ebp),%eax
80100796:	89 04 24             	mov    %eax,(%esp)
80100799:	e8 76 62 00 00       	call   80106a14 <uartputc>
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
801007b8:	e8 ba 45 00 00       	call   80104d77 <acquire>
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
801007e8:	e8 36 44 00 00       	call   80104c23 <procdump>
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
801008f5:	e8 82 42 00 00       	call   80104b7c <wakeup>
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
80100919:	e8 ba 44 00 00       	call   80104dd8 <release>
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
8010093e:	e8 34 44 00 00       	call   80104d77 <acquire>
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
8010095c:	e8 77 44 00 00       	call   80104dd8 <release>
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
80100985:	e8 15 41 00 00       	call   80104a9f <sleep>
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
80100a03:	e8 d0 43 00 00       	call   80104dd8 <release>
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
80100a39:	e8 39 43 00 00       	call   80104d77 <acquire>
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
80100a73:	e8 60 43 00 00       	call   80104dd8 <release>
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
80100a8e:	c7 44 24 04 0f 84 10 	movl   $0x8010840f,0x4(%esp)
80100a95:	80 
80100a96:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
80100a9d:	e8 b4 42 00 00       	call   80104d56 <initlock>
  initlock(&input.lock, "input");
80100aa2:	c7 44 24 04 17 84 10 	movl   $0x80108417,0x4(%esp)
80100aa9:	80 
80100aaa:	c7 04 24 c0 dd 10 80 	movl   $0x8010ddc0,(%esp)
80100ab1:	e8 a0 42 00 00       	call   80104d56 <initlock>

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
80100b70:	e8 e4 6f 00 00       	call   80107b59 <setupkvm>
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
80100c0e:	e8 1a 73 00 00       	call   80107f2d <allocuvm>
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
80100c4b:	e8 ed 71 00 00       	call   80107e3d <loaduvm>
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
80100cb6:	e8 72 72 00 00       	call   80107f2d <allocuvm>
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
80100cda:	e8 72 74 00 00       	call   80108151 <clearpteu>
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
80100d09:	e8 39 45 00 00       	call   80105247 <strlen>
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
80100d27:	e8 1b 45 00 00       	call   80105247 <strlen>
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
80100d51:	e8 c0 75 00 00       	call   80108316 <copyout>
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
80100df1:	e8 20 75 00 00       	call   80108316 <copyout>
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
80100e48:	e8 ac 43 00 00       	call   801051f9 <safestrcpy>

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
80100e9a:	e8 ac 6d 00 00       	call   80107c4b <switchuvm>
  freevm(oldpgdir);
80100e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100ea2:	89 04 24             	mov    %eax,(%esp)
80100ea5:	e8 19 72 00 00       	call   801080c3 <freevm>
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
80100edc:	e8 e2 71 00 00       	call   801080c3 <freevm>
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
80100f02:	c7 44 24 04 1d 84 10 	movl   $0x8010841d,0x4(%esp)
80100f09:	80 
80100f0a:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100f11:	e8 40 3e 00 00       	call   80104d56 <initlock>
80100f16:	c9                   	leave  
80100f17:	c3                   	ret    

80100f18 <filealloc>:
80100f18:	55                   	push   %ebp
80100f19:	89 e5                	mov    %esp,%ebp
80100f1b:	83 ec 28             	sub    $0x28,%esp
80100f1e:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100f25:	e8 4d 3e 00 00       	call   80104d77 <acquire>
80100f2a:	c7 45 f4 b4 de 10 80 	movl   $0x8010deb4,-0xc(%ebp)
80100f31:	eb 29                	jmp    80100f5c <filealloc+0x44>
80100f33:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f36:	8b 40 04             	mov    0x4(%eax),%eax
80100f39:	85 c0                	test   %eax,%eax
80100f3b:	75 1b                	jne    80100f58 <filealloc+0x40>
80100f3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f40:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
80100f47:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100f4e:	e8 85 3e 00 00       	call   80104dd8 <release>
80100f53:	8b 45 f4             	mov    -0xc(%ebp),%eax
80100f56:	eb 1f                	jmp    80100f77 <filealloc+0x5f>
80100f58:	83 45 f4 18          	addl   $0x18,-0xc(%ebp)
80100f5c:	b8 14 e8 10 80       	mov    $0x8010e814,%eax
80100f61:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80100f64:	72 cd                	jb     80100f33 <filealloc+0x1b>
80100f66:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100f6d:	e8 66 3e 00 00       	call   80104dd8 <release>
80100f72:	b8 00 00 00 00       	mov    $0x0,%eax
80100f77:	c9                   	leave  
80100f78:	c3                   	ret    

80100f79 <filedup>:
80100f79:	55                   	push   %ebp
80100f7a:	89 e5                	mov    %esp,%ebp
80100f7c:	83 ec 18             	sub    $0x18,%esp
80100f7f:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100f86:	e8 ec 3d 00 00       	call   80104d77 <acquire>
80100f8b:	8b 45 08             	mov    0x8(%ebp),%eax
80100f8e:	8b 40 04             	mov    0x4(%eax),%eax
80100f91:	85 c0                	test   %eax,%eax
80100f93:	7f 0c                	jg     80100fa1 <filedup+0x28>
80100f95:	c7 04 24 24 84 10 80 	movl   $0x80108424,(%esp)
80100f9c:	e8 99 f5 ff ff       	call   8010053a <panic>
80100fa1:	8b 45 08             	mov    0x8(%ebp),%eax
80100fa4:	8b 40 04             	mov    0x4(%eax),%eax
80100fa7:	8d 50 01             	lea    0x1(%eax),%edx
80100faa:	8b 45 08             	mov    0x8(%ebp),%eax
80100fad:	89 50 04             	mov    %edx,0x4(%eax)
80100fb0:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100fb7:	e8 1c 3e 00 00       	call   80104dd8 <release>
80100fbc:	8b 45 08             	mov    0x8(%ebp),%eax
80100fbf:	c9                   	leave  
80100fc0:	c3                   	ret    

80100fc1 <fileclose>:
80100fc1:	55                   	push   %ebp
80100fc2:	89 e5                	mov    %esp,%ebp
80100fc4:	83 ec 38             	sub    $0x38,%esp
80100fc7:	c7 04 24 80 de 10 80 	movl   $0x8010de80,(%esp)
80100fce:	e8 a4 3d 00 00       	call   80104d77 <acquire>
80100fd3:	8b 45 08             	mov    0x8(%ebp),%eax
80100fd6:	8b 40 04             	mov    0x4(%eax),%eax
80100fd9:	85 c0                	test   %eax,%eax
80100fdb:	7f 0c                	jg     80100fe9 <fileclose+0x28>
80100fdd:	c7 04 24 2c 84 10 80 	movl   $0x8010842c,(%esp)
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
80101009:	e8 ca 3d 00 00       	call   80104dd8 <release>
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
80101053:	e8 80 3d 00 00       	call   80104dd8 <release>
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
80101194:	c7 04 24 36 84 10 80 	movl   $0x80108436,(%esp)
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
801012a0:	c7 04 24 3f 84 10 80 	movl   $0x8010843f,(%esp)
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
801012d5:	c7 04 24 4f 84 10 80 	movl   $0x8010844f,(%esp)
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
8010131c:	e8 78 3d 00 00       	call   80105099 <memmove>
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
80101362:	e8 5f 3c 00 00       	call   80104fc6 <memset>
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
801014ce:	c7 04 24 59 84 10 80 	movl   $0x80108459,(%esp)
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
80101566:	c7 04 24 6f 84 10 80 	movl   $0x8010846f,(%esp)
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
801015bc:	c7 44 24 04 82 84 10 	movl   $0x80108482,0x4(%esp)
801015c3:	80 
801015c4:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
801015cb:	e8 86 37 00 00       	call   80104d56 <initlock>
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
8010164d:	e8 74 39 00 00       	call   80104fc6 <memset>
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
801016a3:	c7 04 24 89 84 10 80 	movl   $0x80108489,(%esp)
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
8010174d:	e8 47 39 00 00       	call   80105099 <memmove>
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
80101777:	e8 fb 35 00 00       	call   80104d77 <acquire>

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
801017c1:	e8 12 36 00 00       	call   80104dd8 <release>
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
801017f5:	c7 04 24 9b 84 10 80 	movl   $0x8010849b,(%esp)
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
80101833:	e8 a0 35 00 00       	call   80104dd8 <release>

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
8010184a:	e8 28 35 00 00       	call   80104d77 <acquire>
  ip->ref++;
8010184f:	8b 45 08             	mov    0x8(%ebp),%eax
80101852:	8b 40 08             	mov    0x8(%eax),%eax
80101855:	8d 50 01             	lea    0x1(%eax),%edx
80101858:	8b 45 08             	mov    0x8(%ebp),%eax
8010185b:	89 50 08             	mov    %edx,0x8(%eax)
  release(&icache.lock);
8010185e:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101865:	e8 6e 35 00 00       	call   80104dd8 <release>
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
80101885:	c7 04 24 ab 84 10 80 	movl   $0x801084ab,(%esp)
8010188c:	e8 a9 ec ff ff       	call   8010053a <panic>

  acquire(&icache.lock);
80101891:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101898:	e8 da 34 00 00       	call   80104d77 <acquire>
  while(ip->flags & I_BUSY)
8010189d:	eb 13                	jmp    801018b2 <ilock+0x43>
    sleep(ip, &icache.lock);
8010189f:	c7 44 24 04 80 e8 10 	movl   $0x8010e880,0x4(%esp)
801018a6:	80 
801018a7:	8b 45 08             	mov    0x8(%ebp),%eax
801018aa:	89 04 24             	mov    %eax,(%esp)
801018ad:	e8 ed 31 00 00       	call   80104a9f <sleep>

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
801018d7:	e8 fc 34 00 00       	call   80104dd8 <release>

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
80101985:	e8 0f 37 00 00       	call   80105099 <memmove>
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
801019b2:	c7 04 24 b1 84 10 80 	movl   $0x801084b1,(%esp)
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
801019e3:	c7 04 24 c0 84 10 80 	movl   $0x801084c0,(%esp)
801019ea:	e8 4b eb ff ff       	call   8010053a <panic>

  acquire(&icache.lock);
801019ef:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
801019f6:	e8 7c 33 00 00       	call   80104d77 <acquire>
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
80101a12:	e8 65 31 00 00       	call   80104b7c <wakeup>
  release(&icache.lock);
80101a17:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101a1e:	e8 b5 33 00 00       	call   80104dd8 <release>
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
80101a32:	e8 40 33 00 00       	call   80104d77 <acquire>
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
80101a70:	c7 04 24 c8 84 10 80 	movl   $0x801084c8,(%esp)
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
80101a94:	e8 3f 33 00 00       	call   80104dd8 <release>
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
80101abf:	e8 b3 32 00 00       	call   80104d77 <acquire>
    ip->flags = 0;
80101ac4:	8b 45 08             	mov    0x8(%ebp),%eax
80101ac7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    wakeup(ip);
80101ace:	8b 45 08             	mov    0x8(%ebp),%eax
80101ad1:	89 04 24             	mov    %eax,(%esp)
80101ad4:	e8 a3 30 00 00       	call   80104b7c <wakeup>
  }
  ip->ref--;
80101ad9:	8b 45 08             	mov    0x8(%ebp),%eax
80101adc:	8b 40 08             	mov    0x8(%eax),%eax
80101adf:	8d 50 ff             	lea    -0x1(%eax),%edx
80101ae2:	8b 45 08             	mov    0x8(%ebp),%eax
80101ae5:	89 50 08             	mov    %edx,0x8(%eax)
  release(&icache.lock);
80101ae8:	c7 04 24 80 e8 10 80 	movl   $0x8010e880,(%esp)
80101aef:	e8 e4 32 00 00       	call   80104dd8 <release>
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
80101c04:	c7 04 24 d2 84 10 80 	movl   $0x801084d2,(%esp)
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
80101e9d:	e8 f7 31 00 00       	call   80105099 <memmove>
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
80102005:	e8 8f 30 00 00       	call   80105099 <memmove>
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
80102087:	e8 b5 30 00 00       	call   80105141 <strncmp>
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
801020a1:	c7 04 24 e5 84 10 80 	movl   $0x801084e5,(%esp)
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
801020df:	c7 04 24 f7 84 10 80 	movl   $0x801084f7,(%esp)
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
801021c3:	c7 04 24 f7 84 10 80 	movl   $0x801084f7,(%esp)
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
80102209:	e8 8b 2f 00 00       	call   80105199 <strncpy>
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
8010223b:	c7 04 24 04 85 10 80 	movl   $0x80108504,(%esp)
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
801022c2:	e8 d2 2d 00 00       	call   80105099 <memmove>
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
801022dd:	e8 b7 2d 00 00       	call   80105099 <memmove>
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
8010252a:	c7 44 24 04 0c 85 10 	movl   $0x8010850c,0x4(%esp)
80102531:	80 
80102532:	c7 04 24 20 b6 10 80 	movl   $0x8010b620,(%esp)
80102539:	e8 18 28 00 00       	call   80104d56 <initlock>
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
801025d6:	c7 04 24 10 85 10 80 	movl   $0x80108510,(%esp)
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
801026fc:	e8 76 26 00 00       	call   80104d77 <acquire>
  if((b = idequeue) == 0){
80102701:	a1 54 b6 10 80       	mov    0x8010b654,%eax
80102706:	89 45 f4             	mov    %eax,-0xc(%ebp)
80102709:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010270d:	75 11                	jne    80102720 <ideintr+0x31>
    release(&idelock);
8010270f:	c7 04 24 20 b6 10 80 	movl   $0x8010b620,(%esp)
80102716:	e8 bd 26 00 00       	call   80104dd8 <release>
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
80102789:	e8 ee 23 00 00       	call   80104b7c <wakeup>
  
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
801027ab:	e8 28 26 00 00       	call   80104dd8 <release>
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
801027c4:	c7 04 24 19 85 10 80 	movl   $0x80108519,(%esp)
801027cb:	e8 6a dd ff ff       	call   8010053a <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801027d0:	8b 45 08             	mov    0x8(%ebp),%eax
801027d3:	8b 00                	mov    (%eax),%eax
801027d5:	83 e0 06             	and    $0x6,%eax
801027d8:	83 f8 02             	cmp    $0x2,%eax
801027db:	75 0c                	jne    801027e9 <iderw+0x37>
    panic("iderw: nothing to do");
801027dd:	c7 04 24 2d 85 10 80 	movl   $0x8010852d,(%esp)
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
801027fc:	c7 04 24 42 85 10 80 	movl   $0x80108542,(%esp)
80102803:	e8 32 dd ff ff       	call   8010053a <panic>

  acquire(&idelock);  //DOC:acquire-lock
80102808:	c7 04 24 20 b6 10 80 	movl   $0x8010b620,(%esp)
8010280f:	e8 63 25 00 00       	call   80104d77 <acquire>

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
80102868:	e8 32 22 00 00       	call   80104a9f <sleep>
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
80102884:	e8 4f 25 00 00       	call   80104dd8 <release>
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
80102912:	c7 04 24 60 85 10 80 	movl   $0x80108560,(%esp)
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
801029d3:	c7 44 24 04 92 85 10 	movl   $0x80108592,0x4(%esp)
801029da:	80 
801029db:	c7 04 24 60 f8 10 80 	movl   $0x8010f860,(%esp)
801029e2:	e8 6f 23 00 00       	call   80104d56 <initlock>
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
80102a77:	81 7d 08 1c 29 11 80 	cmpl   $0x8011291c,0x8(%ebp)
80102a7e:	72 12                	jb     80102a92 <kfree+0x2d>
80102a80:	8b 45 08             	mov    0x8(%ebp),%eax
80102a83:	89 04 24             	mov    %eax,(%esp)
80102a86:	e8 35 ff ff ff       	call   801029c0 <v2p>
80102a8b:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102a90:	76 0c                	jbe    80102a9e <kfree+0x39>
80102a92:	c7 04 24 97 85 10 80 	movl   $0x80108597,(%esp)
80102a99:	e8 9c da ff ff       	call   8010053a <panic>
80102a9e:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80102aa5:	00 
80102aa6:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102aad:	00 
80102aae:	8b 45 08             	mov    0x8(%ebp),%eax
80102ab1:	89 04 24             	mov    %eax,(%esp)
80102ab4:	e8 0d 25 00 00       	call   80104fc6 <memset>
80102ab9:	a1 94 f8 10 80       	mov    0x8010f894,%eax
80102abe:	85 c0                	test   %eax,%eax
80102ac0:	74 0c                	je     80102ace <kfree+0x69>
80102ac2:	c7 04 24 60 f8 10 80 	movl   $0x8010f860,(%esp)
80102ac9:	e8 a9 22 00 00       	call   80104d77 <acquire>
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
80102af7:	e8 dc 22 00 00       	call   80104dd8 <release>
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
80102b14:	e8 5e 22 00 00       	call   80104d77 <acquire>
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
80102b41:	e8 92 22 00 00       	call   80104dd8 <release>
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
80102ea9:	c7 04 24 a0 85 10 80 	movl   $0x801085a0,(%esp)
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
80102fff:	c7 44 24 04 cc 85 10 	movl   $0x801085cc,0x4(%esp)
80103006:	80 
80103007:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
8010300e:	e8 43 1d 00 00       	call   80104d56 <initlock>
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
801030c1:	e8 d3 1f 00 00       	call   80105099 <memmove>
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
80103213:	e8 5f 1b 00 00       	call   80104d77 <acquire>
80103218:	eb 14                	jmp    8010322e <begin_trans+0x28>
8010321a:	c7 44 24 04 a0 f8 10 	movl   $0x8010f8a0,0x4(%esp)
80103221:	80 
80103222:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
80103229:	e8 71 18 00 00       	call   80104a9f <sleep>
8010322e:	a1 dc f8 10 80       	mov    0x8010f8dc,%eax
80103233:	85 c0                	test   %eax,%eax
80103235:	75 e3                	jne    8010321a <begin_trans+0x14>
80103237:	c7 05 dc f8 10 80 01 	movl   $0x1,0x8010f8dc
8010323e:	00 00 00 
80103241:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
80103248:	e8 8b 1b 00 00       	call   80104dd8 <release>
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
8010327e:	e8 f4 1a 00 00       	call   80104d77 <acquire>
80103283:	c7 05 dc f8 10 80 00 	movl   $0x0,0x8010f8dc
8010328a:	00 00 00 
8010328d:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
80103294:	e8 e3 18 00 00       	call   80104b7c <wakeup>
80103299:	c7 04 24 a0 f8 10 80 	movl   $0x8010f8a0,(%esp)
801032a0:	e8 33 1b 00 00       	call   80104dd8 <release>
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
801032c9:	c7 04 24 d0 85 10 80 	movl   $0x801085d0,(%esp)
801032d0:	e8 65 d2 ff ff       	call   8010053a <panic>
801032d5:	a1 dc f8 10 80       	mov    0x8010f8dc,%eax
801032da:	85 c0                	test   %eax,%eax
801032dc:	75 0c                	jne    801032ea <log_write+0x43>
801032de:	c7 04 24 e6 85 10 80 	movl   $0x801085e6,(%esp)
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
8010336d:	e8 27 1d 00 00       	call   80105099 <memmove>
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
801033f5:	c7 04 24 1c 29 11 80 	movl   $0x8011291c,(%esp)
801033fc:	e8 cc f5 ff ff       	call   801029cd <kinit1>
  kvmalloc();      // kernel page table
80103401:	e8 11 48 00 00       	call   80107c17 <kvmalloc>
  mpinit();        // collect info about this machine
80103406:	e8 45 04 00 00       	call   80103850 <mpinit>
  lapicinit();
8010340b:	e8 0c f9 ff ff       	call   80102d1c <lapicinit>
  seginit();       // set up segments
80103410:	e8 a4 41 00 00       	call   801075b9 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpu->id);
80103415:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010341b:	0f b6 00             	movzbl (%eax),%eax
8010341e:	0f b6 c0             	movzbl %al,%eax
80103421:	89 44 24 04          	mov    %eax,0x4(%esp)
80103425:	c7 04 24 fd 85 10 80 	movl   $0x801085fd,(%esp)
8010342c:	e8 69 cf ff ff       	call   8010039a <cprintf>
  picinit();       // interrupt controller
80103431:	e8 80 06 00 00       	call   80103ab6 <picinit>
  ioapicinit();    // another interrupt controller
80103436:	e8 82 f4 ff ff       	call   801028bd <ioapicinit>
  consoleinit();   // I/O devices & their interrupts
8010343b:	e8 48 d6 ff ff       	call   80100a88 <consoleinit>
  uartinit();      // serial port
80103440:	e8 be 34 00 00       	call   80106903 <uartinit>
  pinit();         // process table
80103445:	e8 7c 0b 00 00       	call   80103fc6 <pinit>
  tvinit();        // trap vectors
8010344a:	e8 67 30 00 00       	call   801064b6 <tvinit>
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
8010346c:	e8 8d 2f 00 00       	call   801063fe <timerinit>
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
8010349a:	e8 8f 47 00 00       	call   80107c2e <switchkvm>
  seginit();
8010349f:	e8 15 41 00 00       	call   801075b9 <seginit>
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
801034c4:	c7 04 24 14 86 10 80 	movl   $0x80108614,(%esp)
801034cb:	e8 ca ce ff ff       	call   8010039a <cprintf>
  idtinit();       // load idt register
801034d0:	e8 51 31 00 00       	call   80106626 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
801034d5:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801034db:	05 a8 00 00 00       	add    $0xa8,%eax
801034e0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
801034e7:	00 
801034e8:	89 04 24             	mov    %eax,(%esp)
801034eb:	e8 da fe ff ff       	call   801033ca <xchg>
  scheduler();     // start running processes
801034f0:	e8 a0 13 00 00       	call   80104895 <scheduler>

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
80103522:	e8 72 1b 00 00       	call   80105099 <memmove>

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
801036a3:	c7 44 24 04 28 86 10 	movl   $0x80108628,0x4(%esp)
801036aa:	80 
801036ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
801036ae:	89 04 24             	mov    %eax,(%esp)
801036b1:	e8 87 19 00 00       	call   8010503d <memcmp>
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
801037e4:	c7 44 24 04 2d 86 10 	movl   $0x8010862d,0x4(%esp)
801037eb:	80 
801037ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
801037ef:	89 04 24             	mov    %eax,(%esp)
801037f2:	e8 46 18 00 00       	call   8010503d <memcmp>
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
801038c0:	8b 04 85 70 86 10 80 	mov    -0x7fef7990(,%eax,4),%eax
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
801038f9:	c7 04 24 32 86 10 80 	movl   $0x80108632,(%esp)
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
8010398a:	c7 04 24 50 86 10 80 	movl   $0x80108650,(%esp)
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
80103c8f:	c7 44 24 04 84 86 10 	movl   $0x80108684,0x4(%esp)
80103c96:	80 
80103c97:	89 04 24             	mov    %eax,(%esp)
80103c9a:	e8 b7 10 00 00       	call   80104d56 <initlock>
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
80103d47:	e8 2b 10 00 00       	call   80104d77 <acquire>
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
80103d6a:	e8 0d 0e 00 00       	call   80104b7c <wakeup>
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
80103d89:	e8 ee 0d 00 00       	call   80104b7c <wakeup>
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
80103dae:	e8 25 10 00 00       	call   80104dd8 <release>
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
80103dc6:	e8 0d 10 00 00       	call   80104dd8 <release>
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
80103dda:	e8 98 0f 00 00       	call   80104d77 <acquire>
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
80103e0b:	e8 c8 0f 00 00       	call   80104dd8 <release>
        return -1;
80103e10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103e15:	e9 9d 00 00 00       	jmp    80103eb7 <pipewrite+0xea>
      }
      wakeup(&p->nread);
80103e1a:	8b 45 08             	mov    0x8(%ebp),%eax
80103e1d:	05 34 02 00 00       	add    $0x234,%eax
80103e22:	89 04 24             	mov    %eax,(%esp)
80103e25:	e8 52 0d 00 00       	call   80104b7c <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103e2a:	8b 45 08             	mov    0x8(%ebp),%eax
80103e2d:	8b 55 08             	mov    0x8(%ebp),%edx
80103e30:	81 c2 38 02 00 00    	add    $0x238,%edx
80103e36:	89 44 24 04          	mov    %eax,0x4(%esp)
80103e3a:	89 14 24             	mov    %edx,(%esp)
80103e3d:	e8 5d 0c 00 00       	call   80104a9f <sleep>
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
80103ea4:	e8 d3 0c 00 00       	call   80104b7c <wakeup>
  release(&p->lock);
80103ea9:	8b 45 08             	mov    0x8(%ebp),%eax
80103eac:	89 04 24             	mov    %eax,(%esp)
80103eaf:	e8 24 0f 00 00       	call   80104dd8 <release>
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
80103eca:	e8 a8 0e 00 00       	call   80104d77 <acquire>
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
80103ee4:	e8 ef 0e 00 00       	call   80104dd8 <release>
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
80103f06:	e8 94 0b 00 00       	call   80104a9f <sleep>
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
80103f96:	e8 e1 0b 00 00       	call   80104b7c <wakeup>
  release(&p->lock);
80103f9b:	8b 45 08             	mov    0x8(%ebp),%eax
80103f9e:	89 04 24             	mov    %eax,(%esp)
80103fa1:	e8 32 0e 00 00       	call   80104dd8 <release>
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
80103fcc:	c7 44 24 04 89 86 10 	movl   $0x80108689,0x4(%esp)
80103fd3:	80 
80103fd4:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80103fdb:	e8 76 0d 00 00       	call   80104d56 <initlock>
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
80103fef:	e8 83 0d 00 00       	call   80104d77 <acquire>
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
80104007:	81 45 f0 84 00 00 00 	addl   $0x84,-0x10(%ebp)
8010400e:	b8 74 20 11 80       	mov    $0x80112074,%eax
80104013:	39 45 f0             	cmp    %eax,-0x10(%ebp)
80104016:	72 e5                	jb     80103ffd <allocproc+0x1b>
    if(p->state == UNUSED)
      goto found;
  release(&ptable.lock);
80104018:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
8010401f:	e8 b4 0d 00 00       	call   80104dd8 <release>
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
80104053:	e8 80 0d 00 00       	call   80104dd8 <release>

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
801040a0:	ba 70 64 10 80       	mov    $0x80106470,%edx
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
801040cd:	e8 f4 0e 00 00       	call   80104fc6 <memset>
  p->context->eip = (uint)forkret;
801040d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
801040d5:	8b 40 1c             	mov    0x1c(%eax),%eax
801040d8:	ba 73 4a 10 80       	mov    $0x80104a73,%edx
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
801040fb:	e8 59 3a 00 00       	call   80107b59 <setupkvm>
80104100:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104103:	89 42 04             	mov    %eax,0x4(%edx)
80104106:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104109:	8b 40 04             	mov    0x4(%eax),%eax
8010410c:	85 c0                	test   %eax,%eax
8010410e:	75 0c                	jne    8010411c <userinit+0x37>
    panic("userinit: out of memory?");
80104110:	c7 04 24 90 86 10 80 	movl   $0x80108690,(%esp)
80104117:	e8 1e c4 ff ff       	call   8010053a <panic>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
8010411c:	ba 2c 00 00 00       	mov    $0x2c,%edx
80104121:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104124:	8b 40 04             	mov    0x4(%eax),%eax
80104127:	89 54 24 08          	mov    %edx,0x8(%esp)
8010412b:	c7 44 24 04 00 b5 10 	movl   $0x8010b500,0x4(%esp)
80104132:	80 
80104133:	89 04 24             	mov    %eax,(%esp)
80104136:	e8 77 3c 00 00       	call   80107db2 <inituvm>
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
8010415d:	e8 64 0e 00 00       	call   80104fc6 <memset>
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
801041d7:	c7 44 24 04 a9 86 10 	movl   $0x801086a9,0x4(%esp)
801041de:	80 
801041df:	89 04 24             	mov    %eax,(%esp)
801041e2:	e8 12 10 00 00       	call   801051f9 <safestrcpy>
  p->cwd = namei("/");
801041e7:	c7 04 24 b2 86 10 80 	movl   $0x801086b2,(%esp)
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
8010423b:	e8 ed 3c 00 00       	call   80107f2d <allocuvm>
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
80104275:	e8 8d 3d 00 00       	call   80108007 <deallocuvm>
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
8010429e:	e8 a8 39 00 00       	call   80107c4b <switchuvm>
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
801042c6:	e9 44 01 00 00       	jmp    8010440f <fork+0x165>

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
801042cb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042d1:	8b 10                	mov    (%eax),%edx
801042d3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042d9:	8b 40 04             	mov    0x4(%eax),%eax
801042dc:	89 54 24 04          	mov    %edx,0x4(%esp)
801042e0:	89 04 24             	mov    %eax,(%esp)
801042e3:	e8 af 3e 00 00       	call   80108197 <copyuvm>
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
8010431f:	e9 eb 00 00 00       	jmp    8010440f <fork+0x165>
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
  np->priority = 0; //added
801043d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043d8:	c7 40 7c 00 00 00 00 	movl   $0x0,0x7c(%eax)
  np->state = RUNNABLE;
801043df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043e2:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  safestrcpy(np->name, proc->name, sizeof(proc->name));
801043e9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801043ef:	8d 50 6c             	lea    0x6c(%eax),%edx
801043f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801043f5:	83 c0 6c             	add    $0x6c,%eax
801043f8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
801043ff:	00 
80104400:	89 54 24 04          	mov    %edx,0x4(%esp)
80104404:	89 04 24             	mov    %eax,(%esp)
80104407:	e8 ed 0d 00 00       	call   801051f9 <safestrcpy>
  return pid;
8010440c:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
8010440f:	83 c4 2c             	add    $0x2c,%esp
80104412:	5b                   	pop    %ebx
80104413:	5e                   	pop    %esi
80104414:	5f                   	pop    %edi
80104415:	5d                   	pop    %ebp
80104416:	c3                   	ret    

80104417 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80104417:	55                   	push   %ebp
80104418:	89 e5                	mov    %esp,%ebp
8010441a:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  int fd;

  if(proc == initproc)
8010441d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104424:	a1 68 b6 10 80       	mov    0x8010b668,%eax
80104429:	39 c2                	cmp    %eax,%edx
8010442b:	75 0c                	jne    80104439 <exit+0x22>
    panic("init exiting");
8010442d:	c7 04 24 b4 86 10 80 	movl   $0x801086b4,(%esp)
80104434:	e8 01 c1 ff ff       	call   8010053a <panic>

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80104439:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80104440:	eb 44                	jmp    80104486 <exit+0x6f>
    if(proc->ofile[fd]){
80104442:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104448:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010444b:	83 c2 08             	add    $0x8,%edx
8010444e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104452:	85 c0                	test   %eax,%eax
80104454:	74 2c                	je     80104482 <exit+0x6b>
      fileclose(proc->ofile[fd]);
80104456:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010445c:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010445f:	83 c2 08             	add    $0x8,%edx
80104462:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104466:	89 04 24             	mov    %eax,(%esp)
80104469:	e8 53 cb ff ff       	call   80100fc1 <fileclose>
      proc->ofile[fd] = 0;
8010446e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104474:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104477:	83 c2 08             	add    $0x8,%edx
8010447a:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
80104481:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80104482:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80104486:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010448a:	7e b6                	jle    80104442 <exit+0x2b>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  iput(proc->cwd);
8010448c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104492:	8b 40 68             	mov    0x68(%eax),%eax
80104495:	89 04 24             	mov    %eax,(%esp)
80104498:	e8 88 d5 ff ff       	call   80101a25 <iput>
  proc->cwd = 0;
8010449d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801044a3:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
801044aa:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
801044b1:	e8 c1 08 00 00       	call   80104d77 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
801044b6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801044bc:	8b 40 14             	mov    0x14(%eax),%eax
801044bf:	89 04 24             	mov    %eax,(%esp)
801044c2:	e8 73 06 00 00       	call   80104b3a <wakeup1>

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801044c7:	c7 45 f0 74 ff 10 80 	movl   $0x8010ff74,-0x10(%ebp)
801044ce:	eb 3b                	jmp    8010450b <exit+0xf4>
    if(p->parent == proc){
801044d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044d3:	8b 50 14             	mov    0x14(%eax),%edx
801044d6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801044dc:	39 c2                	cmp    %eax,%edx
801044de:	75 24                	jne    80104504 <exit+0xed>
      p->parent = initproc;
801044e0:	8b 15 68 b6 10 80    	mov    0x8010b668,%edx
801044e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044e9:	89 50 14             	mov    %edx,0x14(%eax)
      if(p->state == ZOMBIE)
801044ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
801044ef:	8b 40 0c             	mov    0xc(%eax),%eax
801044f2:	83 f8 05             	cmp    $0x5,%eax
801044f5:	75 0d                	jne    80104504 <exit+0xed>
        wakeup1(initproc);
801044f7:	a1 68 b6 10 80       	mov    0x8010b668,%eax
801044fc:	89 04 24             	mov    %eax,(%esp)
801044ff:	e8 36 06 00 00       	call   80104b3a <wakeup1>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104504:	81 45 f0 84 00 00 00 	addl   $0x84,-0x10(%ebp)
8010450b:	b8 74 20 11 80       	mov    $0x80112074,%eax
80104510:	39 45 f0             	cmp    %eax,-0x10(%ebp)
80104513:	72 bb                	jb     801044d0 <exit+0xb9>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80104515:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010451b:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
  sched();
80104522:	e8 68 04 00 00       	call   8010498f <sched>
  panic("zombie exit");
80104527:	c7 04 24 c1 86 10 80 	movl   $0x801086c1,(%esp)
8010452e:	e8 07 c0 ff ff       	call   8010053a <panic>

80104533 <exit1>:
}

void
exit1(int status)
{
80104533:	55                   	push   %ebp
80104534:	89 e5                	mov    %esp,%ebp
80104536:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  int fd;

  if(proc == initproc)
80104539:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104540:	a1 68 b6 10 80       	mov    0x8010b668,%eax
80104545:	39 c2                	cmp    %eax,%edx
80104547:	75 0c                	jne    80104555 <exit1+0x22>
    panic("init exiting");
80104549:	c7 04 24 b4 86 10 80 	movl   $0x801086b4,(%esp)
80104550:	e8 e5 bf ff ff       	call   8010053a <panic>

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80104555:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
8010455c:	eb 44                	jmp    801045a2 <exit1+0x6f>
    if(proc->ofile[fd]){
8010455e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104564:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104567:	83 c2 08             	add    $0x8,%edx
8010456a:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
8010456e:	85 c0                	test   %eax,%eax
80104570:	74 2c                	je     8010459e <exit1+0x6b>
      fileclose(proc->ofile[fd]);
80104572:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104578:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010457b:	83 c2 08             	add    $0x8,%edx
8010457e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80104582:	89 04 24             	mov    %eax,(%esp)
80104585:	e8 37 ca ff ff       	call   80100fc1 <fileclose>
      proc->ofile[fd] = 0;
8010458a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104590:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104593:	83 c2 08             	add    $0x8,%edx
80104596:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
8010459d:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
8010459e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
801045a2:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801045a6:	7e b6                	jle    8010455e <exit1+0x2b>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  proc->exitStatus = status;  //added 
801045a8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801045ae:	8b 55 08             	mov    0x8(%ebp),%edx
801045b1:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
	
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
801045dc:	e8 96 07 00 00       	call   80104d77 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
801045e1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801045e7:	8b 40 14             	mov    0x14(%eax),%eax
801045ea:	89 04 24             	mov    %eax,(%esp)
801045ed:	e8 48 05 00 00       	call   80104b3a <wakeup1>

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801045f2:	c7 45 f0 74 ff 10 80 	movl   $0x8010ff74,-0x10(%ebp)
801045f9:	eb 3b                	jmp    80104636 <exit1+0x103>
    if(p->parent == proc){
801045fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
801045fe:	8b 50 14             	mov    0x14(%eax),%edx
80104601:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104607:	39 c2                	cmp    %eax,%edx
80104609:	75 24                	jne    8010462f <exit1+0xfc>
      p->parent = initproc;
8010460b:	8b 15 68 b6 10 80    	mov    0x8010b668,%edx
80104611:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104614:	89 50 14             	mov    %edx,0x14(%eax)
      if(p->state == ZOMBIE)
80104617:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010461a:	8b 40 0c             	mov    0xc(%eax),%eax
8010461d:	83 f8 05             	cmp    $0x5,%eax
80104620:	75 0d                	jne    8010462f <exit1+0xfc>
        wakeup1(initproc);
80104622:	a1 68 b6 10 80       	mov    0x8010b668,%eax
80104627:	89 04 24             	mov    %eax,(%esp)
8010462a:	e8 0b 05 00 00       	call   80104b3a <wakeup1>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010462f:	81 45 f0 84 00 00 00 	addl   $0x84,-0x10(%ebp)
80104636:	b8 74 20 11 80       	mov    $0x80112074,%eax
8010463b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
8010463e:	72 bb                	jb     801045fb <exit1+0xc8>
        wakeup1(initproc);
    }
  } //added

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80104640:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104646:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
  sched();
8010464d:	e8 3d 03 00 00       	call   8010498f <sched>
  panic("zombie exit");
80104652:	c7 04 24 c1 86 10 80 	movl   $0x801086c1,(%esp)
80104659:	e8 dc be ff ff       	call   8010053a <panic>

8010465e <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
8010465e:	55                   	push   %ebp
8010465f:	89 e5                	mov    %esp,%ebp
80104661:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80104664:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
8010466b:	e8 07 07 00 00       	call   80104d77 <acquire>
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
80104670:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104677:	c7 45 ec 74 ff 10 80 	movl   $0x8010ff74,-0x14(%ebp)
8010467e:	e9 9d 00 00 00       	jmp    80104720 <wait+0xc2>
      if(p->parent != proc)
80104683:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104686:	8b 50 14             	mov    0x14(%eax),%edx
80104689:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010468f:	39 c2                	cmp    %eax,%edx
80104691:	0f 85 81 00 00 00    	jne    80104718 <wait+0xba>
        continue;
      havekids = 1;
80104697:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
      if(p->state == ZOMBIE){
8010469e:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046a1:	8b 40 0c             	mov    0xc(%eax),%eax
801046a4:	83 f8 05             	cmp    $0x5,%eax
801046a7:	75 70                	jne    80104719 <wait+0xbb>
        // Found one.
        pid = p->pid;
801046a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046ac:	8b 40 10             	mov    0x10(%eax),%eax
801046af:	89 45 f4             	mov    %eax,-0xc(%ebp)
        kfree(p->kstack);
801046b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046b5:	8b 40 08             	mov    0x8(%eax),%eax
801046b8:	89 04 24             	mov    %eax,(%esp)
801046bb:	e8 a5 e3 ff ff       	call   80102a65 <kfree>
        p->kstack = 0;
801046c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046c3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
        freevm(p->pgdir);
801046ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046cd:	8b 40 04             	mov    0x4(%eax),%eax
801046d0:	89 04 24             	mov    %eax,(%esp)
801046d3:	e8 eb 39 00 00       	call   801080c3 <freevm>
        p->state = UNUSED;
801046d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046db:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
        p->pid = 0;
801046e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046e5:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
        p->parent = 0;
801046ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046ef:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
        p->name[0] = 0;
801046f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
801046f9:	c6 40 6c 00          	movb   $0x0,0x6c(%eax)
        p->killed = 0;
801046fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104700:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
        release(&ptable.lock);
80104707:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
8010470e:	e8 c5 06 00 00       	call   80104dd8 <release>
        return pid;
80104713:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104716:	eb 57                	jmp    8010476f <wait+0x111>
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != proc)
        continue;
80104718:	90                   	nop

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104719:	81 45 ec 84 00 00 00 	addl   $0x84,-0x14(%ebp)
80104720:	b8 74 20 11 80       	mov    $0x80112074,%eax
80104725:	39 45 ec             	cmp    %eax,-0x14(%ebp)
80104728:	0f 82 55 ff ff ff    	jb     80104683 <wait+0x25>
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
8010472e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80104732:	74 0d                	je     80104741 <wait+0xe3>
80104734:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010473a:	8b 40 24             	mov    0x24(%eax),%eax
8010473d:	85 c0                	test   %eax,%eax
8010473f:	74 13                	je     80104754 <wait+0xf6>
      release(&ptable.lock);
80104741:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104748:	e8 8b 06 00 00       	call   80104dd8 <release>
      return -1;
8010474d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104752:	eb 1b                	jmp    8010476f <wait+0x111>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80104754:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010475a:	c7 44 24 04 40 ff 10 	movl   $0x8010ff40,0x4(%esp)
80104761:	80 
80104762:	89 04 24             	mov    %eax,(%esp)
80104765:	e8 35 03 00 00       	call   80104a9f <sleep>
  }
8010476a:	e9 01 ff ff ff       	jmp    80104670 <wait+0x12>
}
8010476f:	c9                   	leave  
80104770:	c3                   	ret    

80104771 <wait1>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait1(int *status)
{
80104771:	55                   	push   %ebp
80104772:	89 e5                	mov    %esp,%ebp
80104774:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80104777:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
8010477e:	e8 f4 05 00 00       	call   80104d77 <acquire>
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
80104783:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010478a:	c7 45 ec 74 ff 10 80 	movl   $0x8010ff74,-0x14(%ebp)
80104791:	e9 9d 00 00 00       	jmp    80104833 <wait1+0xc2>
      if(p->parent != proc)
80104796:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104799:	8b 50 14             	mov    0x14(%eax),%edx
8010479c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801047a2:	39 c2                	cmp    %eax,%edx
801047a4:	0f 85 81 00 00 00    	jne    8010482b <wait1+0xba>
        continue;
      havekids = 1;
801047aa:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
      if(p->state == ZOMBIE){
801047b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
801047b4:	8b 40 0c             	mov    0xc(%eax),%eax
801047b7:	83 f8 05             	cmp    $0x5,%eax
801047ba:	75 70                	jne    8010482c <wait1+0xbb>
        // Found one.
        //if(status != 0)
	//{
	//	*status = p->exitStatus;
	//}//added
        pid = p->pid; 
801047bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
801047bf:	8b 40 10             	mov    0x10(%eax),%eax
801047c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        kfree(p->kstack);
801047c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
801047c8:	8b 40 08             	mov    0x8(%eax),%eax
801047cb:	89 04 24             	mov    %eax,(%esp)
801047ce:	e8 92 e2 ff ff       	call   80102a65 <kfree>
        p->kstack = 0;
801047d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
801047d6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
        freevm(p->pgdir);
801047dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
801047e0:	8b 40 04             	mov    0x4(%eax),%eax
801047e3:	89 04 24             	mov    %eax,(%esp)
801047e6:	e8 d8 38 00 00       	call   801080c3 <freevm>
        p->state = UNUSED;
801047eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801047ee:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
        p->pid = 0;
801047f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
801047f8:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
        p->parent = 0;
801047ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104802:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
        p->name[0] = 0;
80104809:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010480c:	c6 40 6c 00          	movb   $0x0,0x6c(%eax)
        p->killed = 0; 
80104810:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104813:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
        release(&ptable.lock);
8010481a:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104821:	e8 b2 05 00 00       	call   80104dd8 <release>
        return pid;
80104826:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104829:	eb 57                	jmp    80104882 <wait1+0x111>
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != proc)
        continue;
8010482b:	90                   	nop

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for zombie children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010482c:	81 45 ec 84 00 00 00 	addl   $0x84,-0x14(%ebp)
80104833:	b8 74 20 11 80       	mov    $0x80112074,%eax
80104838:	39 45 ec             	cmp    %eax,-0x14(%ebp)
8010483b:	0f 82 55 ff ff ff    	jb     80104796 <wait1+0x25>
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
80104841:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80104845:	74 0d                	je     80104854 <wait1+0xe3>
80104847:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010484d:	8b 40 24             	mov    0x24(%eax),%eax
80104850:	85 c0                	test   %eax,%eax
80104852:	74 13                	je     80104867 <wait1+0xf6>
      release(&ptable.lock);
80104854:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
8010485b:	e8 78 05 00 00       	call   80104dd8 <release>
      return -1;
80104860:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104865:	eb 1b                	jmp    80104882 <wait1+0x111>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80104867:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010486d:	c7 44 24 04 40 ff 10 	movl   $0x8010ff40,0x4(%esp)
80104874:	80 
80104875:	89 04 24             	mov    %eax,(%esp)
80104878:	e8 22 02 00 00       	call   80104a9f <sleep>
  }
8010487d:	e9 01 ff ff ff       	jmp    80104783 <wait1+0x12>
}  //added (copied from wait function with minor changes) 
80104882:	c9                   	leave  
80104883:	c3                   	ret    

80104884 <setPriority>:


void
setPriority(int priority)
{ 
80104884:	55                   	push   %ebp
80104885:	89 e5                	mov    %esp,%ebp
	proc->priority = priority; 				
80104887:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010488d:	8b 55 08             	mov    0x8(%ebp),%edx
80104890:	89 50 7c             	mov    %edx,0x7c(%eax)
} //added 
80104893:	5d                   	pop    %ebp
80104894:	c3                   	ret    

80104895 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80104895:	55                   	push   %ebp
80104896:	89 e5                	mov    %esp,%ebp
80104898:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;
  struct proc *max;  //added
  int currPriority = 0;  //added
8010489b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

  for(;;){
    // Enable interrupts on this processor.
    sti();
801048a2:	e8 19 f7 ff ff       	call   80103fc0 <sti>
    
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
801048a7:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
801048ae:	e8 c4 04 00 00       	call   80104d77 <acquire>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801048b3:	c7 45 ec 74 ff 10 80 	movl   $0x8010ff74,-0x14(%ebp)
801048ba:	e9 b1 00 00 00       	jmp    80104970 <scheduler+0xdb>
      if(p->state != RUNNABLE)
801048bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
801048c2:	8b 40 0c             	mov    0xc(%eax),%eax
801048c5:	83 f8 03             	cmp    $0x3,%eax
801048c8:	0f 85 9a 00 00 00    	jne    80104968 <scheduler+0xd3>
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      currPriority = 0; //added
801048ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      for(max = ptable.proc; max < &ptable.proc[NPROC]; max++) 
801048d5:	c7 45 f0 74 ff 10 80 	movl   $0x8010ff74,-0x10(%ebp)
801048dc:	eb 26                	jmp    80104904 <scheduler+0x6f>
      { 
	if(max->state == RUNNABLE )
801048de:	8b 45 f0             	mov    -0x10(%ebp),%eax
801048e1:	8b 40 0c             	mov    0xc(%eax),%eax
801048e4:	83 f8 03             	cmp    $0x3,%eax
801048e7:	75 14                	jne    801048fd <scheduler+0x68>
	{
		if(max->priority > currPriority) 
801048e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
801048ec:	8b 40 7c             	mov    0x7c(%eax),%eax
801048ef:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801048f2:	7e 09                	jle    801048fd <scheduler+0x68>
		{
			currPriority = max->priority; 
801048f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
801048f7:	8b 40 7c             	mov    0x7c(%eax),%eax
801048fa:	89 45 f4             	mov    %eax,-0xc(%ebp)

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      currPriority = 0; //added
      for(max = ptable.proc; max < &ptable.proc[NPROC]; max++) 
801048fd:	81 45 f0 84 00 00 00 	addl   $0x84,-0x10(%ebp)
80104904:	b8 74 20 11 80       	mov    $0x80112074,%eax
80104909:	39 45 f0             	cmp    %eax,-0x10(%ebp)
8010490c:	72 d0                	jb     801048de <scheduler+0x49>
			currPriority = max->priority; 
		 
		}
	} 
       }	
	if(p->priority == currPriority)
8010490e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104911:	8b 40 7c             	mov    0x7c(%eax),%eax
80104914:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80104917:	75 50                	jne    80104969 <scheduler+0xd4>
	{
      		proc = p;
80104919:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010491c:	65 a3 04 00 00 00    	mov    %eax,%gs:0x4
      		switchuvm(p);
80104922:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104925:	89 04 24             	mov    %eax,(%esp)
80104928:	e8 1e 33 00 00       	call   80107c4b <switchuvm>
      		p->state = RUNNING;
8010492d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104930:	c7 40 0c 04 00 00 00 	movl   $0x4,0xc(%eax)
      		swtch(&cpu->scheduler, proc->context);
80104937:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010493d:	8b 40 1c             	mov    0x1c(%eax),%eax
80104940:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104947:	83 c2 04             	add    $0x4,%edx
8010494a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010494e:	89 14 24             	mov    %edx,(%esp)
80104951:	e8 16 09 00 00       	call   8010526c <swtch>
      		switchkvm();
80104956:	e8 d3 32 00 00       	call   80107c2e <switchkvm>


	        // Process is done running for now.
      		// It should have changed its p->state before coming back.
      		proc = 0;
8010495b:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80104962:	00 00 00 00 
80104966:	eb 01                	jmp    80104969 <scheduler+0xd4>
    
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE)
        continue;
80104968:	90                   	nop
    // Enable interrupts on this processor.
    sti();
    
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104969:	81 45 ec 84 00 00 00 	addl   $0x84,-0x14(%ebp)
80104970:	b8 74 20 11 80       	mov    $0x80112074,%eax
80104975:	39 45 ec             	cmp    %eax,-0x14(%ebp)
80104978:	0f 82 41 ff ff ff    	jb     801048bf <scheduler+0x2a>
	        // Process is done running for now.
      		// It should have changed its p->state before coming back.
      		proc = 0;
 	}	
    } //added (moved lines 392-401 into if statement)
    release(&ptable.lock);
8010497e:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104985:	e8 4e 04 00 00       	call   80104dd8 <release>
  }
8010498a:	e9 13 ff ff ff       	jmp    801048a2 <scheduler+0xd>

8010498f <sched>:

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state.
void
sched(void)
{
8010498f:	55                   	push   %ebp
80104990:	89 e5                	mov    %esp,%ebp
80104992:	83 ec 28             	sub    $0x28,%esp
  int intena;

  if(!holding(&ptable.lock))
80104995:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
8010499c:	e8 f5 04 00 00       	call   80104e96 <holding>
801049a1:	85 c0                	test   %eax,%eax
801049a3:	75 0c                	jne    801049b1 <sched+0x22>
    panic("sched ptable.lock");
801049a5:	c7 04 24 cd 86 10 80 	movl   $0x801086cd,(%esp)
801049ac:	e8 89 bb ff ff       	call   8010053a <panic>
  if(cpu->ncli != 1)
801049b1:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801049b7:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
801049bd:	83 f8 01             	cmp    $0x1,%eax
801049c0:	74 0c                	je     801049ce <sched+0x3f>
    panic("sched locks");
801049c2:	c7 04 24 df 86 10 80 	movl   $0x801086df,(%esp)
801049c9:	e8 6c bb ff ff       	call   8010053a <panic>
  if(proc->state == RUNNING)
801049ce:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801049d4:	8b 40 0c             	mov    0xc(%eax),%eax
801049d7:	83 f8 04             	cmp    $0x4,%eax
801049da:	75 0c                	jne    801049e8 <sched+0x59>
    panic("sched running");
801049dc:	c7 04 24 eb 86 10 80 	movl   $0x801086eb,(%esp)
801049e3:	e8 52 bb ff ff       	call   8010053a <panic>
  if(readeflags()&FL_IF)
801049e8:	e8 c3 f5 ff ff       	call   80103fb0 <readeflags>
801049ed:	25 00 02 00 00       	and    $0x200,%eax
801049f2:	85 c0                	test   %eax,%eax
801049f4:	74 0c                	je     80104a02 <sched+0x73>
    panic("sched interruptible");
801049f6:	c7 04 24 f9 86 10 80 	movl   $0x801086f9,(%esp)
801049fd:	e8 38 bb ff ff       	call   8010053a <panic>
  intena = cpu->intena;
80104a02:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104a08:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
80104a0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  swtch(&proc->context, cpu->scheduler);
80104a11:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104a17:	8b 40 04             	mov    0x4(%eax),%eax
80104a1a:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104a21:	83 c2 1c             	add    $0x1c,%edx
80104a24:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a28:	89 14 24             	mov    %edx,(%esp)
80104a2b:	e8 3c 08 00 00       	call   8010526c <swtch>
  cpu->intena = intena;
80104a30:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104a36:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104a39:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
}
80104a3f:	c9                   	leave  
80104a40:	c3                   	ret    

80104a41 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
80104a41:	55                   	push   %ebp
80104a42:	89 e5                	mov    %esp,%ebp
80104a44:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80104a47:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104a4e:	e8 24 03 00 00       	call   80104d77 <acquire>
  proc->state = RUNNABLE;
80104a53:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104a59:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80104a60:	e8 2a ff ff ff       	call   8010498f <sched>
  release(&ptable.lock);
80104a65:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104a6c:	e8 67 03 00 00       	call   80104dd8 <release>
}
80104a71:	c9                   	leave  
80104a72:	c3                   	ret    

80104a73 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80104a73:	55                   	push   %ebp
80104a74:	89 e5                	mov    %esp,%ebp
80104a76:	83 ec 18             	sub    $0x18,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80104a79:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104a80:	e8 53 03 00 00       	call   80104dd8 <release>

  if (first) {
80104a85:	a1 20 b0 10 80       	mov    0x8010b020,%eax
80104a8a:	85 c0                	test   %eax,%eax
80104a8c:	74 0f                	je     80104a9d <forkret+0x2a>
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot 
    // be run from main().
    first = 0;
80104a8e:	c7 05 20 b0 10 80 00 	movl   $0x0,0x8010b020
80104a95:	00 00 00 
    initlog();
80104a98:	e8 5b e5 ff ff       	call   80102ff8 <initlog>
  }
  
  // Return to "caller", actually trapret (see allocproc).
}
80104a9d:	c9                   	leave  
80104a9e:	c3                   	ret    

80104a9f <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80104a9f:	55                   	push   %ebp
80104aa0:	89 e5                	mov    %esp,%ebp
80104aa2:	83 ec 18             	sub    $0x18,%esp
  if(proc == 0)
80104aa5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104aab:	85 c0                	test   %eax,%eax
80104aad:	75 0c                	jne    80104abb <sleep+0x1c>
    panic("sleep");
80104aaf:	c7 04 24 0d 87 10 80 	movl   $0x8010870d,(%esp)
80104ab6:	e8 7f ba ff ff       	call   8010053a <panic>

  if(lk == 0)
80104abb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80104abf:	75 0c                	jne    80104acd <sleep+0x2e>
    panic("sleep without lk");
80104ac1:	c7 04 24 13 87 10 80 	movl   $0x80108713,(%esp)
80104ac8:	e8 6d ba ff ff       	call   8010053a <panic>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80104acd:	81 7d 0c 40 ff 10 80 	cmpl   $0x8010ff40,0xc(%ebp)
80104ad4:	74 17                	je     80104aed <sleep+0x4e>
    acquire(&ptable.lock);  //DOC: sleeplock1
80104ad6:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104add:	e8 95 02 00 00       	call   80104d77 <acquire>
    release(lk);
80104ae2:	8b 45 0c             	mov    0xc(%ebp),%eax
80104ae5:	89 04 24             	mov    %eax,(%esp)
80104ae8:	e8 eb 02 00 00       	call   80104dd8 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80104aed:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104af3:	8b 55 08             	mov    0x8(%ebp),%edx
80104af6:	89 50 20             	mov    %edx,0x20(%eax)
  proc->state = SLEEPING;
80104af9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104aff:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80104b06:	e8 84 fe ff ff       	call   8010498f <sched>

  // Tidy up.
  proc->chan = 0;
80104b0b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b11:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
80104b18:	81 7d 0c 40 ff 10 80 	cmpl   $0x8010ff40,0xc(%ebp)
80104b1f:	74 17                	je     80104b38 <sleep+0x99>
    release(&ptable.lock);
80104b21:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104b28:	e8 ab 02 00 00       	call   80104dd8 <release>
    acquire(lk);
80104b2d:	8b 45 0c             	mov    0xc(%ebp),%eax
80104b30:	89 04 24             	mov    %eax,(%esp)
80104b33:	e8 3f 02 00 00       	call   80104d77 <acquire>
  }
}
80104b38:	c9                   	leave  
80104b39:	c3                   	ret    

80104b3a <wakeup1>:
//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
80104b3a:	55                   	push   %ebp
80104b3b:	89 e5                	mov    %esp,%ebp
80104b3d:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104b40:	c7 45 fc 74 ff 10 80 	movl   $0x8010ff74,-0x4(%ebp)
80104b47:	eb 27                	jmp    80104b70 <wakeup1+0x36>
    if(p->state == SLEEPING && p->chan == chan)
80104b49:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104b4c:	8b 40 0c             	mov    0xc(%eax),%eax
80104b4f:	83 f8 02             	cmp    $0x2,%eax
80104b52:	75 15                	jne    80104b69 <wakeup1+0x2f>
80104b54:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104b57:	8b 40 20             	mov    0x20(%eax),%eax
80104b5a:	3b 45 08             	cmp    0x8(%ebp),%eax
80104b5d:	75 0a                	jne    80104b69 <wakeup1+0x2f>
      p->state = RUNNABLE;
80104b5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104b62:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104b69:	81 45 fc 84 00 00 00 	addl   $0x84,-0x4(%ebp)
80104b70:	b8 74 20 11 80       	mov    $0x80112074,%eax
80104b75:	39 45 fc             	cmp    %eax,-0x4(%ebp)
80104b78:	72 cf                	jb     80104b49 <wakeup1+0xf>
    if(p->state == SLEEPING && p->chan == chan)
      p->state = RUNNABLE;
}
80104b7a:	c9                   	leave  
80104b7b:	c3                   	ret    

80104b7c <wakeup>:

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104b7c:	55                   	push   %ebp
80104b7d:	89 e5                	mov    %esp,%ebp
80104b7f:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);
80104b82:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104b89:	e8 e9 01 00 00       	call   80104d77 <acquire>
  wakeup1(chan);
80104b8e:	8b 45 08             	mov    0x8(%ebp),%eax
80104b91:	89 04 24             	mov    %eax,(%esp)
80104b94:	e8 a1 ff ff ff       	call   80104b3a <wakeup1>
  release(&ptable.lock);
80104b99:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104ba0:	e8 33 02 00 00       	call   80104dd8 <release>
}
80104ba5:	c9                   	leave  
80104ba6:	c3                   	ret    

80104ba7 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104ba7:	55                   	push   %ebp
80104ba8:	89 e5                	mov    %esp,%ebp
80104baa:	83 ec 28             	sub    $0x28,%esp
  struct proc *p;

  acquire(&ptable.lock);
80104bad:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104bb4:	e8 be 01 00 00       	call   80104d77 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104bb9:	c7 45 f4 74 ff 10 80 	movl   $0x8010ff74,-0xc(%ebp)
80104bc0:	eb 44                	jmp    80104c06 <kill+0x5f>
    if(p->pid == pid){
80104bc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104bc5:	8b 40 10             	mov    0x10(%eax),%eax
80104bc8:	3b 45 08             	cmp    0x8(%ebp),%eax
80104bcb:	75 32                	jne    80104bff <kill+0x58>
      p->killed = 1;
80104bcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104bd0:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80104bd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104bda:	8b 40 0c             	mov    0xc(%eax),%eax
80104bdd:	83 f8 02             	cmp    $0x2,%eax
80104be0:	75 0a                	jne    80104bec <kill+0x45>
        p->state = RUNNABLE;
80104be2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104be5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80104bec:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104bf3:	e8 e0 01 00 00       	call   80104dd8 <release>
      return 0;
80104bf8:	b8 00 00 00 00       	mov    $0x0,%eax
80104bfd:	eb 22                	jmp    80104c21 <kill+0x7a>
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104bff:	81 45 f4 84 00 00 00 	addl   $0x84,-0xc(%ebp)
80104c06:	b8 74 20 11 80       	mov    $0x80112074,%eax
80104c0b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80104c0e:	72 b2                	jb     80104bc2 <kill+0x1b>
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80104c10:	c7 04 24 40 ff 10 80 	movl   $0x8010ff40,(%esp)
80104c17:	e8 bc 01 00 00       	call   80104dd8 <release>
  return -1;
80104c1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104c21:	c9                   	leave  
80104c22:	c3                   	ret    

80104c23 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104c23:	55                   	push   %ebp
80104c24:	89 e5                	mov    %esp,%ebp
80104c26:	83 ec 58             	sub    $0x58,%esp
  int i;
  struct proc *p;
  char *state;
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104c29:	c7 45 f0 74 ff 10 80 	movl   $0x8010ff74,-0x10(%ebp)
80104c30:	e9 db 00 00 00       	jmp    80104d10 <procdump+0xed>
    if(p->state == UNUSED)
80104c35:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104c38:	8b 40 0c             	mov    0xc(%eax),%eax
80104c3b:	85 c0                	test   %eax,%eax
80104c3d:	0f 84 c5 00 00 00    	je     80104d08 <procdump+0xe5>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104c43:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104c46:	8b 40 0c             	mov    0xc(%eax),%eax
80104c49:	83 f8 05             	cmp    $0x5,%eax
80104c4c:	77 23                	ja     80104c71 <procdump+0x4e>
80104c4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104c51:	8b 40 0c             	mov    0xc(%eax),%eax
80104c54:	8b 04 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%eax
80104c5b:	85 c0                	test   %eax,%eax
80104c5d:	74 12                	je     80104c71 <procdump+0x4e>
      state = states[p->state];
80104c5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104c62:	8b 40 0c             	mov    0xc(%eax),%eax
80104c65:	8b 04 85 08 b0 10 80 	mov    -0x7fef4ff8(,%eax,4),%eax
80104c6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104c6f:	eb 07                	jmp    80104c78 <procdump+0x55>
      state = states[p->state];
    else
      state = "???";
80104c71:	c7 45 f4 24 87 10 80 	movl   $0x80108724,-0xc(%ebp)
    cprintf("%d %s %s", p->pid, state, p->name);
80104c78:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104c7b:	8d 50 6c             	lea    0x6c(%eax),%edx
80104c7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104c81:	8b 40 10             	mov    0x10(%eax),%eax
80104c84:	89 54 24 0c          	mov    %edx,0xc(%esp)
80104c88:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104c8b:	89 54 24 08          	mov    %edx,0x8(%esp)
80104c8f:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c93:	c7 04 24 28 87 10 80 	movl   $0x80108728,(%esp)
80104c9a:	e8 fb b6 ff ff       	call   8010039a <cprintf>
    if(p->state == SLEEPING){
80104c9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104ca2:	8b 40 0c             	mov    0xc(%eax),%eax
80104ca5:	83 f8 02             	cmp    $0x2,%eax
80104ca8:	75 50                	jne    80104cfa <procdump+0xd7>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104caa:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104cad:	8b 40 1c             	mov    0x1c(%eax),%eax
80104cb0:	8b 40 0c             	mov    0xc(%eax),%eax
80104cb3:	83 c0 08             	add    $0x8,%eax
80104cb6:	8d 55 c4             	lea    -0x3c(%ebp),%edx
80104cb9:	89 54 24 04          	mov    %edx,0x4(%esp)
80104cbd:	89 04 24             	mov    %eax,(%esp)
80104cc0:	e8 62 01 00 00       	call   80104e27 <getcallerpcs>
      for(i=0; i<10 && pc[i] != 0; i++)
80104cc5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
80104ccc:	eb 1b                	jmp    80104ce9 <procdump+0xc6>
        cprintf(" %p", pc[i]);
80104cce:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104cd1:	8b 44 85 c4          	mov    -0x3c(%ebp,%eax,4),%eax
80104cd5:	89 44 24 04          	mov    %eax,0x4(%esp)
80104cd9:	c7 04 24 31 87 10 80 	movl   $0x80108731,(%esp)
80104ce0:	e8 b5 b6 ff ff       	call   8010039a <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104ce5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
80104ce9:	83 7d ec 09          	cmpl   $0x9,-0x14(%ebp)
80104ced:	7f 0b                	jg     80104cfa <procdump+0xd7>
80104cef:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104cf2:	8b 44 85 c4          	mov    -0x3c(%ebp,%eax,4),%eax
80104cf6:	85 c0                	test   %eax,%eax
80104cf8:	75 d4                	jne    80104cce <procdump+0xab>
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104cfa:	c7 04 24 35 87 10 80 	movl   $0x80108735,(%esp)
80104d01:	e8 94 b6 ff ff       	call   8010039a <cprintf>
80104d06:	eb 01                	jmp    80104d09 <procdump+0xe6>
  char *state;
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
80104d08:	90                   	nop
  int i;
  struct proc *p;
  char *state;
  uint pc[10];
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104d09:	81 45 f0 84 00 00 00 	addl   $0x84,-0x10(%ebp)
80104d10:	b8 74 20 11 80       	mov    $0x80112074,%eax
80104d15:	39 45 f0             	cmp    %eax,-0x10(%ebp)
80104d18:	0f 82 17 ff ff ff    	jb     80104c35 <procdump+0x12>
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104d1e:	c9                   	leave  
80104d1f:	c3                   	ret    

80104d20 <readeflags>:
  asm volatile("ltr %0" : : "r" (sel));
}

static inline uint
readeflags(void)
{
80104d20:	55                   	push   %ebp
80104d21:	89 e5                	mov    %esp,%ebp
80104d23:	83 ec 10             	sub    $0x10,%esp
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104d26:	9c                   	pushf  
80104d27:	58                   	pop    %eax
80104d28:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return eflags;
80104d2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80104d2e:	c9                   	leave  
80104d2f:	c3                   	ret    

80104d30 <cli>:
  asm volatile("movw %0, %%gs" : : "r" (v));
}

static inline void
cli(void)
{
80104d30:	55                   	push   %ebp
80104d31:	89 e5                	mov    %esp,%ebp
  asm volatile("cli");
80104d33:	fa                   	cli    
}
80104d34:	5d                   	pop    %ebp
80104d35:	c3                   	ret    

80104d36 <sti>:

static inline void
sti(void)
{
80104d36:	55                   	push   %ebp
80104d37:	89 e5                	mov    %esp,%ebp
  asm volatile("sti");
80104d39:	fb                   	sti    
}
80104d3a:	5d                   	pop    %ebp
80104d3b:	c3                   	ret    

80104d3c <xchg>:

static inline uint
xchg(volatile uint *addr, uint newval)
{
80104d3c:	55                   	push   %ebp
80104d3d:	89 e5                	mov    %esp,%ebp
80104d3f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80104d42:	8b 55 08             	mov    0x8(%ebp),%edx
80104d45:	8b 45 0c             	mov    0xc(%ebp),%eax
80104d48:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104d4b:	f0 87 02             	lock xchg %eax,(%edx)
80104d4e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
80104d51:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
80104d54:	c9                   	leave  
80104d55:	c3                   	ret    

80104d56 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104d56:	55                   	push   %ebp
80104d57:	89 e5                	mov    %esp,%ebp
  lk->name = name;
80104d59:	8b 45 08             	mov    0x8(%ebp),%eax
80104d5c:	8b 55 0c             	mov    0xc(%ebp),%edx
80104d5f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
80104d62:	8b 45 08             	mov    0x8(%ebp),%eax
80104d65:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->cpu = 0;
80104d6b:	8b 45 08             	mov    0x8(%ebp),%eax
80104d6e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104d75:	5d                   	pop    %ebp
80104d76:	c3                   	ret    

80104d77 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104d77:	55                   	push   %ebp
80104d78:	89 e5                	mov    %esp,%ebp
80104d7a:	83 ec 18             	sub    $0x18,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104d7d:	e8 3e 01 00 00       	call   80104ec0 <pushcli>
  if(holding(lk))
80104d82:	8b 45 08             	mov    0x8(%ebp),%eax
80104d85:	89 04 24             	mov    %eax,(%esp)
80104d88:	e8 09 01 00 00       	call   80104e96 <holding>
80104d8d:	85 c0                	test   %eax,%eax
80104d8f:	74 0c                	je     80104d9d <acquire+0x26>
    panic("acquire");
80104d91:	c7 04 24 61 87 10 80 	movl   $0x80108761,(%esp)
80104d98:	e8 9d b7 ff ff       	call   8010053a <panic>

  // The xchg is atomic.
  // It also serializes, so that reads after acquire are not
  // reordered before it. 
  while(xchg(&lk->locked, 1) != 0)
80104d9d:	8b 45 08             	mov    0x8(%ebp),%eax
80104da0:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80104da7:	00 
80104da8:	89 04 24             	mov    %eax,(%esp)
80104dab:	e8 8c ff ff ff       	call   80104d3c <xchg>
80104db0:	85 c0                	test   %eax,%eax
80104db2:	75 e9                	jne    80104d9d <acquire+0x26>
    ;

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104db4:	8b 45 08             	mov    0x8(%ebp),%eax
80104db7:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104dbe:	89 50 08             	mov    %edx,0x8(%eax)
  getcallerpcs(&lk, lk->pcs);
80104dc1:	8b 45 08             	mov    0x8(%ebp),%eax
80104dc4:	83 c0 0c             	add    $0xc,%eax
80104dc7:	89 44 24 04          	mov    %eax,0x4(%esp)
80104dcb:	8d 45 08             	lea    0x8(%ebp),%eax
80104dce:	89 04 24             	mov    %eax,(%esp)
80104dd1:	e8 51 00 00 00       	call   80104e27 <getcallerpcs>
}
80104dd6:	c9                   	leave  
80104dd7:	c3                   	ret    

80104dd8 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
80104dd8:	55                   	push   %ebp
80104dd9:	89 e5                	mov    %esp,%ebp
80104ddb:	83 ec 18             	sub    $0x18,%esp
  if(!holding(lk))
80104dde:	8b 45 08             	mov    0x8(%ebp),%eax
80104de1:	89 04 24             	mov    %eax,(%esp)
80104de4:	e8 ad 00 00 00       	call   80104e96 <holding>
80104de9:	85 c0                	test   %eax,%eax
80104deb:	75 0c                	jne    80104df9 <release+0x21>
    panic("release");
80104ded:	c7 04 24 69 87 10 80 	movl   $0x80108769,(%esp)
80104df4:	e8 41 b7 ff ff       	call   8010053a <panic>

  lk->pcs[0] = 0;
80104df9:	8b 45 08             	mov    0x8(%ebp),%eax
80104dfc:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
80104e03:	8b 45 08             	mov    0x8(%ebp),%eax
80104e06:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // But the 2007 Intel 64 Architecture Memory Ordering White
  // Paper says that Intel 64 and IA-32 will not move a load
  // after a store. So lock->locked = 0 would work here.
  // The xchg being asm volatile ensures gcc emits it after
  // the above assignments (and after the critical section).
  xchg(&lk->locked, 0);
80104e0d:	8b 45 08             	mov    0x8(%ebp),%eax
80104e10:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104e17:	00 
80104e18:	89 04 24             	mov    %eax,(%esp)
80104e1b:	e8 1c ff ff ff       	call   80104d3c <xchg>

  popcli();
80104e20:	e8 e3 00 00 00       	call   80104f08 <popcli>
}
80104e25:	c9                   	leave  
80104e26:	c3                   	ret    

80104e27 <getcallerpcs>:

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104e27:	55                   	push   %ebp
80104e28:	89 e5                	mov    %esp,%ebp
80104e2a:	83 ec 10             	sub    $0x10,%esp
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
80104e2d:	8b 45 08             	mov    0x8(%ebp),%eax
80104e30:	83 e8 08             	sub    $0x8,%eax
80104e33:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(i = 0; i < 10; i++){
80104e36:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
80104e3d:	eb 34                	jmp    80104e73 <getcallerpcs+0x4c>
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104e3f:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
80104e43:	74 49                	je     80104e8e <getcallerpcs+0x67>
80104e45:	81 7d f8 ff ff ff 7f 	cmpl   $0x7fffffff,-0x8(%ebp)
80104e4c:	76 40                	jbe    80104e8e <getcallerpcs+0x67>
80104e4e:	83 7d f8 ff          	cmpl   $0xffffffff,-0x8(%ebp)
80104e52:	74 3a                	je     80104e8e <getcallerpcs+0x67>
      break;
    pcs[i] = ebp[1];     // saved %eip
80104e54:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104e57:	c1 e0 02             	shl    $0x2,%eax
80104e5a:	03 45 0c             	add    0xc(%ebp),%eax
80104e5d:	8b 55 f8             	mov    -0x8(%ebp),%edx
80104e60:	83 c2 04             	add    $0x4,%edx
80104e63:	8b 12                	mov    (%edx),%edx
80104e65:	89 10                	mov    %edx,(%eax)
    ebp = (uint*)ebp[0]; // saved %ebp
80104e67:	8b 45 f8             	mov    -0x8(%ebp),%eax
80104e6a:	8b 00                	mov    (%eax),%eax
80104e6c:	89 45 f8             	mov    %eax,-0x8(%ebp)
{
  uint *ebp;
  int i;
  
  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104e6f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80104e73:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
80104e77:	7e c6                	jle    80104e3f <getcallerpcs+0x18>
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104e79:	eb 13                	jmp    80104e8e <getcallerpcs+0x67>
    pcs[i] = 0;
80104e7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
80104e7e:	c1 e0 02             	shl    $0x2,%eax
80104e81:	03 45 0c             	add    0xc(%ebp),%eax
80104e84:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
80104e8a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80104e8e:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
80104e92:	7e e7                	jle    80104e7b <getcallerpcs+0x54>
    pcs[i] = 0;
}
80104e94:	c9                   	leave  
80104e95:	c3                   	ret    

80104e96 <holding>:

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104e96:	55                   	push   %ebp
80104e97:	89 e5                	mov    %esp,%ebp
  return lock->locked && lock->cpu == cpu;
80104e99:	8b 45 08             	mov    0x8(%ebp),%eax
80104e9c:	8b 00                	mov    (%eax),%eax
80104e9e:	85 c0                	test   %eax,%eax
80104ea0:	74 17                	je     80104eb9 <holding+0x23>
80104ea2:	8b 45 08             	mov    0x8(%ebp),%eax
80104ea5:	8b 50 08             	mov    0x8(%eax),%edx
80104ea8:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104eae:	39 c2                	cmp    %eax,%edx
80104eb0:	75 07                	jne    80104eb9 <holding+0x23>
80104eb2:	b8 01 00 00 00       	mov    $0x1,%eax
80104eb7:	eb 05                	jmp    80104ebe <holding+0x28>
80104eb9:	b8 00 00 00 00       	mov    $0x0,%eax
}
80104ebe:	5d                   	pop    %ebp
80104ebf:	c3                   	ret    

80104ec0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104ec0:	55                   	push   %ebp
80104ec1:	89 e5                	mov    %esp,%ebp
80104ec3:	83 ec 10             	sub    $0x10,%esp
  int eflags;
  
  eflags = readeflags();
80104ec6:	e8 55 fe ff ff       	call   80104d20 <readeflags>
80104ecb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  cli();
80104ece:	e8 5d fe ff ff       	call   80104d30 <cli>
  if(cpu->ncli++ == 0)
80104ed3:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104ed9:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
80104edf:	85 d2                	test   %edx,%edx
80104ee1:	0f 94 c1             	sete   %cl
80104ee4:	83 c2 01             	add    $0x1,%edx
80104ee7:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
80104eed:	84 c9                	test   %cl,%cl
80104eef:	74 15                	je     80104f06 <pushcli+0x46>
    cpu->intena = eflags & FL_IF;
80104ef1:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104ef7:	8b 55 fc             	mov    -0x4(%ebp),%edx
80104efa:	81 e2 00 02 00 00    	and    $0x200,%edx
80104f00:	89 90 b0 00 00 00    	mov    %edx,0xb0(%eax)
}
80104f06:	c9                   	leave  
80104f07:	c3                   	ret    

80104f08 <popcli>:

void
popcli(void)
{
80104f08:	55                   	push   %ebp
80104f09:	89 e5                	mov    %esp,%ebp
80104f0b:	83 ec 18             	sub    $0x18,%esp
  if(readeflags()&FL_IF)
80104f0e:	e8 0d fe ff ff       	call   80104d20 <readeflags>
80104f13:	25 00 02 00 00       	and    $0x200,%eax
80104f18:	85 c0                	test   %eax,%eax
80104f1a:	74 0c                	je     80104f28 <popcli+0x20>
    panic("popcli - interruptible");
80104f1c:	c7 04 24 71 87 10 80 	movl   $0x80108771,(%esp)
80104f23:	e8 12 b6 ff ff       	call   8010053a <panic>
  if(--cpu->ncli < 0)
80104f28:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104f2e:	8b 90 ac 00 00 00    	mov    0xac(%eax),%edx
80104f34:	83 ea 01             	sub    $0x1,%edx
80104f37:	89 90 ac 00 00 00    	mov    %edx,0xac(%eax)
80104f3d:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
80104f43:	85 c0                	test   %eax,%eax
80104f45:	79 0c                	jns    80104f53 <popcli+0x4b>
    panic("popcli");
80104f47:	c7 04 24 88 87 10 80 	movl   $0x80108788,(%esp)
80104f4e:	e8 e7 b5 ff ff       	call   8010053a <panic>
  if(cpu->ncli == 0 && cpu->intena)
80104f53:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104f59:	8b 80 ac 00 00 00    	mov    0xac(%eax),%eax
80104f5f:	85 c0                	test   %eax,%eax
80104f61:	75 15                	jne    80104f78 <popcli+0x70>
80104f63:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104f69:	8b 80 b0 00 00 00    	mov    0xb0(%eax),%eax
80104f6f:	85 c0                	test   %eax,%eax
80104f71:	74 05                	je     80104f78 <popcli+0x70>
    sti();
80104f73:	e8 be fd ff ff       	call   80104d36 <sti>
}
80104f78:	c9                   	leave  
80104f79:	c3                   	ret    
	...

80104f7c <stosb>:
80104f7c:	55                   	push   %ebp
80104f7d:	89 e5                	mov    %esp,%ebp
80104f7f:	57                   	push   %edi
80104f80:	53                   	push   %ebx
80104f81:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104f84:	8b 55 10             	mov    0x10(%ebp),%edx
80104f87:	8b 45 0c             	mov    0xc(%ebp),%eax
80104f8a:	89 cb                	mov    %ecx,%ebx
80104f8c:	89 df                	mov    %ebx,%edi
80104f8e:	89 d1                	mov    %edx,%ecx
80104f90:	fc                   	cld    
80104f91:	f3 aa                	rep stos %al,%es:(%edi)
80104f93:	89 ca                	mov    %ecx,%edx
80104f95:	89 fb                	mov    %edi,%ebx
80104f97:	89 5d 08             	mov    %ebx,0x8(%ebp)
80104f9a:	89 55 10             	mov    %edx,0x10(%ebp)
80104f9d:	5b                   	pop    %ebx
80104f9e:	5f                   	pop    %edi
80104f9f:	5d                   	pop    %ebp
80104fa0:	c3                   	ret    

80104fa1 <stosl>:
80104fa1:	55                   	push   %ebp
80104fa2:	89 e5                	mov    %esp,%ebp
80104fa4:	57                   	push   %edi
80104fa5:	53                   	push   %ebx
80104fa6:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104fa9:	8b 55 10             	mov    0x10(%ebp),%edx
80104fac:	8b 45 0c             	mov    0xc(%ebp),%eax
80104faf:	89 cb                	mov    %ecx,%ebx
80104fb1:	89 df                	mov    %ebx,%edi
80104fb3:	89 d1                	mov    %edx,%ecx
80104fb5:	fc                   	cld    
80104fb6:	f3 ab                	rep stos %eax,%es:(%edi)
80104fb8:	89 ca                	mov    %ecx,%edx
80104fba:	89 fb                	mov    %edi,%ebx
80104fbc:	89 5d 08             	mov    %ebx,0x8(%ebp)
80104fbf:	89 55 10             	mov    %edx,0x10(%ebp)
80104fc2:	5b                   	pop    %ebx
80104fc3:	5f                   	pop    %edi
80104fc4:	5d                   	pop    %ebp
80104fc5:	c3                   	ret    

80104fc6 <memset>:
80104fc6:	55                   	push   %ebp
80104fc7:	89 e5                	mov    %esp,%ebp
80104fc9:	83 ec 0c             	sub    $0xc,%esp
80104fcc:	8b 45 08             	mov    0x8(%ebp),%eax
80104fcf:	83 e0 03             	and    $0x3,%eax
80104fd2:	85 c0                	test   %eax,%eax
80104fd4:	75 49                	jne    8010501f <memset+0x59>
80104fd6:	8b 45 10             	mov    0x10(%ebp),%eax
80104fd9:	83 e0 03             	and    $0x3,%eax
80104fdc:	85 c0                	test   %eax,%eax
80104fde:	75 3f                	jne    8010501f <memset+0x59>
80104fe0:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
80104fe7:	8b 45 10             	mov    0x10(%ebp),%eax
80104fea:	c1 e8 02             	shr    $0x2,%eax
80104fed:	89 c2                	mov    %eax,%edx
80104fef:	8b 45 0c             	mov    0xc(%ebp),%eax
80104ff2:	89 c1                	mov    %eax,%ecx
80104ff4:	c1 e1 18             	shl    $0x18,%ecx
80104ff7:	8b 45 0c             	mov    0xc(%ebp),%eax
80104ffa:	c1 e0 10             	shl    $0x10,%eax
80104ffd:	09 c1                	or     %eax,%ecx
80104fff:	8b 45 0c             	mov    0xc(%ebp),%eax
80105002:	c1 e0 08             	shl    $0x8,%eax
80105005:	09 c8                	or     %ecx,%eax
80105007:	0b 45 0c             	or     0xc(%ebp),%eax
8010500a:	89 54 24 08          	mov    %edx,0x8(%esp)
8010500e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105012:	8b 45 08             	mov    0x8(%ebp),%eax
80105015:	89 04 24             	mov    %eax,(%esp)
80105018:	e8 84 ff ff ff       	call   80104fa1 <stosl>
8010501d:	eb 19                	jmp    80105038 <memset+0x72>
8010501f:	8b 45 10             	mov    0x10(%ebp),%eax
80105022:	89 44 24 08          	mov    %eax,0x8(%esp)
80105026:	8b 45 0c             	mov    0xc(%ebp),%eax
80105029:	89 44 24 04          	mov    %eax,0x4(%esp)
8010502d:	8b 45 08             	mov    0x8(%ebp),%eax
80105030:	89 04 24             	mov    %eax,(%esp)
80105033:	e8 44 ff ff ff       	call   80104f7c <stosb>
80105038:	8b 45 08             	mov    0x8(%ebp),%eax
8010503b:	c9                   	leave  
8010503c:	c3                   	ret    

8010503d <memcmp>:
8010503d:	55                   	push   %ebp
8010503e:	89 e5                	mov    %esp,%ebp
80105040:	83 ec 10             	sub    $0x10,%esp
80105043:	8b 45 08             	mov    0x8(%ebp),%eax
80105046:	89 45 f8             	mov    %eax,-0x8(%ebp)
80105049:	8b 45 0c             	mov    0xc(%ebp),%eax
8010504c:	89 45 fc             	mov    %eax,-0x4(%ebp)
8010504f:	eb 32                	jmp    80105083 <memcmp+0x46>
80105051:	8b 45 f8             	mov    -0x8(%ebp),%eax
80105054:	0f b6 10             	movzbl (%eax),%edx
80105057:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010505a:	0f b6 00             	movzbl (%eax),%eax
8010505d:	38 c2                	cmp    %al,%dl
8010505f:	74 1a                	je     8010507b <memcmp+0x3e>
80105061:	8b 45 f8             	mov    -0x8(%ebp),%eax
80105064:	0f b6 00             	movzbl (%eax),%eax
80105067:	0f b6 d0             	movzbl %al,%edx
8010506a:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010506d:	0f b6 00             	movzbl (%eax),%eax
80105070:	0f b6 c0             	movzbl %al,%eax
80105073:	89 d1                	mov    %edx,%ecx
80105075:	29 c1                	sub    %eax,%ecx
80105077:	89 c8                	mov    %ecx,%eax
80105079:	eb 1c                	jmp    80105097 <memcmp+0x5a>
8010507b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
8010507f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80105083:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105087:	0f 95 c0             	setne  %al
8010508a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
8010508e:	84 c0                	test   %al,%al
80105090:	75 bf                	jne    80105051 <memcmp+0x14>
80105092:	b8 00 00 00 00       	mov    $0x0,%eax
80105097:	c9                   	leave  
80105098:	c3                   	ret    

80105099 <memmove>:
80105099:	55                   	push   %ebp
8010509a:	89 e5                	mov    %esp,%ebp
8010509c:	83 ec 10             	sub    $0x10,%esp
8010509f:	8b 45 0c             	mov    0xc(%ebp),%eax
801050a2:	89 45 f8             	mov    %eax,-0x8(%ebp)
801050a5:	8b 45 08             	mov    0x8(%ebp),%eax
801050a8:	89 45 fc             	mov    %eax,-0x4(%ebp)
801050ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
801050ae:	3b 45 fc             	cmp    -0x4(%ebp),%eax
801050b1:	73 55                	jae    80105108 <memmove+0x6f>
801050b3:	8b 45 10             	mov    0x10(%ebp),%eax
801050b6:	8b 55 f8             	mov    -0x8(%ebp),%edx
801050b9:	8d 04 02             	lea    (%edx,%eax,1),%eax
801050bc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
801050bf:	76 4a                	jbe    8010510b <memmove+0x72>
801050c1:	8b 45 10             	mov    0x10(%ebp),%eax
801050c4:	01 45 f8             	add    %eax,-0x8(%ebp)
801050c7:	8b 45 10             	mov    0x10(%ebp),%eax
801050ca:	01 45 fc             	add    %eax,-0x4(%ebp)
801050cd:	eb 13                	jmp    801050e2 <memmove+0x49>
801050cf:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
801050d3:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
801050d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
801050da:	0f b6 10             	movzbl (%eax),%edx
801050dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
801050e0:	88 10                	mov    %dl,(%eax)
801050e2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801050e6:	0f 95 c0             	setne  %al
801050e9:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801050ed:	84 c0                	test   %al,%al
801050ef:	75 de                	jne    801050cf <memmove+0x36>
801050f1:	eb 28                	jmp    8010511b <memmove+0x82>
801050f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
801050f6:	0f b6 10             	movzbl (%eax),%edx
801050f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
801050fc:	88 10                	mov    %dl,(%eax)
801050fe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80105102:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
80105106:	eb 04                	jmp    8010510c <memmove+0x73>
80105108:	90                   	nop
80105109:	eb 01                	jmp    8010510c <memmove+0x73>
8010510b:	90                   	nop
8010510c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105110:	0f 95 c0             	setne  %al
80105113:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
80105117:	84 c0                	test   %al,%al
80105119:	75 d8                	jne    801050f3 <memmove+0x5a>
8010511b:	8b 45 08             	mov    0x8(%ebp),%eax
8010511e:	c9                   	leave  
8010511f:	c3                   	ret    

80105120 <memcpy>:
80105120:	55                   	push   %ebp
80105121:	89 e5                	mov    %esp,%ebp
80105123:	83 ec 0c             	sub    $0xc,%esp
80105126:	8b 45 10             	mov    0x10(%ebp),%eax
80105129:	89 44 24 08          	mov    %eax,0x8(%esp)
8010512d:	8b 45 0c             	mov    0xc(%ebp),%eax
80105130:	89 44 24 04          	mov    %eax,0x4(%esp)
80105134:	8b 45 08             	mov    0x8(%ebp),%eax
80105137:	89 04 24             	mov    %eax,(%esp)
8010513a:	e8 5a ff ff ff       	call   80105099 <memmove>
8010513f:	c9                   	leave  
80105140:	c3                   	ret    

80105141 <strncmp>:
80105141:	55                   	push   %ebp
80105142:	89 e5                	mov    %esp,%ebp
80105144:	eb 0c                	jmp    80105152 <strncmp+0x11>
80105146:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
8010514a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
8010514e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
80105152:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105156:	74 1a                	je     80105172 <strncmp+0x31>
80105158:	8b 45 08             	mov    0x8(%ebp),%eax
8010515b:	0f b6 00             	movzbl (%eax),%eax
8010515e:	84 c0                	test   %al,%al
80105160:	74 10                	je     80105172 <strncmp+0x31>
80105162:	8b 45 08             	mov    0x8(%ebp),%eax
80105165:	0f b6 10             	movzbl (%eax),%edx
80105168:	8b 45 0c             	mov    0xc(%ebp),%eax
8010516b:	0f b6 00             	movzbl (%eax),%eax
8010516e:	38 c2                	cmp    %al,%dl
80105170:	74 d4                	je     80105146 <strncmp+0x5>
80105172:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105176:	75 07                	jne    8010517f <strncmp+0x3e>
80105178:	b8 00 00 00 00       	mov    $0x0,%eax
8010517d:	eb 18                	jmp    80105197 <strncmp+0x56>
8010517f:	8b 45 08             	mov    0x8(%ebp),%eax
80105182:	0f b6 00             	movzbl (%eax),%eax
80105185:	0f b6 d0             	movzbl %al,%edx
80105188:	8b 45 0c             	mov    0xc(%ebp),%eax
8010518b:	0f b6 00             	movzbl (%eax),%eax
8010518e:	0f b6 c0             	movzbl %al,%eax
80105191:	89 d1                	mov    %edx,%ecx
80105193:	29 c1                	sub    %eax,%ecx
80105195:	89 c8                	mov    %ecx,%eax
80105197:	5d                   	pop    %ebp
80105198:	c3                   	ret    

80105199 <strncpy>:
80105199:	55                   	push   %ebp
8010519a:	89 e5                	mov    %esp,%ebp
8010519c:	83 ec 10             	sub    $0x10,%esp
8010519f:	8b 45 08             	mov    0x8(%ebp),%eax
801051a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
801051a5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801051a9:	0f 9f c0             	setg   %al
801051ac:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801051b0:	84 c0                	test   %al,%al
801051b2:	74 30                	je     801051e4 <strncpy+0x4b>
801051b4:	8b 45 0c             	mov    0xc(%ebp),%eax
801051b7:	0f b6 10             	movzbl (%eax),%edx
801051ba:	8b 45 08             	mov    0x8(%ebp),%eax
801051bd:	88 10                	mov    %dl,(%eax)
801051bf:	8b 45 08             	mov    0x8(%ebp),%eax
801051c2:	0f b6 00             	movzbl (%eax),%eax
801051c5:	84 c0                	test   %al,%al
801051c7:	0f 95 c0             	setne  %al
801051ca:	83 45 08 01          	addl   $0x1,0x8(%ebp)
801051ce:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
801051d2:	84 c0                	test   %al,%al
801051d4:	75 cf                	jne    801051a5 <strncpy+0xc>
801051d6:	eb 0d                	jmp    801051e5 <strncpy+0x4c>
801051d8:	8b 45 08             	mov    0x8(%ebp),%eax
801051db:	c6 00 00             	movb   $0x0,(%eax)
801051de:	83 45 08 01          	addl   $0x1,0x8(%ebp)
801051e2:	eb 01                	jmp    801051e5 <strncpy+0x4c>
801051e4:	90                   	nop
801051e5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801051e9:	0f 9f c0             	setg   %al
801051ec:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801051f0:	84 c0                	test   %al,%al
801051f2:	75 e4                	jne    801051d8 <strncpy+0x3f>
801051f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
801051f7:	c9                   	leave  
801051f8:	c3                   	ret    

801051f9 <safestrcpy>:
801051f9:	55                   	push   %ebp
801051fa:	89 e5                	mov    %esp,%ebp
801051fc:	83 ec 10             	sub    $0x10,%esp
801051ff:	8b 45 08             	mov    0x8(%ebp),%eax
80105202:	89 45 fc             	mov    %eax,-0x4(%ebp)
80105205:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105209:	7f 05                	jg     80105210 <safestrcpy+0x17>
8010520b:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010520e:	eb 35                	jmp    80105245 <safestrcpy+0x4c>
80105210:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
80105214:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80105218:	7e 22                	jle    8010523c <safestrcpy+0x43>
8010521a:	8b 45 0c             	mov    0xc(%ebp),%eax
8010521d:	0f b6 10             	movzbl (%eax),%edx
80105220:	8b 45 08             	mov    0x8(%ebp),%eax
80105223:	88 10                	mov    %dl,(%eax)
80105225:	8b 45 08             	mov    0x8(%ebp),%eax
80105228:	0f b6 00             	movzbl (%eax),%eax
8010522b:	84 c0                	test   %al,%al
8010522d:	0f 95 c0             	setne  %al
80105230:	83 45 08 01          	addl   $0x1,0x8(%ebp)
80105234:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
80105238:	84 c0                	test   %al,%al
8010523a:	75 d4                	jne    80105210 <safestrcpy+0x17>
8010523c:	8b 45 08             	mov    0x8(%ebp),%eax
8010523f:	c6 00 00             	movb   $0x0,(%eax)
80105242:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105245:	c9                   	leave  
80105246:	c3                   	ret    

80105247 <strlen>:
80105247:	55                   	push   %ebp
80105248:	89 e5                	mov    %esp,%ebp
8010524a:	83 ec 10             	sub    $0x10,%esp
8010524d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
80105254:	eb 04                	jmp    8010525a <strlen+0x13>
80105256:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
8010525a:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010525d:	03 45 08             	add    0x8(%ebp),%eax
80105260:	0f b6 00             	movzbl (%eax),%eax
80105263:	84 c0                	test   %al,%al
80105265:	75 ef                	jne    80105256 <strlen+0xf>
80105267:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010526a:	c9                   	leave  
8010526b:	c3                   	ret    

8010526c <swtch>:
8010526c:	8b 44 24 04          	mov    0x4(%esp),%eax
80105270:	8b 54 24 08          	mov    0x8(%esp),%edx
80105274:	55                   	push   %ebp
80105275:	53                   	push   %ebx
80105276:	56                   	push   %esi
80105277:	57                   	push   %edi
80105278:	89 20                	mov    %esp,(%eax)
8010527a:	89 d4                	mov    %edx,%esp
8010527c:	5f                   	pop    %edi
8010527d:	5e                   	pop    %esi
8010527e:	5b                   	pop    %ebx
8010527f:	5d                   	pop    %ebp
80105280:	c3                   	ret    
80105281:	00 00                	add    %al,(%eax)
	...

80105284 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80105284:	55                   	push   %ebp
80105285:	89 e5                	mov    %esp,%ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
80105287:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010528d:	8b 00                	mov    (%eax),%eax
8010528f:	3b 45 08             	cmp    0x8(%ebp),%eax
80105292:	76 12                	jbe    801052a6 <fetchint+0x22>
80105294:	8b 45 08             	mov    0x8(%ebp),%eax
80105297:	8d 50 04             	lea    0x4(%eax),%edx
8010529a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801052a0:	8b 00                	mov    (%eax),%eax
801052a2:	39 c2                	cmp    %eax,%edx
801052a4:	76 07                	jbe    801052ad <fetchint+0x29>
    return -1;
801052a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052ab:	eb 0f                	jmp    801052bc <fetchint+0x38>
  *ip = *(int*)(addr);
801052ad:	8b 45 08             	mov    0x8(%ebp),%eax
801052b0:	8b 10                	mov    (%eax),%edx
801052b2:	8b 45 0c             	mov    0xc(%ebp),%eax
801052b5:	89 10                	mov    %edx,(%eax)
  return 0;
801052b7:	b8 00 00 00 00       	mov    $0x0,%eax
}
801052bc:	5d                   	pop    %ebp
801052bd:	c3                   	ret    

801052be <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801052be:	55                   	push   %ebp
801052bf:	89 e5                	mov    %esp,%ebp
801052c1:	83 ec 10             	sub    $0x10,%esp
  char *s, *ep;

  if(addr >= proc->sz)
801052c4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801052ca:	8b 00                	mov    (%eax),%eax
801052cc:	3b 45 08             	cmp    0x8(%ebp),%eax
801052cf:	77 07                	ja     801052d8 <fetchstr+0x1a>
    return -1;
801052d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052d6:	eb 48                	jmp    80105320 <fetchstr+0x62>
  *pp = (char*)addr;
801052d8:	8b 55 08             	mov    0x8(%ebp),%edx
801052db:	8b 45 0c             	mov    0xc(%ebp),%eax
801052de:	89 10                	mov    %edx,(%eax)
  ep = (char*)proc->sz;
801052e0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801052e6:	8b 00                	mov    (%eax),%eax
801052e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  for(s = *pp; s < ep; s++)
801052eb:	8b 45 0c             	mov    0xc(%ebp),%eax
801052ee:	8b 00                	mov    (%eax),%eax
801052f0:	89 45 f8             	mov    %eax,-0x8(%ebp)
801052f3:	eb 1e                	jmp    80105313 <fetchstr+0x55>
    if(*s == 0)
801052f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
801052f8:	0f b6 00             	movzbl (%eax),%eax
801052fb:	84 c0                	test   %al,%al
801052fd:	75 10                	jne    8010530f <fetchstr+0x51>
      return s - *pp;
801052ff:	8b 55 f8             	mov    -0x8(%ebp),%edx
80105302:	8b 45 0c             	mov    0xc(%ebp),%eax
80105305:	8b 00                	mov    (%eax),%eax
80105307:	89 d1                	mov    %edx,%ecx
80105309:	29 c1                	sub    %eax,%ecx
8010530b:	89 c8                	mov    %ecx,%eax
8010530d:	eb 11                	jmp    80105320 <fetchstr+0x62>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
8010530f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
80105313:	8b 45 f8             	mov    -0x8(%ebp),%eax
80105316:	3b 45 fc             	cmp    -0x4(%ebp),%eax
80105319:	72 da                	jb     801052f5 <fetchstr+0x37>
    if(*s == 0)
      return s - *pp;
  return -1;
8010531b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105320:	c9                   	leave  
80105321:	c3                   	ret    

80105322 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80105322:	55                   	push   %ebp
80105323:	89 e5                	mov    %esp,%ebp
80105325:	83 ec 08             	sub    $0x8,%esp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80105328:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010532e:	8b 40 18             	mov    0x18(%eax),%eax
80105331:	8b 50 44             	mov    0x44(%eax),%edx
80105334:	8b 45 08             	mov    0x8(%ebp),%eax
80105337:	c1 e0 02             	shl    $0x2,%eax
8010533a:	8d 04 02             	lea    (%edx,%eax,1),%eax
8010533d:	8d 50 04             	lea    0x4(%eax),%edx
80105340:	8b 45 0c             	mov    0xc(%ebp),%eax
80105343:	89 44 24 04          	mov    %eax,0x4(%esp)
80105347:	89 14 24             	mov    %edx,(%esp)
8010534a:	e8 35 ff ff ff       	call   80105284 <fetchint>
}
8010534f:	c9                   	leave  
80105350:	c3                   	ret    

80105351 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size n bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80105351:	55                   	push   %ebp
80105352:	89 e5                	mov    %esp,%ebp
80105354:	83 ec 18             	sub    $0x18,%esp
  int i;
  
  if(argint(n, &i) < 0)
80105357:	8d 45 fc             	lea    -0x4(%ebp),%eax
8010535a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010535e:	8b 45 08             	mov    0x8(%ebp),%eax
80105361:	89 04 24             	mov    %eax,(%esp)
80105364:	e8 b9 ff ff ff       	call   80105322 <argint>
80105369:	85 c0                	test   %eax,%eax
8010536b:	79 07                	jns    80105374 <argptr+0x23>
    return -1;
8010536d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105372:	eb 3d                	jmp    801053b1 <argptr+0x60>
  if((uint)i >= proc->sz || (uint)i+size > proc->sz)
80105374:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105377:	89 c2                	mov    %eax,%edx
80105379:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010537f:	8b 00                	mov    (%eax),%eax
80105381:	39 c2                	cmp    %eax,%edx
80105383:	73 16                	jae    8010539b <argptr+0x4a>
80105385:	8b 45 fc             	mov    -0x4(%ebp),%eax
80105388:	89 c2                	mov    %eax,%edx
8010538a:	8b 45 10             	mov    0x10(%ebp),%eax
8010538d:	01 c2                	add    %eax,%edx
8010538f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105395:	8b 00                	mov    (%eax),%eax
80105397:	39 c2                	cmp    %eax,%edx
80105399:	76 07                	jbe    801053a2 <argptr+0x51>
    return -1;
8010539b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053a0:	eb 0f                	jmp    801053b1 <argptr+0x60>
  *pp = (char*)i;
801053a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
801053a5:	89 c2                	mov    %eax,%edx
801053a7:	8b 45 0c             	mov    0xc(%ebp),%eax
801053aa:	89 10                	mov    %edx,(%eax)
  return 0;
801053ac:	b8 00 00 00 00       	mov    $0x0,%eax
}
801053b1:	c9                   	leave  
801053b2:	c3                   	ret    

801053b3 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801053b3:	55                   	push   %ebp
801053b4:	89 e5                	mov    %esp,%ebp
801053b6:	83 ec 18             	sub    $0x18,%esp
  int addr;
  if(argint(n, &addr) < 0)
801053b9:	8d 45 fc             	lea    -0x4(%ebp),%eax
801053bc:	89 44 24 04          	mov    %eax,0x4(%esp)
801053c0:	8b 45 08             	mov    0x8(%ebp),%eax
801053c3:	89 04 24             	mov    %eax,(%esp)
801053c6:	e8 57 ff ff ff       	call   80105322 <argint>
801053cb:	85 c0                	test   %eax,%eax
801053cd:	79 07                	jns    801053d6 <argstr+0x23>
    return -1;
801053cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053d4:	eb 12                	jmp    801053e8 <argstr+0x35>
  return fetchstr(addr, pp);
801053d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
801053d9:	8b 55 0c             	mov    0xc(%ebp),%edx
801053dc:	89 54 24 04          	mov    %edx,0x4(%esp)
801053e0:	89 04 24             	mov    %eax,(%esp)
801053e3:	e8 d6 fe ff ff       	call   801052be <fetchstr>
}
801053e8:	c9                   	leave  
801053e9:	c3                   	ret    

801053ea <syscall>:
[SYS_setPriority] sys_setPriority,
};

void
syscall(void)
{
801053ea:	55                   	push   %ebp
801053eb:	89 e5                	mov    %esp,%ebp
801053ed:	53                   	push   %ebx
801053ee:	83 ec 24             	sub    $0x24,%esp
  int num;

  num = proc->tf->eax;
801053f1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801053f7:	8b 40 18             	mov    0x18(%eax),%eax
801053fa:	8b 40 1c             	mov    0x1c(%eax),%eax
801053fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80105400:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105404:	7e 30                	jle    80105436 <syscall+0x4c>
80105406:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105409:	83 f8 18             	cmp    $0x18,%eax
8010540c:	77 28                	ja     80105436 <syscall+0x4c>
8010540e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105411:	8b 04 85 40 b0 10 80 	mov    -0x7fef4fc0(,%eax,4),%eax
80105418:	85 c0                	test   %eax,%eax
8010541a:	74 1a                	je     80105436 <syscall+0x4c>
    proc->tf->eax = syscalls[num]();
8010541c:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105422:	8b 58 18             	mov    0x18(%eax),%ebx
80105425:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105428:	8b 04 85 40 b0 10 80 	mov    -0x7fef4fc0(,%eax,4),%eax
8010542f:	ff d0                	call   *%eax
80105431:	89 43 1c             	mov    %eax,0x1c(%ebx)
syscall(void)
{
  int num;

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80105434:	eb 3d                	jmp    80105473 <syscall+0x89>
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
80105436:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
8010543c:	8d 48 6c             	lea    0x6c(%eax),%ecx
            proc->pid, proc->name, num);
8010543f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80105445:	8b 40 10             	mov    0x10(%eax),%eax
80105448:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010544b:	89 54 24 0c          	mov    %edx,0xc(%esp)
8010544f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80105453:	89 44 24 04          	mov    %eax,0x4(%esp)
80105457:	c7 04 24 8f 87 10 80 	movl   $0x8010878f,(%esp)
8010545e:	e8 37 af ff ff       	call   8010039a <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
80105463:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105469:	8b 40 18             	mov    0x18(%eax),%eax
8010546c:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80105473:	83 c4 24             	add    $0x24,%esp
80105476:	5b                   	pop    %ebx
80105477:	5d                   	pop    %ebp
80105478:	c3                   	ret    
80105479:	00 00                	add    %al,(%eax)
	...

8010547c <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
8010547c:	55                   	push   %ebp
8010547d:	89 e5                	mov    %esp,%ebp
8010547f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80105482:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105485:	89 44 24 04          	mov    %eax,0x4(%esp)
80105489:	8b 45 08             	mov    0x8(%ebp),%eax
8010548c:	89 04 24             	mov    %eax,(%esp)
8010548f:	e8 8e fe ff ff       	call   80105322 <argint>
80105494:	85 c0                	test   %eax,%eax
80105496:	79 07                	jns    8010549f <argfd+0x23>
    return -1;
80105498:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010549d:	eb 50                	jmp    801054ef <argfd+0x73>
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
8010549f:	8b 45 f0             	mov    -0x10(%ebp),%eax
801054a2:	85 c0                	test   %eax,%eax
801054a4:	78 21                	js     801054c7 <argfd+0x4b>
801054a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
801054a9:	83 f8 0f             	cmp    $0xf,%eax
801054ac:	7f 19                	jg     801054c7 <argfd+0x4b>
801054ae:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801054b4:	8b 55 f0             	mov    -0x10(%ebp),%edx
801054b7:	83 c2 08             	add    $0x8,%edx
801054ba:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
801054be:	89 45 f4             	mov    %eax,-0xc(%ebp)
801054c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
801054c5:	75 07                	jne    801054ce <argfd+0x52>
    return -1;
801054c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054cc:	eb 21                	jmp    801054ef <argfd+0x73>
  if(pfd)
801054ce:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
801054d2:	74 08                	je     801054dc <argfd+0x60>
    *pfd = fd;
801054d4:	8b 55 f0             	mov    -0x10(%ebp),%edx
801054d7:	8b 45 0c             	mov    0xc(%ebp),%eax
801054da:	89 10                	mov    %edx,(%eax)
  if(pf)
801054dc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801054e0:	74 08                	je     801054ea <argfd+0x6e>
    *pf = f;
801054e2:	8b 45 10             	mov    0x10(%ebp),%eax
801054e5:	8b 55 f4             	mov    -0xc(%ebp),%edx
801054e8:	89 10                	mov    %edx,(%eax)
  return 0;
801054ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
801054ef:	c9                   	leave  
801054f0:	c3                   	ret    

801054f1 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
801054f1:	55                   	push   %ebp
801054f2:	89 e5                	mov    %esp,%ebp
801054f4:	83 ec 10             	sub    $0x10,%esp
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801054f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
801054fe:	eb 30                	jmp    80105530 <fdalloc+0x3f>
    if(proc->ofile[fd] == 0){
80105500:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105506:	8b 55 fc             	mov    -0x4(%ebp),%edx
80105509:	83 c2 08             	add    $0x8,%edx
8010550c:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
80105510:	85 c0                	test   %eax,%eax
80105512:	75 18                	jne    8010552c <fdalloc+0x3b>
      proc->ofile[fd] = f;
80105514:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010551a:	8b 55 fc             	mov    -0x4(%ebp),%edx
8010551d:	8d 4a 08             	lea    0x8(%edx),%ecx
80105520:	8b 55 08             	mov    0x8(%ebp),%edx
80105523:	89 54 88 08          	mov    %edx,0x8(%eax,%ecx,4)
      return fd;
80105527:	8b 45 fc             	mov    -0x4(%ebp),%eax
8010552a:	eb 0f                	jmp    8010553b <fdalloc+0x4a>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
8010552c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
80105530:	83 7d fc 0f          	cmpl   $0xf,-0x4(%ebp)
80105534:	7e ca                	jle    80105500 <fdalloc+0xf>
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
80105536:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010553b:	c9                   	leave  
8010553c:	c3                   	ret    

8010553d <sys_dup>:

int
sys_dup(void)
{
8010553d:	55                   	push   %ebp
8010553e:	89 e5                	mov    %esp,%ebp
80105540:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int fd;
  
  if(argfd(0, 0, &f) < 0)
80105543:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105546:	89 44 24 08          	mov    %eax,0x8(%esp)
8010554a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105551:	00 
80105552:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105559:	e8 1e ff ff ff       	call   8010547c <argfd>
8010555e:	85 c0                	test   %eax,%eax
80105560:	79 07                	jns    80105569 <sys_dup+0x2c>
    return -1;
80105562:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105567:	eb 29                	jmp    80105592 <sys_dup+0x55>
  if((fd=fdalloc(f)) < 0)
80105569:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010556c:	89 04 24             	mov    %eax,(%esp)
8010556f:	e8 7d ff ff ff       	call   801054f1 <fdalloc>
80105574:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105577:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010557b:	79 07                	jns    80105584 <sys_dup+0x47>
    return -1;
8010557d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105582:	eb 0e                	jmp    80105592 <sys_dup+0x55>
  filedup(f);
80105584:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105587:	89 04 24             	mov    %eax,(%esp)
8010558a:	e8 ea b9 ff ff       	call   80100f79 <filedup>
  return fd;
8010558f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
80105592:	c9                   	leave  
80105593:	c3                   	ret    

80105594 <sys_read>:

int
sys_read(void)
{
80105594:	55                   	push   %ebp
80105595:	89 e5                	mov    %esp,%ebp
80105597:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
8010559a:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010559d:	89 44 24 08          	mov    %eax,0x8(%esp)
801055a1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801055a8:	00 
801055a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801055b0:	e8 c7 fe ff ff       	call   8010547c <argfd>
801055b5:	85 c0                	test   %eax,%eax
801055b7:	78 35                	js     801055ee <sys_read+0x5a>
801055b9:	8d 45 f0             	lea    -0x10(%ebp),%eax
801055bc:	89 44 24 04          	mov    %eax,0x4(%esp)
801055c0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
801055c7:	e8 56 fd ff ff       	call   80105322 <argint>
801055cc:	85 c0                	test   %eax,%eax
801055ce:	78 1e                	js     801055ee <sys_read+0x5a>
801055d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
801055d3:	89 44 24 08          	mov    %eax,0x8(%esp)
801055d7:	8d 45 ec             	lea    -0x14(%ebp),%eax
801055da:	89 44 24 04          	mov    %eax,0x4(%esp)
801055de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801055e5:	e8 67 fd ff ff       	call   80105351 <argptr>
801055ea:	85 c0                	test   %eax,%eax
801055ec:	79 07                	jns    801055f5 <sys_read+0x61>
    return -1;
801055ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055f3:	eb 19                	jmp    8010560e <sys_read+0x7a>
  return fileread(f, p, n);
801055f5:	8b 4d f0             	mov    -0x10(%ebp),%ecx
801055f8:	8b 55 ec             	mov    -0x14(%ebp),%edx
801055fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801055fe:	89 4c 24 08          	mov    %ecx,0x8(%esp)
80105602:	89 54 24 04          	mov    %edx,0x4(%esp)
80105606:	89 04 24             	mov    %eax,(%esp)
80105609:	e8 d8 ba ff ff       	call   801010e6 <fileread>
}
8010560e:	c9                   	leave  
8010560f:	c3                   	ret    

80105610 <sys_write>:

int
sys_write(void)
{
80105610:	55                   	push   %ebp
80105611:	89 e5                	mov    %esp,%ebp
80105613:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80105616:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105619:	89 44 24 08          	mov    %eax,0x8(%esp)
8010561d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105624:	00 
80105625:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010562c:	e8 4b fe ff ff       	call   8010547c <argfd>
80105631:	85 c0                	test   %eax,%eax
80105633:	78 35                	js     8010566a <sys_write+0x5a>
80105635:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105638:	89 44 24 04          	mov    %eax,0x4(%esp)
8010563c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80105643:	e8 da fc ff ff       	call   80105322 <argint>
80105648:	85 c0                	test   %eax,%eax
8010564a:	78 1e                	js     8010566a <sys_write+0x5a>
8010564c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010564f:	89 44 24 08          	mov    %eax,0x8(%esp)
80105653:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105656:	89 44 24 04          	mov    %eax,0x4(%esp)
8010565a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105661:	e8 eb fc ff ff       	call   80105351 <argptr>
80105666:	85 c0                	test   %eax,%eax
80105668:	79 07                	jns    80105671 <sys_write+0x61>
    return -1;
8010566a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010566f:	eb 19                	jmp    8010568a <sys_write+0x7a>
  return filewrite(f, p, n);
80105671:	8b 4d f0             	mov    -0x10(%ebp),%ecx
80105674:	8b 55 ec             	mov    -0x14(%ebp),%edx
80105677:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010567a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
8010567e:	89 54 24 04          	mov    %edx,0x4(%esp)
80105682:	89 04 24             	mov    %eax,(%esp)
80105685:	e8 18 bb ff ff       	call   801011a2 <filewrite>
}
8010568a:	c9                   	leave  
8010568b:	c3                   	ret    

8010568c <sys_close>:

int
sys_close(void)
{
8010568c:	55                   	push   %ebp
8010568d:	89 e5                	mov    %esp,%ebp
8010568f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;
  
  if(argfd(0, &fd, &f) < 0)
80105692:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105695:	89 44 24 08          	mov    %eax,0x8(%esp)
80105699:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010569c:	89 44 24 04          	mov    %eax,0x4(%esp)
801056a0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801056a7:	e8 d0 fd ff ff       	call   8010547c <argfd>
801056ac:	85 c0                	test   %eax,%eax
801056ae:	79 07                	jns    801056b7 <sys_close+0x2b>
    return -1;
801056b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056b5:	eb 24                	jmp    801056db <sys_close+0x4f>
  proc->ofile[fd] = 0;
801056b7:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801056bd:	8b 55 f4             	mov    -0xc(%ebp),%edx
801056c0:	83 c2 08             	add    $0x8,%edx
801056c3:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
801056ca:	00 
  fileclose(f);
801056cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
801056ce:	89 04 24             	mov    %eax,(%esp)
801056d1:	e8 eb b8 ff ff       	call   80100fc1 <fileclose>
  return 0;
801056d6:	b8 00 00 00 00       	mov    $0x0,%eax
}
801056db:	c9                   	leave  
801056dc:	c3                   	ret    

801056dd <sys_fstat>:

int
sys_fstat(void)
{
801056dd:	55                   	push   %ebp
801056de:	89 e5                	mov    %esp,%ebp
801056e0:	83 ec 28             	sub    $0x28,%esp
  struct file *f;
  struct stat *st;
  
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
801056e3:	8d 45 f4             	lea    -0xc(%ebp),%eax
801056e6:	89 44 24 08          	mov    %eax,0x8(%esp)
801056ea:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801056f1:	00 
801056f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801056f9:	e8 7e fd ff ff       	call   8010547c <argfd>
801056fe:	85 c0                	test   %eax,%eax
80105700:	78 1f                	js     80105721 <sys_fstat+0x44>
80105702:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105705:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
8010570c:	00 
8010570d:	89 44 24 04          	mov    %eax,0x4(%esp)
80105711:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105718:	e8 34 fc ff ff       	call   80105351 <argptr>
8010571d:	85 c0                	test   %eax,%eax
8010571f:	79 07                	jns    80105728 <sys_fstat+0x4b>
    return -1;
80105721:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105726:	eb 12                	jmp    8010573a <sys_fstat+0x5d>
  return filestat(f, st);
80105728:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010572b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010572e:	89 54 24 04          	mov    %edx,0x4(%esp)
80105732:	89 04 24             	mov    %eax,(%esp)
80105735:	e8 5d b9 ff ff       	call   80101097 <filestat>
}
8010573a:	c9                   	leave  
8010573b:	c3                   	ret    

8010573c <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
8010573c:	55                   	push   %ebp
8010573d:	89 e5                	mov    %esp,%ebp
8010573f:	83 ec 38             	sub    $0x38,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80105742:	8d 45 d8             	lea    -0x28(%ebp),%eax
80105745:	89 44 24 04          	mov    %eax,0x4(%esp)
80105749:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105750:	e8 5e fc ff ff       	call   801053b3 <argstr>
80105755:	85 c0                	test   %eax,%eax
80105757:	78 17                	js     80105770 <sys_link+0x34>
80105759:	8d 45 dc             	lea    -0x24(%ebp),%eax
8010575c:	89 44 24 04          	mov    %eax,0x4(%esp)
80105760:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105767:	e8 47 fc ff ff       	call   801053b3 <argstr>
8010576c:	85 c0                	test   %eax,%eax
8010576e:	79 0a                	jns    8010577a <sys_link+0x3e>
    return -1;
80105770:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105775:	e9 3c 01 00 00       	jmp    801058b6 <sys_link+0x17a>
  if((ip = namei(old)) == 0)
8010577a:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010577d:	89 04 24             	mov    %eax,(%esp)
80105780:	e8 92 cc ff ff       	call   80102417 <namei>
80105785:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105788:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010578c:	75 0a                	jne    80105798 <sys_link+0x5c>
    return -1;
8010578e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105793:	e9 1e 01 00 00       	jmp    801058b6 <sys_link+0x17a>

  begin_trans();
80105798:	e8 69 da ff ff       	call   80103206 <begin_trans>

  ilock(ip);
8010579d:	8b 45 f4             	mov    -0xc(%ebp),%eax
801057a0:	89 04 24             	mov    %eax,(%esp)
801057a3:	e8 c7 c0 ff ff       	call   8010186f <ilock>
  if(ip->type == T_DIR){
801057a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801057ab:	0f b7 40 10          	movzwl 0x10(%eax),%eax
801057af:	66 83 f8 01          	cmp    $0x1,%ax
801057b3:	75 1a                	jne    801057cf <sys_link+0x93>
    iunlockput(ip);
801057b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801057b8:	89 04 24             	mov    %eax,(%esp)
801057bb:	e8 36 c3 ff ff       	call   80101af6 <iunlockput>
    commit_trans();
801057c0:	e8 8a da ff ff       	call   8010324f <commit_trans>
    return -1;
801057c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057ca:	e9 e7 00 00 00       	jmp    801058b6 <sys_link+0x17a>
  }

  ip->nlink++;
801057cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
801057d2:	0f b7 40 16          	movzwl 0x16(%eax),%eax
801057d6:	8d 50 01             	lea    0x1(%eax),%edx
801057d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801057dc:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
801057e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801057e3:	89 04 24             	mov    %eax,(%esp)
801057e6:	e8 c4 be ff ff       	call   801016af <iupdate>
  iunlock(ip);
801057eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
801057ee:	89 04 24             	mov    %eax,(%esp)
801057f1:	e8 ca c1 ff ff       	call   801019c0 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
801057f6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801057f9:	8d 55 e2             	lea    -0x1e(%ebp),%edx
801057fc:	89 54 24 04          	mov    %edx,0x4(%esp)
80105800:	89 04 24             	mov    %eax,(%esp)
80105803:	e8 31 cc ff ff       	call   80102439 <nameiparent>
80105808:	89 45 f0             	mov    %eax,-0x10(%ebp)
8010580b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010580f:	74 68                	je     80105879 <sys_link+0x13d>
    goto bad;
  ilock(dp);
80105811:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105814:	89 04 24             	mov    %eax,(%esp)
80105817:	e8 53 c0 ff ff       	call   8010186f <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
8010581c:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010581f:	8b 10                	mov    (%eax),%edx
80105821:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105824:	8b 00                	mov    (%eax),%eax
80105826:	39 c2                	cmp    %eax,%edx
80105828:	75 20                	jne    8010584a <sys_link+0x10e>
8010582a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010582d:	8b 40 04             	mov    0x4(%eax),%eax
80105830:	89 44 24 08          	mov    %eax,0x8(%esp)
80105834:	8d 45 e2             	lea    -0x1e(%ebp),%eax
80105837:	89 44 24 04          	mov    %eax,0x4(%esp)
8010583b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010583e:	89 04 24             	mov    %eax,(%esp)
80105841:	e8 10 c9 ff ff       	call   80102156 <dirlink>
80105846:	85 c0                	test   %eax,%eax
80105848:	79 0d                	jns    80105857 <sys_link+0x11b>
    iunlockput(dp);
8010584a:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010584d:	89 04 24             	mov    %eax,(%esp)
80105850:	e8 a1 c2 ff ff       	call   80101af6 <iunlockput>
    goto bad;
80105855:	eb 23                	jmp    8010587a <sys_link+0x13e>
  }
  iunlockput(dp);
80105857:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010585a:	89 04 24             	mov    %eax,(%esp)
8010585d:	e8 94 c2 ff ff       	call   80101af6 <iunlockput>
  iput(ip);
80105862:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105865:	89 04 24             	mov    %eax,(%esp)
80105868:	e8 b8 c1 ff ff       	call   80101a25 <iput>

  commit_trans();
8010586d:	e8 dd d9 ff ff       	call   8010324f <commit_trans>

  return 0;
80105872:	b8 00 00 00 00       	mov    $0x0,%eax
80105877:	eb 3d                	jmp    801058b6 <sys_link+0x17a>
  ip->nlink++;
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
80105879:	90                   	nop
  commit_trans();

  return 0;

bad:
  ilock(ip);
8010587a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010587d:	89 04 24             	mov    %eax,(%esp)
80105880:	e8 ea bf ff ff       	call   8010186f <ilock>
  ip->nlink--;
80105885:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105888:	0f b7 40 16          	movzwl 0x16(%eax),%eax
8010588c:	8d 50 ff             	lea    -0x1(%eax),%edx
8010588f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105892:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
80105896:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105899:	89 04 24             	mov    %eax,(%esp)
8010589c:	e8 0e be ff ff       	call   801016af <iupdate>
  iunlockput(ip);
801058a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801058a4:	89 04 24             	mov    %eax,(%esp)
801058a7:	e8 4a c2 ff ff       	call   80101af6 <iunlockput>
  commit_trans();
801058ac:	e8 9e d9 ff ff       	call   8010324f <commit_trans>
  return -1;
801058b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801058b6:	c9                   	leave  
801058b7:	c3                   	ret    

801058b8 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
801058b8:	55                   	push   %ebp
801058b9:	89 e5                	mov    %esp,%ebp
801058bb:	83 ec 38             	sub    $0x38,%esp
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801058be:	c7 45 f4 20 00 00 00 	movl   $0x20,-0xc(%ebp)
801058c5:	eb 4b                	jmp    80105912 <isdirempty+0x5a>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801058c7:	8b 55 f4             	mov    -0xc(%ebp),%edx
801058ca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801058cd:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
801058d4:	00 
801058d5:	89 54 24 08          	mov    %edx,0x8(%esp)
801058d9:	89 44 24 04          	mov    %eax,0x4(%esp)
801058dd:	8b 45 08             	mov    0x8(%ebp),%eax
801058e0:	89 04 24             	mov    %eax,(%esp)
801058e3:	e8 80 c4 ff ff       	call   80101d68 <readi>
801058e8:	83 f8 10             	cmp    $0x10,%eax
801058eb:	74 0c                	je     801058f9 <isdirempty+0x41>
      panic("isdirempty: readi");
801058ed:	c7 04 24 ab 87 10 80 	movl   $0x801087ab,(%esp)
801058f4:	e8 41 ac ff ff       	call   8010053a <panic>
    if(de.inum != 0)
801058f9:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801058fd:	66 85 c0             	test   %ax,%ax
80105900:	74 07                	je     80105909 <isdirempty+0x51>
      return 0;
80105902:	b8 00 00 00 00       	mov    $0x0,%eax
80105907:	eb 1b                	jmp    80105924 <isdirempty+0x6c>
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105909:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010590c:	83 c0 10             	add    $0x10,%eax
8010590f:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105912:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105915:	8b 45 08             	mov    0x8(%ebp),%eax
80105918:	8b 40 18             	mov    0x18(%eax),%eax
8010591b:	39 c2                	cmp    %eax,%edx
8010591d:	72 a8                	jb     801058c7 <isdirempty+0xf>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
    if(de.inum != 0)
      return 0;
  }
  return 1;
8010591f:	b8 01 00 00 00       	mov    $0x1,%eax
}
80105924:	c9                   	leave  
80105925:	c3                   	ret    

80105926 <sys_unlink>:

//PAGEBREAK!
int
sys_unlink(void)
{
80105926:	55                   	push   %ebp
80105927:	89 e5                	mov    %esp,%ebp
80105929:	83 ec 48             	sub    $0x48,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
8010592c:	8d 45 cc             	lea    -0x34(%ebp),%eax
8010592f:	89 44 24 04          	mov    %eax,0x4(%esp)
80105933:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
8010593a:	e8 74 fa ff ff       	call   801053b3 <argstr>
8010593f:	85 c0                	test   %eax,%eax
80105941:	79 0a                	jns    8010594d <sys_unlink+0x27>
    return -1;
80105943:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105948:	e9 aa 01 00 00       	jmp    80105af7 <sys_unlink+0x1d1>
  if((dp = nameiparent(path, name)) == 0)
8010594d:	8b 45 cc             	mov    -0x34(%ebp),%eax
80105950:	8d 55 d2             	lea    -0x2e(%ebp),%edx
80105953:	89 54 24 04          	mov    %edx,0x4(%esp)
80105957:	89 04 24             	mov    %eax,(%esp)
8010595a:	e8 da ca ff ff       	call   80102439 <nameiparent>
8010595f:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105962:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105966:	75 0a                	jne    80105972 <sys_unlink+0x4c>
    return -1;
80105968:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010596d:	e9 85 01 00 00       	jmp    80105af7 <sys_unlink+0x1d1>

  begin_trans();
80105972:	e8 8f d8 ff ff       	call   80103206 <begin_trans>

  ilock(dp);
80105977:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010597a:	89 04 24             	mov    %eax,(%esp)
8010597d:	e8 ed be ff ff       	call   8010186f <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80105982:	c7 44 24 04 bd 87 10 	movl   $0x801087bd,0x4(%esp)
80105989:	80 
8010598a:	8d 45 d2             	lea    -0x2e(%ebp),%eax
8010598d:	89 04 24             	mov    %eax,(%esp)
80105990:	e8 d7 c6 ff ff       	call   8010206c <namecmp>
80105995:	85 c0                	test   %eax,%eax
80105997:	0f 84 45 01 00 00    	je     80105ae2 <sys_unlink+0x1bc>
8010599d:	c7 44 24 04 bf 87 10 	movl   $0x801087bf,0x4(%esp)
801059a4:	80 
801059a5:	8d 45 d2             	lea    -0x2e(%ebp),%eax
801059a8:	89 04 24             	mov    %eax,(%esp)
801059ab:	e8 bc c6 ff ff       	call   8010206c <namecmp>
801059b0:	85 c0                	test   %eax,%eax
801059b2:	0f 84 2a 01 00 00    	je     80105ae2 <sys_unlink+0x1bc>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
801059b8:	8d 45 c8             	lea    -0x38(%ebp),%eax
801059bb:	89 44 24 08          	mov    %eax,0x8(%esp)
801059bf:	8d 45 d2             	lea    -0x2e(%ebp),%eax
801059c2:	89 44 24 04          	mov    %eax,0x4(%esp)
801059c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801059c9:	89 04 24             	mov    %eax,(%esp)
801059cc:	e8 bd c6 ff ff       	call   8010208e <dirlookup>
801059d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
801059d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
801059d8:	0f 84 03 01 00 00    	je     80105ae1 <sys_unlink+0x1bb>
    goto bad;
  ilock(ip);
801059de:	8b 45 f0             	mov    -0x10(%ebp),%eax
801059e1:	89 04 24             	mov    %eax,(%esp)
801059e4:	e8 86 be ff ff       	call   8010186f <ilock>

  if(ip->nlink < 1)
801059e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
801059ec:	0f b7 40 16          	movzwl 0x16(%eax),%eax
801059f0:	66 85 c0             	test   %ax,%ax
801059f3:	7f 0c                	jg     80105a01 <sys_unlink+0xdb>
    panic("unlink: nlink < 1");
801059f5:	c7 04 24 c2 87 10 80 	movl   $0x801087c2,(%esp)
801059fc:	e8 39 ab ff ff       	call   8010053a <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
80105a01:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105a04:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105a08:	66 83 f8 01          	cmp    $0x1,%ax
80105a0c:	75 1f                	jne    80105a2d <sys_unlink+0x107>
80105a0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105a11:	89 04 24             	mov    %eax,(%esp)
80105a14:	e8 9f fe ff ff       	call   801058b8 <isdirempty>
80105a19:	85 c0                	test   %eax,%eax
80105a1b:	75 10                	jne    80105a2d <sys_unlink+0x107>
    iunlockput(ip);
80105a1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105a20:	89 04 24             	mov    %eax,(%esp)
80105a23:	e8 ce c0 ff ff       	call   80101af6 <iunlockput>
    goto bad;
80105a28:	e9 b5 00 00 00       	jmp    80105ae2 <sys_unlink+0x1bc>
  }

  memset(&de, 0, sizeof(de));
80105a2d:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80105a34:	00 
80105a35:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80105a3c:	00 
80105a3d:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105a40:	89 04 24             	mov    %eax,(%esp)
80105a43:	e8 7e f5 ff ff       	call   80104fc6 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105a48:	8b 55 c8             	mov    -0x38(%ebp),%edx
80105a4b:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105a4e:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80105a55:	00 
80105a56:	89 54 24 08          	mov    %edx,0x8(%esp)
80105a5a:	89 44 24 04          	mov    %eax,0x4(%esp)
80105a5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105a61:	89 04 24             	mov    %eax,(%esp)
80105a64:	e8 6b c4 ff ff       	call   80101ed4 <writei>
80105a69:	83 f8 10             	cmp    $0x10,%eax
80105a6c:	74 0c                	je     80105a7a <sys_unlink+0x154>
    panic("unlink: writei");
80105a6e:	c7 04 24 d4 87 10 80 	movl   $0x801087d4,(%esp)
80105a75:	e8 c0 aa ff ff       	call   8010053a <panic>
  if(ip->type == T_DIR){
80105a7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105a7d:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105a81:	66 83 f8 01          	cmp    $0x1,%ax
80105a85:	75 1c                	jne    80105aa3 <sys_unlink+0x17d>
    dp->nlink--;
80105a87:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105a8a:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105a8e:	8d 50 ff             	lea    -0x1(%eax),%edx
80105a91:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105a94:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
80105a98:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105a9b:	89 04 24             	mov    %eax,(%esp)
80105a9e:	e8 0c bc ff ff       	call   801016af <iupdate>
  }
  iunlockput(dp);
80105aa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105aa6:	89 04 24             	mov    %eax,(%esp)
80105aa9:	e8 48 c0 ff ff       	call   80101af6 <iunlockput>

  ip->nlink--;
80105aae:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ab1:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105ab5:	8d 50 ff             	lea    -0x1(%eax),%edx
80105ab8:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105abb:	66 89 50 16          	mov    %dx,0x16(%eax)
  iupdate(ip);
80105abf:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105ac2:	89 04 24             	mov    %eax,(%esp)
80105ac5:	e8 e5 bb ff ff       	call   801016af <iupdate>
  iunlockput(ip);
80105aca:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105acd:	89 04 24             	mov    %eax,(%esp)
80105ad0:	e8 21 c0 ff ff       	call   80101af6 <iunlockput>

  commit_trans();
80105ad5:	e8 75 d7 ff ff       	call   8010324f <commit_trans>

  return 0;
80105ada:	b8 00 00 00 00       	mov    $0x0,%eax
80105adf:	eb 16                	jmp    80105af7 <sys_unlink+0x1d1>
  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
80105ae1:	90                   	nop
  commit_trans();

  return 0;

bad:
  iunlockput(dp);
80105ae2:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105ae5:	89 04 24             	mov    %eax,(%esp)
80105ae8:	e8 09 c0 ff ff       	call   80101af6 <iunlockput>
  commit_trans();
80105aed:	e8 5d d7 ff ff       	call   8010324f <commit_trans>
  return -1;
80105af2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105af7:	c9                   	leave  
80105af8:	c3                   	ret    

80105af9 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
80105af9:	55                   	push   %ebp
80105afa:	89 e5                	mov    %esp,%ebp
80105afc:	83 ec 48             	sub    $0x48,%esp
80105aff:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80105b02:	8b 55 10             	mov    0x10(%ebp),%edx
80105b05:	8b 45 14             	mov    0x14(%ebp),%eax
80105b08:	66 89 4d d4          	mov    %cx,-0x2c(%ebp)
80105b0c:	66 89 55 d0          	mov    %dx,-0x30(%ebp)
80105b10:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80105b14:	8d 45 de             	lea    -0x22(%ebp),%eax
80105b17:	89 44 24 04          	mov    %eax,0x4(%esp)
80105b1b:	8b 45 08             	mov    0x8(%ebp),%eax
80105b1e:	89 04 24             	mov    %eax,(%esp)
80105b21:	e8 13 c9 ff ff       	call   80102439 <nameiparent>
80105b26:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105b29:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105b2d:	75 0a                	jne    80105b39 <create+0x40>
    return 0;
80105b2f:	b8 00 00 00 00       	mov    $0x0,%eax
80105b34:	e9 7e 01 00 00       	jmp    80105cb7 <create+0x1be>
  ilock(dp);
80105b39:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105b3c:	89 04 24             	mov    %eax,(%esp)
80105b3f:	e8 2b bd ff ff       	call   8010186f <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80105b44:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105b47:	89 44 24 08          	mov    %eax,0x8(%esp)
80105b4b:	8d 45 de             	lea    -0x22(%ebp),%eax
80105b4e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105b52:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105b55:	89 04 24             	mov    %eax,(%esp)
80105b58:	e8 31 c5 ff ff       	call   8010208e <dirlookup>
80105b5d:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105b60:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105b64:	74 47                	je     80105bad <create+0xb4>
    iunlockput(dp);
80105b66:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105b69:	89 04 24             	mov    %eax,(%esp)
80105b6c:	e8 85 bf ff ff       	call   80101af6 <iunlockput>
    ilock(ip);
80105b71:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b74:	89 04 24             	mov    %eax,(%esp)
80105b77:	e8 f3 bc ff ff       	call   8010186f <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80105b7c:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80105b81:	75 15                	jne    80105b98 <create+0x9f>
80105b83:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b86:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105b8a:	66 83 f8 02          	cmp    $0x2,%ax
80105b8e:	75 08                	jne    80105b98 <create+0x9f>
      return ip;
80105b90:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b93:	e9 1f 01 00 00       	jmp    80105cb7 <create+0x1be>
    iunlockput(ip);
80105b98:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105b9b:	89 04 24             	mov    %eax,(%esp)
80105b9e:	e8 53 bf ff ff       	call   80101af6 <iunlockput>
    return 0;
80105ba3:	b8 00 00 00 00       	mov    $0x0,%eax
80105ba8:	e9 0a 01 00 00       	jmp    80105cb7 <create+0x1be>
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80105bad:	0f bf 55 d4          	movswl -0x2c(%ebp),%edx
80105bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105bb4:	8b 00                	mov    (%eax),%eax
80105bb6:	89 54 24 04          	mov    %edx,0x4(%esp)
80105bba:	89 04 24             	mov    %eax,(%esp)
80105bbd:	e8 10 ba ff ff       	call   801015d2 <ialloc>
80105bc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105bc5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105bc9:	75 0c                	jne    80105bd7 <create+0xde>
    panic("create: ialloc");
80105bcb:	c7 04 24 e3 87 10 80 	movl   $0x801087e3,(%esp)
80105bd2:	e8 63 a9 ff ff       	call   8010053a <panic>

  ilock(ip);
80105bd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105bda:	89 04 24             	mov    %eax,(%esp)
80105bdd:	e8 8d bc ff ff       	call   8010186f <ilock>
  ip->major = major;
80105be2:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105be5:	0f b7 55 d0          	movzwl -0x30(%ebp),%edx
80105be9:	66 89 50 12          	mov    %dx,0x12(%eax)
  ip->minor = minor;
80105bed:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105bf0:	0f b7 55 cc          	movzwl -0x34(%ebp),%edx
80105bf4:	66 89 50 14          	mov    %dx,0x14(%eax)
  ip->nlink = 1;
80105bf8:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105bfb:	66 c7 40 16 01 00    	movw   $0x1,0x16(%eax)
  iupdate(ip);
80105c01:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c04:	89 04 24             	mov    %eax,(%esp)
80105c07:	e8 a3 ba ff ff       	call   801016af <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80105c0c:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
80105c11:	75 6a                	jne    80105c7d <create+0x184>
    dp->nlink++;  // for ".."
80105c13:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c16:	0f b7 40 16          	movzwl 0x16(%eax),%eax
80105c1a:	8d 50 01             	lea    0x1(%eax),%edx
80105c1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c20:	66 89 50 16          	mov    %dx,0x16(%eax)
    iupdate(dp);
80105c24:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c27:	89 04 24             	mov    %eax,(%esp)
80105c2a:	e8 80 ba ff ff       	call   801016af <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80105c2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c32:	8b 40 04             	mov    0x4(%eax),%eax
80105c35:	89 44 24 08          	mov    %eax,0x8(%esp)
80105c39:	c7 44 24 04 bd 87 10 	movl   $0x801087bd,0x4(%esp)
80105c40:	80 
80105c41:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c44:	89 04 24             	mov    %eax,(%esp)
80105c47:	e8 0a c5 ff ff       	call   80102156 <dirlink>
80105c4c:	85 c0                	test   %eax,%eax
80105c4e:	78 21                	js     80105c71 <create+0x178>
80105c50:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c53:	8b 40 04             	mov    0x4(%eax),%eax
80105c56:	89 44 24 08          	mov    %eax,0x8(%esp)
80105c5a:	c7 44 24 04 bf 87 10 	movl   $0x801087bf,0x4(%esp)
80105c61:	80 
80105c62:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c65:	89 04 24             	mov    %eax,(%esp)
80105c68:	e8 e9 c4 ff ff       	call   80102156 <dirlink>
80105c6d:	85 c0                	test   %eax,%eax
80105c6f:	79 0c                	jns    80105c7d <create+0x184>
      panic("create dots");
80105c71:	c7 04 24 f2 87 10 80 	movl   $0x801087f2,(%esp)
80105c78:	e8 bd a8 ff ff       	call   8010053a <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
80105c7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105c80:	8b 40 04             	mov    0x4(%eax),%eax
80105c83:	89 44 24 08          	mov    %eax,0x8(%esp)
80105c87:	8d 45 de             	lea    -0x22(%ebp),%eax
80105c8a:	89 44 24 04          	mov    %eax,0x4(%esp)
80105c8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105c91:	89 04 24             	mov    %eax,(%esp)
80105c94:	e8 bd c4 ff ff       	call   80102156 <dirlink>
80105c99:	85 c0                	test   %eax,%eax
80105c9b:	79 0c                	jns    80105ca9 <create+0x1b0>
    panic("create: dirlink");
80105c9d:	c7 04 24 fe 87 10 80 	movl   $0x801087fe,(%esp)
80105ca4:	e8 91 a8 ff ff       	call   8010053a <panic>

  iunlockput(dp);
80105ca9:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105cac:	89 04 24             	mov    %eax,(%esp)
80105caf:	e8 42 be ff ff       	call   80101af6 <iunlockput>

  return ip;
80105cb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80105cb7:	c9                   	leave  
80105cb8:	c3                   	ret    

80105cb9 <sys_open>:

int
sys_open(void)
{
80105cb9:	55                   	push   %ebp
80105cba:	89 e5                	mov    %esp,%ebp
80105cbc:	83 ec 38             	sub    $0x38,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105cbf:	8d 45 e8             	lea    -0x18(%ebp),%eax
80105cc2:	89 44 24 04          	mov    %eax,0x4(%esp)
80105cc6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105ccd:	e8 e1 f6 ff ff       	call   801053b3 <argstr>
80105cd2:	85 c0                	test   %eax,%eax
80105cd4:	78 17                	js     80105ced <sys_open+0x34>
80105cd6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105cd9:	89 44 24 04          	mov    %eax,0x4(%esp)
80105cdd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105ce4:	e8 39 f6 ff ff       	call   80105322 <argint>
80105ce9:	85 c0                	test   %eax,%eax
80105ceb:	79 0a                	jns    80105cf7 <sys_open+0x3e>
    return -1;
80105ced:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105cf2:	e9 46 01 00 00       	jmp    80105e3d <sys_open+0x184>
  if(omode & O_CREATE){
80105cf7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105cfa:	25 00 02 00 00       	and    $0x200,%eax
80105cff:	85 c0                	test   %eax,%eax
80105d01:	74 40                	je     80105d43 <sys_open+0x8a>
    begin_trans();
80105d03:	e8 fe d4 ff ff       	call   80103206 <begin_trans>
    ip = create(path, T_FILE, 0, 0);
80105d08:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105d0b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
80105d12:	00 
80105d13:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80105d1a:	00 
80105d1b:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
80105d22:	00 
80105d23:	89 04 24             	mov    %eax,(%esp)
80105d26:	e8 ce fd ff ff       	call   80105af9 <create>
80105d2b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    commit_trans();
80105d2e:	e8 1c d5 ff ff       	call   8010324f <commit_trans>
    if(ip == 0)
80105d33:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105d37:	75 5c                	jne    80105d95 <sys_open+0xdc>
      return -1;
80105d39:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105d3e:	e9 fa 00 00 00       	jmp    80105e3d <sys_open+0x184>
  } else {
    if((ip = namei(path)) == 0)
80105d43:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105d46:	89 04 24             	mov    %eax,(%esp)
80105d49:	e8 c9 c6 ff ff       	call   80102417 <namei>
80105d4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105d51:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105d55:	75 0a                	jne    80105d61 <sys_open+0xa8>
      return -1;
80105d57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105d5c:	e9 dc 00 00 00       	jmp    80105e3d <sys_open+0x184>
    ilock(ip);
80105d61:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d64:	89 04 24             	mov    %eax,(%esp)
80105d67:	e8 03 bb ff ff       	call   8010186f <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105d6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d6f:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105d73:	66 83 f8 01          	cmp    $0x1,%ax
80105d77:	75 1c                	jne    80105d95 <sys_open+0xdc>
80105d79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105d7c:	85 c0                	test   %eax,%eax
80105d7e:	74 15                	je     80105d95 <sys_open+0xdc>
      iunlockput(ip);
80105d80:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105d83:	89 04 24             	mov    %eax,(%esp)
80105d86:	e8 6b bd ff ff       	call   80101af6 <iunlockput>
      return -1;
80105d8b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105d90:	e9 a8 00 00 00       	jmp    80105e3d <sys_open+0x184>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105d95:	e8 7e b1 ff ff       	call   80100f18 <filealloc>
80105d9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105d9d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105da1:	74 14                	je     80105db7 <sys_open+0xfe>
80105da3:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105da6:	89 04 24             	mov    %eax,(%esp)
80105da9:	e8 43 f7 ff ff       	call   801054f1 <fdalloc>
80105dae:	89 45 ec             	mov    %eax,-0x14(%ebp)
80105db1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
80105db5:	79 23                	jns    80105dda <sys_open+0x121>
    if(f)
80105db7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105dbb:	74 0b                	je     80105dc8 <sys_open+0x10f>
      fileclose(f);
80105dbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105dc0:	89 04 24             	mov    %eax,(%esp)
80105dc3:	e8 f9 b1 ff ff       	call   80100fc1 <fileclose>
    iunlockput(ip);
80105dc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105dcb:	89 04 24             	mov    %eax,(%esp)
80105dce:	e8 23 bd ff ff       	call   80101af6 <iunlockput>
    return -1;
80105dd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105dd8:	eb 63                	jmp    80105e3d <sys_open+0x184>
  }
  iunlock(ip);
80105dda:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105ddd:	89 04 24             	mov    %eax,(%esp)
80105de0:	e8 db bb ff ff       	call   801019c0 <iunlock>

  f->type = FD_INODE;
80105de5:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105de8:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  f->ip = ip;
80105dee:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105df1:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105df4:	89 50 10             	mov    %edx,0x10(%eax)
  f->off = 0;
80105df7:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105dfa:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  f->readable = !(omode & O_WRONLY);
80105e01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105e04:	83 e0 01             	and    $0x1,%eax
80105e07:	85 c0                	test   %eax,%eax
80105e09:	0f 94 c2             	sete   %dl
80105e0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105e0f:	88 50 08             	mov    %dl,0x8(%eax)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105e12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105e15:	83 e0 01             	and    $0x1,%eax
80105e18:	84 c0                	test   %al,%al
80105e1a:	75 0a                	jne    80105e26 <sys_open+0x16d>
80105e1c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105e1f:	83 e0 02             	and    $0x2,%eax
80105e22:	85 c0                	test   %eax,%eax
80105e24:	74 07                	je     80105e2d <sys_open+0x174>
80105e26:	b8 01 00 00 00       	mov    $0x1,%eax
80105e2b:	eb 05                	jmp    80105e32 <sys_open+0x179>
80105e2d:	b8 00 00 00 00       	mov    $0x0,%eax
80105e32:	89 c2                	mov    %eax,%edx
80105e34:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105e37:	88 50 09             	mov    %dl,0x9(%eax)
  return fd;
80105e3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
80105e3d:	c9                   	leave  
80105e3e:	c3                   	ret    

80105e3f <sys_mkdir>:

int
sys_mkdir(void)
{
80105e3f:	55                   	push   %ebp
80105e40:	89 e5                	mov    %esp,%ebp
80105e42:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  begin_trans();
80105e45:	e8 bc d3 ff ff       	call   80103206 <begin_trans>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
80105e4a:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105e4d:	89 44 24 04          	mov    %eax,0x4(%esp)
80105e51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105e58:	e8 56 f5 ff ff       	call   801053b3 <argstr>
80105e5d:	85 c0                	test   %eax,%eax
80105e5f:	78 2c                	js     80105e8d <sys_mkdir+0x4e>
80105e61:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105e64:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
80105e6b:	00 
80105e6c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80105e73:	00 
80105e74:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80105e7b:	00 
80105e7c:	89 04 24             	mov    %eax,(%esp)
80105e7f:	e8 75 fc ff ff       	call   80105af9 <create>
80105e84:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105e87:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105e8b:	75 0c                	jne    80105e99 <sys_mkdir+0x5a>
    commit_trans();
80105e8d:	e8 bd d3 ff ff       	call   8010324f <commit_trans>
    return -1;
80105e92:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105e97:	eb 15                	jmp    80105eae <sys_mkdir+0x6f>
  }
  iunlockput(ip);
80105e99:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105e9c:	89 04 24             	mov    %eax,(%esp)
80105e9f:	e8 52 bc ff ff       	call   80101af6 <iunlockput>
  commit_trans();
80105ea4:	e8 a6 d3 ff ff       	call   8010324f <commit_trans>
  return 0;
80105ea9:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105eae:	c9                   	leave  
80105eaf:	c3                   	ret    

80105eb0 <sys_mknod>:

int
sys_mknod(void)
{
80105eb0:	55                   	push   %ebp
80105eb1:	89 e5                	mov    %esp,%ebp
80105eb3:	83 ec 38             	sub    $0x38,%esp
  struct inode *ip;
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
80105eb6:	e8 4b d3 ff ff       	call   80103206 <begin_trans>
  if((len=argstr(0, &path)) < 0 ||
80105ebb:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105ebe:	89 44 24 04          	mov    %eax,0x4(%esp)
80105ec2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105ec9:	e8 e5 f4 ff ff       	call   801053b3 <argstr>
80105ece:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105ed1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105ed5:	78 5e                	js     80105f35 <sys_mknod+0x85>
     argint(1, &major) < 0 ||
80105ed7:	8d 45 e8             	lea    -0x18(%ebp),%eax
80105eda:	89 44 24 04          	mov    %eax,0x4(%esp)
80105ede:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80105ee5:	e8 38 f4 ff ff       	call   80105322 <argint>
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
80105eea:	85 c0                	test   %eax,%eax
80105eec:	78 47                	js     80105f35 <sys_mknod+0x85>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105eee:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105ef1:	89 44 24 04          	mov    %eax,0x4(%esp)
80105ef5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80105efc:	e8 21 f4 ff ff       	call   80105322 <argint>
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
80105f01:	85 c0                	test   %eax,%eax
80105f03:	78 30                	js     80105f35 <sys_mknod+0x85>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
80105f05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105f08:	0f bf c8             	movswl %ax,%ecx
80105f0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
80105f0e:	0f bf d0             	movswl %ax,%edx
80105f11:	8b 45 ec             	mov    -0x14(%ebp),%eax
80105f14:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
80105f18:	89 54 24 08          	mov    %edx,0x8(%esp)
80105f1c:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
80105f23:	00 
80105f24:	89 04 24             	mov    %eax,(%esp)
80105f27:	e8 cd fb ff ff       	call   80105af9 <create>
  char *path;
  int len;
  int major, minor;
  
  begin_trans();
  if((len=argstr(0, &path)) < 0 ||
80105f2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
80105f2f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80105f33:	75 0c                	jne    80105f41 <sys_mknod+0x91>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    commit_trans();
80105f35:	e8 15 d3 ff ff       	call   8010324f <commit_trans>
    return -1;
80105f3a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105f3f:	eb 15                	jmp    80105f56 <sys_mknod+0xa6>
  }
  iunlockput(ip);
80105f41:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105f44:	89 04 24             	mov    %eax,(%esp)
80105f47:	e8 aa bb ff ff       	call   80101af6 <iunlockput>
  commit_trans();
80105f4c:	e8 fe d2 ff ff       	call   8010324f <commit_trans>
  return 0;
80105f51:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105f56:	c9                   	leave  
80105f57:	c3                   	ret    

80105f58 <sys_chdir>:

int
sys_chdir(void)
{
80105f58:	55                   	push   %ebp
80105f59:	89 e5                	mov    %esp,%ebp
80105f5b:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0)
80105f5e:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105f61:	89 44 24 04          	mov    %eax,0x4(%esp)
80105f65:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105f6c:	e8 42 f4 ff ff       	call   801053b3 <argstr>
80105f71:	85 c0                	test   %eax,%eax
80105f73:	78 14                	js     80105f89 <sys_chdir+0x31>
80105f75:	8b 45 f0             	mov    -0x10(%ebp),%eax
80105f78:	89 04 24             	mov    %eax,(%esp)
80105f7b:	e8 97 c4 ff ff       	call   80102417 <namei>
80105f80:	89 45 f4             	mov    %eax,-0xc(%ebp)
80105f83:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80105f87:	75 07                	jne    80105f90 <sys_chdir+0x38>
    return -1;
80105f89:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105f8e:	eb 57                	jmp    80105fe7 <sys_chdir+0x8f>
  ilock(ip);
80105f90:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105f93:	89 04 24             	mov    %eax,(%esp)
80105f96:	e8 d4 b8 ff ff       	call   8010186f <ilock>
  if(ip->type != T_DIR){
80105f9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105f9e:	0f b7 40 10          	movzwl 0x10(%eax),%eax
80105fa2:	66 83 f8 01          	cmp    $0x1,%ax
80105fa6:	74 12                	je     80105fba <sys_chdir+0x62>
    iunlockput(ip);
80105fa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105fab:	89 04 24             	mov    %eax,(%esp)
80105fae:	e8 43 bb ff ff       	call   80101af6 <iunlockput>
    return -1;
80105fb3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105fb8:	eb 2d                	jmp    80105fe7 <sys_chdir+0x8f>
  }
  iunlock(ip);
80105fba:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105fbd:	89 04 24             	mov    %eax,(%esp)
80105fc0:	e8 fb b9 ff ff       	call   801019c0 <iunlock>
  iput(proc->cwd);
80105fc5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105fcb:	8b 40 68             	mov    0x68(%eax),%eax
80105fce:	89 04 24             	mov    %eax,(%esp)
80105fd1:	e8 4f ba ff ff       	call   80101a25 <iput>
  proc->cwd = ip;
80105fd6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105fdc:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105fdf:	89 50 68             	mov    %edx,0x68(%eax)
  return 0;
80105fe2:	b8 00 00 00 00       	mov    $0x0,%eax
}
80105fe7:	c9                   	leave  
80105fe8:	c3                   	ret    

80105fe9 <sys_exec>:

int
sys_exec(void)
{
80105fe9:	55                   	push   %ebp
80105fea:	89 e5                	mov    %esp,%ebp
80105fec:	81 ec a8 00 00 00    	sub    $0xa8,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105ff2:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105ff5:	89 44 24 04          	mov    %eax,0x4(%esp)
80105ff9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106000:	e8 ae f3 ff ff       	call   801053b3 <argstr>
80106005:	85 c0                	test   %eax,%eax
80106007:	78 1a                	js     80106023 <sys_exec+0x3a>
80106009:	8d 85 6c ff ff ff    	lea    -0x94(%ebp),%eax
8010600f:	89 44 24 04          	mov    %eax,0x4(%esp)
80106013:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010601a:	e8 03 f3 ff ff       	call   80105322 <argint>
8010601f:	85 c0                	test   %eax,%eax
80106021:	79 0a                	jns    8010602d <sys_exec+0x44>
    return -1;
80106023:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106028:	e9 cd 00 00 00       	jmp    801060fa <sys_exec+0x111>
  }
  memset(argv, 0, sizeof(argv));
8010602d:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80106034:	00 
80106035:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010603c:	00 
8010603d:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
80106043:	89 04 24             	mov    %eax,(%esp)
80106046:	e8 7b ef ff ff       	call   80104fc6 <memset>
  for(i=0;; i++){
8010604b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(i >= NELEM(argv))
80106052:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106055:	83 f8 1f             	cmp    $0x1f,%eax
80106058:	76 0a                	jbe    80106064 <sys_exec+0x7b>
      return -1;
8010605a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010605f:	e9 96 00 00 00       	jmp    801060fa <sys_exec+0x111>
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80106064:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010606a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010606d:	c1 e2 02             	shl    $0x2,%edx
80106070:	89 d1                	mov    %edx,%ecx
80106072:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
80106078:	8d 14 11             	lea    (%ecx,%edx,1),%edx
8010607b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010607f:	89 14 24             	mov    %edx,(%esp)
80106082:	e8 fd f1 ff ff       	call   80105284 <fetchint>
80106087:	85 c0                	test   %eax,%eax
80106089:	79 07                	jns    80106092 <sys_exec+0xa9>
      return -1;
8010608b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106090:	eb 68                	jmp    801060fa <sys_exec+0x111>
    if(uarg == 0){
80106092:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
80106098:	85 c0                	test   %eax,%eax
8010609a:	75 26                	jne    801060c2 <sys_exec+0xd9>
      argv[i] = 0;
8010609c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010609f:	c7 84 85 70 ff ff ff 	movl   $0x0,-0x90(%ebp,%eax,4)
801060a6:	00 00 00 00 
      break;
801060aa:	90                   	nop
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801060ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
801060ae:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
801060b4:	89 54 24 04          	mov    %edx,0x4(%esp)
801060b8:	89 04 24             	mov    %eax,(%esp)
801060bb:	e8 38 aa ff ff       	call   80100af8 <exec>
801060c0:	eb 38                	jmp    801060fa <sys_exec+0x111>
      return -1;
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801060c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
801060c5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
801060cc:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
801060d2:	01 d0                	add    %edx,%eax
801060d4:	8b 95 68 ff ff ff    	mov    -0x98(%ebp),%edx
801060da:	89 44 24 04          	mov    %eax,0x4(%esp)
801060de:	89 14 24             	mov    %edx,(%esp)
801060e1:	e8 d8 f1 ff ff       	call   801052be <fetchstr>
801060e6:	85 c0                	test   %eax,%eax
801060e8:	79 07                	jns    801060f1 <sys_exec+0x108>
      return -1;
801060ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801060ef:	eb 09                	jmp    801060fa <sys_exec+0x111>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801060f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
801060f5:	e9 58 ff ff ff       	jmp    80106052 <sys_exec+0x69>
  return exec(path, argv);
}
801060fa:	c9                   	leave  
801060fb:	c3                   	ret    

801060fc <sys_pipe>:

int
sys_pipe(void)
{
801060fc:	55                   	push   %ebp
801060fd:	89 e5                	mov    %esp,%ebp
801060ff:	83 ec 38             	sub    $0x38,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80106102:	8d 45 ec             	lea    -0x14(%ebp),%eax
80106105:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
8010610c:	00 
8010610d:	89 44 24 04          	mov    %eax,0x4(%esp)
80106111:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106118:	e8 34 f2 ff ff       	call   80105351 <argptr>
8010611d:	85 c0                	test   %eax,%eax
8010611f:	79 0a                	jns    8010612b <sys_pipe+0x2f>
    return -1;
80106121:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106126:	e9 9b 00 00 00       	jmp    801061c6 <sys_pipe+0xca>
  if(pipealloc(&rf, &wf) < 0)
8010612b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010612e:	89 44 24 04          	mov    %eax,0x4(%esp)
80106132:	8d 45 e8             	lea    -0x18(%ebp),%eax
80106135:	89 04 24             	mov    %eax,(%esp)
80106138:	e8 bb da ff ff       	call   80103bf8 <pipealloc>
8010613d:	85 c0                	test   %eax,%eax
8010613f:	79 07                	jns    80106148 <sys_pipe+0x4c>
    return -1;
80106141:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106146:	eb 7e                	jmp    801061c6 <sys_pipe+0xca>
  fd0 = -1;
80106148:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
8010614f:	8b 45 e8             	mov    -0x18(%ebp),%eax
80106152:	89 04 24             	mov    %eax,(%esp)
80106155:	e8 97 f3 ff ff       	call   801054f1 <fdalloc>
8010615a:	89 45 f0             	mov    %eax,-0x10(%ebp)
8010615d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80106161:	78 14                	js     80106177 <sys_pipe+0x7b>
80106163:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106166:	89 04 24             	mov    %eax,(%esp)
80106169:	e8 83 f3 ff ff       	call   801054f1 <fdalloc>
8010616e:	89 45 f4             	mov    %eax,-0xc(%ebp)
80106171:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80106175:	79 37                	jns    801061ae <sys_pipe+0xb2>
    if(fd0 >= 0)
80106177:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010617b:	78 14                	js     80106191 <sys_pipe+0x95>
      proc->ofile[fd0] = 0;
8010617d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106183:	8b 55 f0             	mov    -0x10(%ebp),%edx
80106186:	83 c2 08             	add    $0x8,%edx
80106189:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
80106190:	00 
    fileclose(rf);
80106191:	8b 45 e8             	mov    -0x18(%ebp),%eax
80106194:	89 04 24             	mov    %eax,(%esp)
80106197:	e8 25 ae ff ff       	call   80100fc1 <fileclose>
    fileclose(wf);
8010619c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010619f:	89 04 24             	mov    %eax,(%esp)
801061a2:	e8 1a ae ff ff       	call   80100fc1 <fileclose>
    return -1;
801061a7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801061ac:	eb 18                	jmp    801061c6 <sys_pipe+0xca>
  }
  fd[0] = fd0;
801061ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
801061b1:	8b 55 f0             	mov    -0x10(%ebp),%edx
801061b4:	89 10                	mov    %edx,(%eax)
  fd[1] = fd1;
801061b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
801061b9:	8d 50 04             	lea    0x4(%eax),%edx
801061bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801061bf:	89 02                	mov    %eax,(%edx)
  return 0;
801061c1:	b8 00 00 00 00       	mov    $0x0,%eax
}
801061c6:	c9                   	leave  
801061c7:	c3                   	ret    

801061c8 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
801061c8:	55                   	push   %ebp
801061c9:	89 e5                	mov    %esp,%ebp
801061cb:	83 ec 08             	sub    $0x8,%esp
  return fork();
801061ce:	e8 d7 e0 ff ff       	call   801042aa <fork>
}
801061d3:	c9                   	leave  
801061d4:	c3                   	ret    

801061d5 <sys_exit>:

int
sys_exit(void)
{
801061d5:	55                   	push   %ebp
801061d6:	89 e5                	mov    %esp,%ebp
801061d8:	83 ec 08             	sub    $0x8,%esp
  exit();
801061db:	e8 37 e2 ff ff       	call   80104417 <exit>
  return 0;  // not reached
801061e0:	b8 00 00 00 00       	mov    $0x0,%eax
}
801061e5:	c9                   	leave  
801061e6:	c3                   	ret    

801061e7 <sys_exit1>:

int
sys_exit1(void) 
{
801061e7:	55                   	push   %ebp
801061e8:	89 e5                	mov    %esp,%ebp
801061ea:	83 ec 28             	sub    $0x28,%esp
  int status; 
  if(argint(0, &status) < 0 ) 
801061ed:	8d 45 f4             	lea    -0xc(%ebp),%eax
801061f0:	89 44 24 04          	mov    %eax,0x4(%esp)
801061f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801061fb:	e8 22 f1 ff ff       	call   80105322 <argint>
80106200:	85 c0                	test   %eax,%eax
80106202:	79 07                	jns    8010620b <sys_exit1+0x24>
	return -1; 
80106204:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106209:	eb 10                	jmp    8010621b <sys_exit1+0x34>

  exit1(status); 
8010620b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010620e:	89 04 24             	mov    %eax,(%esp)
80106211:	e8 1d e3 ff ff       	call   80104533 <exit1>
  return 0; 
80106216:	b8 00 00 00 00       	mov    $0x0,%eax
} //added
8010621b:	c9                   	leave  
8010621c:	c3                   	ret    

8010621d <sys_wait>:

int
sys_wait(void)
{
8010621d:	55                   	push   %ebp
8010621e:	89 e5                	mov    %esp,%ebp
80106220:	83 ec 08             	sub    $0x8,%esp
  return wait();
80106223:	e8 36 e4 ff ff       	call   8010465e <wait>
}
80106228:	c9                   	leave  
80106229:	c3                   	ret    

8010622a <sys_wait1>:

int
sys_wait1(void) 
{
8010622a:	55                   	push   %ebp
8010622b:	89 e5                	mov    %esp,%ebp
8010622d:	83 ec 28             	sub    $0x28,%esp
 char *tmp; 
 int *status; 
 if(argptr(0, &tmp, 4)) 
80106230:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80106237:	00 
80106238:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010623b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010623f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106246:	e8 06 f1 ff ff       	call   80105351 <argptr>
8010624b:	85 c0                	test   %eax,%eax
8010624d:	74 06                	je     80106255 <sys_wait1+0x2b>
 {
	status = (int*)tmp; 
8010624f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80106252:	89 45 f4             	mov    %eax,-0xc(%ebp)
 } 
 return wait1(status); 
80106255:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106258:	89 04 24             	mov    %eax,(%esp)
8010625b:	e8 11 e5 ff ff       	call   80104771 <wait1>
} //added 
80106260:	c9                   	leave  
80106261:	c3                   	ret    

80106262 <sys_setPriority>:

int
sys_setPriority(void) 
{
80106262:	55                   	push   %ebp
80106263:	89 e5                	mov    %esp,%ebp
80106265:	83 ec 28             	sub    $0x28,%esp
 int priority; 
 if(argint(0, &priority ) < 0)
80106268:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010626b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010626f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106276:	e8 a7 f0 ff ff       	call   80105322 <argint>
8010627b:	85 c0                	test   %eax,%eax
8010627d:	79 07                	jns    80106286 <sys_setPriority+0x24>
	return -1; 
8010627f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106284:	eb 10                	jmp    80106296 <sys_setPriority+0x34>
 
 setPriority(priority); 
80106286:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106289:	89 04 24             	mov    %eax,(%esp)
8010628c:	e8 f3 e5 ff ff       	call   80104884 <setPriority>
 return 0; 	
80106291:	b8 00 00 00 00       	mov    $0x0,%eax
} //added
80106296:	c9                   	leave  
80106297:	c3                   	ret    

80106298 <sys_kill>:

int
sys_kill(void)
{
80106298:	55                   	push   %ebp
80106299:	89 e5                	mov    %esp,%ebp
8010629b:	83 ec 28             	sub    $0x28,%esp
  int pid;

  if(argint(0, &pid) < 0)
8010629e:	8d 45 f4             	lea    -0xc(%ebp),%eax
801062a1:	89 44 24 04          	mov    %eax,0x4(%esp)
801062a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801062ac:	e8 71 f0 ff ff       	call   80105322 <argint>
801062b1:	85 c0                	test   %eax,%eax
801062b3:	79 07                	jns    801062bc <sys_kill+0x24>
    return -1;
801062b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801062ba:	eb 0b                	jmp    801062c7 <sys_kill+0x2f>
  return kill(pid);
801062bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801062bf:	89 04 24             	mov    %eax,(%esp)
801062c2:	e8 e0 e8 ff ff       	call   80104ba7 <kill>
}
801062c7:	c9                   	leave  
801062c8:	c3                   	ret    

801062c9 <sys_getpid>:

int
sys_getpid(void)
{
801062c9:	55                   	push   %ebp
801062ca:	89 e5                	mov    %esp,%ebp
  return proc->pid;
801062cc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801062d2:	8b 40 10             	mov    0x10(%eax),%eax
}
801062d5:	5d                   	pop    %ebp
801062d6:	c3                   	ret    

801062d7 <sys_sbrk>:

int
sys_sbrk(void)
{
801062d7:	55                   	push   %ebp
801062d8:	89 e5                	mov    %esp,%ebp
801062da:	83 ec 28             	sub    $0x28,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
801062dd:	8d 45 f0             	lea    -0x10(%ebp),%eax
801062e0:	89 44 24 04          	mov    %eax,0x4(%esp)
801062e4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801062eb:	e8 32 f0 ff ff       	call   80105322 <argint>
801062f0:	85 c0                	test   %eax,%eax
801062f2:	79 07                	jns    801062fb <sys_sbrk+0x24>
    return -1;
801062f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801062f9:	eb 24                	jmp    8010631f <sys_sbrk+0x48>
  addr = proc->sz;
801062fb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106301:	8b 00                	mov    (%eax),%eax
80106303:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(growproc(n) < 0)
80106306:	8b 45 f0             	mov    -0x10(%ebp),%eax
80106309:	89 04 24             	mov    %eax,(%esp)
8010630c:	e8 f4 de ff ff       	call   80104205 <growproc>
80106311:	85 c0                	test   %eax,%eax
80106313:	79 07                	jns    8010631c <sys_sbrk+0x45>
    return -1;
80106315:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010631a:	eb 03                	jmp    8010631f <sys_sbrk+0x48>
  return addr;
8010631c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
8010631f:	c9                   	leave  
80106320:	c3                   	ret    

80106321 <sys_sleep>:

int
sys_sleep(void)
{
80106321:	55                   	push   %ebp
80106322:	89 e5                	mov    %esp,%ebp
80106324:	83 ec 28             	sub    $0x28,%esp
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
80106327:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010632a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010632e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106335:	e8 e8 ef ff ff       	call   80105322 <argint>
8010633a:	85 c0                	test   %eax,%eax
8010633c:	79 07                	jns    80106345 <sys_sleep+0x24>
    return -1;
8010633e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106343:	eb 6c                	jmp    801063b1 <sys_sleep+0x90>
  acquire(&tickslock);
80106345:	c7 04 24 80 20 11 80 	movl   $0x80112080,(%esp)
8010634c:	e8 26 ea ff ff       	call   80104d77 <acquire>
  ticks0 = ticks;
80106351:	a1 c0 28 11 80       	mov    0x801128c0,%eax
80106356:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(ticks - ticks0 < n){
80106359:	eb 34                	jmp    8010638f <sys_sleep+0x6e>
    if(proc->killed){
8010635b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106361:	8b 40 24             	mov    0x24(%eax),%eax
80106364:	85 c0                	test   %eax,%eax
80106366:	74 13                	je     8010637b <sys_sleep+0x5a>
      release(&tickslock);
80106368:	c7 04 24 80 20 11 80 	movl   $0x80112080,(%esp)
8010636f:	e8 64 ea ff ff       	call   80104dd8 <release>
      return -1;
80106374:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106379:	eb 36                	jmp    801063b1 <sys_sleep+0x90>
    }
    sleep(&ticks, &tickslock);
8010637b:	c7 44 24 04 80 20 11 	movl   $0x80112080,0x4(%esp)
80106382:	80 
80106383:	c7 04 24 c0 28 11 80 	movl   $0x801128c0,(%esp)
8010638a:	e8 10 e7 ff ff       	call   80104a9f <sleep>
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010638f:	a1 c0 28 11 80       	mov    0x801128c0,%eax
80106394:	89 c2                	mov    %eax,%edx
80106396:	2b 55 f4             	sub    -0xc(%ebp),%edx
80106399:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010639c:	39 c2                	cmp    %eax,%edx
8010639e:	72 bb                	jb     8010635b <sys_sleep+0x3a>
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
801063a0:	c7 04 24 80 20 11 80 	movl   $0x80112080,(%esp)
801063a7:	e8 2c ea ff ff       	call   80104dd8 <release>
  return 0;
801063ac:	b8 00 00 00 00       	mov    $0x0,%eax
}
801063b1:	c9                   	leave  
801063b2:	c3                   	ret    

801063b3 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801063b3:	55                   	push   %ebp
801063b4:	89 e5                	mov    %esp,%ebp
801063b6:	83 ec 28             	sub    $0x28,%esp
  uint xticks;
  
  acquire(&tickslock);
801063b9:	c7 04 24 80 20 11 80 	movl   $0x80112080,(%esp)
801063c0:	e8 b2 e9 ff ff       	call   80104d77 <acquire>
  xticks = ticks;
801063c5:	a1 c0 28 11 80       	mov    0x801128c0,%eax
801063ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  release(&tickslock);
801063cd:	c7 04 24 80 20 11 80 	movl   $0x80112080,(%esp)
801063d4:	e8 ff e9 ff ff       	call   80104dd8 <release>
  return xticks;
801063d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
801063dc:	c9                   	leave  
801063dd:	c3                   	ret    
	...

801063e0 <outb>:
801063e0:	55                   	push   %ebp
801063e1:	89 e5                	mov    %esp,%ebp
801063e3:	83 ec 08             	sub    $0x8,%esp
801063e6:	8b 55 08             	mov    0x8(%ebp),%edx
801063e9:	8b 45 0c             	mov    0xc(%ebp),%eax
801063ec:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
801063f0:	88 45 f8             	mov    %al,-0x8(%ebp)
801063f3:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
801063f7:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
801063fb:	ee                   	out    %al,(%dx)
801063fc:	c9                   	leave  
801063fd:	c3                   	ret    

801063fe <timerinit>:
801063fe:	55                   	push   %ebp
801063ff:	89 e5                	mov    %esp,%ebp
80106401:	83 ec 18             	sub    $0x18,%esp
80106404:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
8010640b:	00 
8010640c:	c7 04 24 43 00 00 00 	movl   $0x43,(%esp)
80106413:	e8 c8 ff ff ff       	call   801063e0 <outb>
80106418:	c7 44 24 04 9c 00 00 	movl   $0x9c,0x4(%esp)
8010641f:	00 
80106420:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
80106427:	e8 b4 ff ff ff       	call   801063e0 <outb>
8010642c:	c7 44 24 04 2e 00 00 	movl   $0x2e,0x4(%esp)
80106433:	00 
80106434:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
8010643b:	e8 a0 ff ff ff       	call   801063e0 <outb>
80106440:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80106447:	e8 35 d6 ff ff       	call   80103a81 <picenable>
8010644c:	c9                   	leave  
8010644d:	c3                   	ret    
	...

80106450 <alltraps>:
80106450:	1e                   	push   %ds
80106451:	06                   	push   %es
80106452:	0f a0                	push   %fs
80106454:	0f a8                	push   %gs
80106456:	60                   	pusha  
80106457:	66 b8 10 00          	mov    $0x10,%ax
8010645b:	8e d8                	mov    %eax,%ds
8010645d:	8e c0                	mov    %eax,%es
8010645f:	66 b8 18 00          	mov    $0x18,%ax
80106463:	8e e0                	mov    %eax,%fs
80106465:	8e e8                	mov    %eax,%gs
80106467:	54                   	push   %esp
80106468:	e8 d5 01 00 00       	call   80106642 <trap>
8010646d:	83 c4 04             	add    $0x4,%esp

80106470 <trapret>:
80106470:	61                   	popa   
80106471:	0f a9                	pop    %gs
80106473:	0f a1                	pop    %fs
80106475:	07                   	pop    %es
80106476:	1f                   	pop    %ds
80106477:	83 c4 08             	add    $0x8,%esp
8010647a:	cf                   	iret   
	...

8010647c <lidt>:

struct gatedesc;

static inline void
lidt(struct gatedesc *p, int size)
{
8010647c:	55                   	push   %ebp
8010647d:	89 e5                	mov    %esp,%ebp
8010647f:	83 ec 10             	sub    $0x10,%esp
  volatile ushort pd[3];

  pd[0] = size-1;
80106482:	8b 45 0c             	mov    0xc(%ebp),%eax
80106485:	83 e8 01             	sub    $0x1,%eax
80106488:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010648c:	8b 45 08             	mov    0x8(%ebp),%eax
8010648f:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80106493:	8b 45 08             	mov    0x8(%ebp),%eax
80106496:	c1 e8 10             	shr    $0x10,%eax
80106499:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010649d:	8d 45 fa             	lea    -0x6(%ebp),%eax
801064a0:	0f 01 18             	lidtl  (%eax)
}
801064a3:	c9                   	leave  
801064a4:	c3                   	ret    

801064a5 <rcr2>:
  return result;
}

static inline uint
rcr2(void)
{
801064a5:	55                   	push   %ebp
801064a6:	89 e5                	mov    %esp,%ebp
801064a8:	83 ec 10             	sub    $0x10,%esp
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
801064ab:	0f 20 d0             	mov    %cr2,%eax
801064ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
  return val;
801064b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
801064b4:	c9                   	leave  
801064b5:	c3                   	ret    

801064b6 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
801064b6:	55                   	push   %ebp
801064b7:	89 e5                	mov    %esp,%ebp
801064b9:	83 ec 28             	sub    $0x28,%esp
  int i;

  for(i = 0; i < 256; i++)
801064bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
801064c3:	e9 bf 00 00 00       	jmp    80106587 <tvinit+0xd1>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801064c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
801064cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
801064ce:	8b 14 95 a4 b0 10 80 	mov    -0x7fef4f5c(,%edx,4),%edx
801064d5:	66 89 14 c5 c0 20 11 	mov    %dx,-0x7feedf40(,%eax,8)
801064dc:	80 
801064dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
801064e0:	66 c7 04 c5 c2 20 11 	movw   $0x8,-0x7feedf3e(,%eax,8)
801064e7:	80 08 00 
801064ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
801064ed:	0f b6 14 c5 c4 20 11 	movzbl -0x7feedf3c(,%eax,8),%edx
801064f4:	80 
801064f5:	83 e2 e0             	and    $0xffffffe0,%edx
801064f8:	88 14 c5 c4 20 11 80 	mov    %dl,-0x7feedf3c(,%eax,8)
801064ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106502:	0f b6 14 c5 c4 20 11 	movzbl -0x7feedf3c(,%eax,8),%edx
80106509:	80 
8010650a:	83 e2 1f             	and    $0x1f,%edx
8010650d:	88 14 c5 c4 20 11 80 	mov    %dl,-0x7feedf3c(,%eax,8)
80106514:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106517:	0f b6 14 c5 c5 20 11 	movzbl -0x7feedf3b(,%eax,8),%edx
8010651e:	80 
8010651f:	83 e2 f0             	and    $0xfffffff0,%edx
80106522:	83 ca 0e             	or     $0xe,%edx
80106525:	88 14 c5 c5 20 11 80 	mov    %dl,-0x7feedf3b(,%eax,8)
8010652c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010652f:	0f b6 14 c5 c5 20 11 	movzbl -0x7feedf3b(,%eax,8),%edx
80106536:	80 
80106537:	83 e2 ef             	and    $0xffffffef,%edx
8010653a:	88 14 c5 c5 20 11 80 	mov    %dl,-0x7feedf3b(,%eax,8)
80106541:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106544:	0f b6 14 c5 c5 20 11 	movzbl -0x7feedf3b(,%eax,8),%edx
8010654b:	80 
8010654c:	83 e2 9f             	and    $0xffffff9f,%edx
8010654f:	88 14 c5 c5 20 11 80 	mov    %dl,-0x7feedf3b(,%eax,8)
80106556:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106559:	0f b6 14 c5 c5 20 11 	movzbl -0x7feedf3b(,%eax,8),%edx
80106560:	80 
80106561:	83 ca 80             	or     $0xffffff80,%edx
80106564:	88 14 c5 c5 20 11 80 	mov    %dl,-0x7feedf3b(,%eax,8)
8010656b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010656e:	8b 55 f4             	mov    -0xc(%ebp),%edx
80106571:	8b 14 95 a4 b0 10 80 	mov    -0x7fef4f5c(,%edx,4),%edx
80106578:	c1 ea 10             	shr    $0x10,%edx
8010657b:	66 89 14 c5 c6 20 11 	mov    %dx,-0x7feedf3a(,%eax,8)
80106582:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80106583:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80106587:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
8010658e:	0f 8e 34 ff ff ff    	jle    801064c8 <tvinit+0x12>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80106594:	a1 a4 b1 10 80       	mov    0x8010b1a4,%eax
80106599:	66 a3 c0 22 11 80    	mov    %ax,0x801122c0
8010659f:	66 c7 05 c2 22 11 80 	movw   $0x8,0x801122c2
801065a6:	08 00 
801065a8:	0f b6 05 c4 22 11 80 	movzbl 0x801122c4,%eax
801065af:	83 e0 e0             	and    $0xffffffe0,%eax
801065b2:	a2 c4 22 11 80       	mov    %al,0x801122c4
801065b7:	0f b6 05 c4 22 11 80 	movzbl 0x801122c4,%eax
801065be:	83 e0 1f             	and    $0x1f,%eax
801065c1:	a2 c4 22 11 80       	mov    %al,0x801122c4
801065c6:	0f b6 05 c5 22 11 80 	movzbl 0x801122c5,%eax
801065cd:	83 c8 0f             	or     $0xf,%eax
801065d0:	a2 c5 22 11 80       	mov    %al,0x801122c5
801065d5:	0f b6 05 c5 22 11 80 	movzbl 0x801122c5,%eax
801065dc:	83 e0 ef             	and    $0xffffffef,%eax
801065df:	a2 c5 22 11 80       	mov    %al,0x801122c5
801065e4:	0f b6 05 c5 22 11 80 	movzbl 0x801122c5,%eax
801065eb:	83 c8 60             	or     $0x60,%eax
801065ee:	a2 c5 22 11 80       	mov    %al,0x801122c5
801065f3:	0f b6 05 c5 22 11 80 	movzbl 0x801122c5,%eax
801065fa:	83 c8 80             	or     $0xffffff80,%eax
801065fd:	a2 c5 22 11 80       	mov    %al,0x801122c5
80106602:	a1 a4 b1 10 80       	mov    0x8010b1a4,%eax
80106607:	c1 e8 10             	shr    $0x10,%eax
8010660a:	66 a3 c6 22 11 80    	mov    %ax,0x801122c6
  
  initlock(&tickslock, "time");
80106610:	c7 44 24 04 10 88 10 	movl   $0x80108810,0x4(%esp)
80106617:	80 
80106618:	c7 04 24 80 20 11 80 	movl   $0x80112080,(%esp)
8010661f:	e8 32 e7 ff ff       	call   80104d56 <initlock>
}
80106624:	c9                   	leave  
80106625:	c3                   	ret    

80106626 <idtinit>:

void
idtinit(void)
{
80106626:	55                   	push   %ebp
80106627:	89 e5                	mov    %esp,%ebp
80106629:	83 ec 08             	sub    $0x8,%esp
  lidt(idt, sizeof(idt));
8010662c:	c7 44 24 04 00 08 00 	movl   $0x800,0x4(%esp)
80106633:	00 
80106634:	c7 04 24 c0 20 11 80 	movl   $0x801120c0,(%esp)
8010663b:	e8 3c fe ff ff       	call   8010647c <lidt>
}
80106640:	c9                   	leave  
80106641:	c3                   	ret    

80106642 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80106642:	55                   	push   %ebp
80106643:	89 e5                	mov    %esp,%ebp
80106645:	57                   	push   %edi
80106646:	56                   	push   %esi
80106647:	53                   	push   %ebx
80106648:	83 ec 3c             	sub    $0x3c,%esp
  if(tf->trapno == T_SYSCALL){
8010664b:	8b 45 08             	mov    0x8(%ebp),%eax
8010664e:	8b 40 30             	mov    0x30(%eax),%eax
80106651:	83 f8 40             	cmp    $0x40,%eax
80106654:	75 3e                	jne    80106694 <trap+0x52>
    if(proc->killed)
80106656:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010665c:	8b 40 24             	mov    0x24(%eax),%eax
8010665f:	85 c0                	test   %eax,%eax
80106661:	74 05                	je     80106668 <trap+0x26>
      exit();
80106663:	e8 af dd ff ff       	call   80104417 <exit>
    proc->tf = tf;
80106668:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010666e:	8b 55 08             	mov    0x8(%ebp),%edx
80106671:	89 50 18             	mov    %edx,0x18(%eax)
    syscall();
80106674:	e8 71 ed ff ff       	call   801053ea <syscall>
    if(proc->killed)
80106679:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010667f:	8b 40 24             	mov    0x24(%eax),%eax
80106682:	85 c0                	test   %eax,%eax
80106684:	0f 84 34 02 00 00    	je     801068be <trap+0x27c>
      exit();
8010668a:	e8 88 dd ff ff       	call   80104417 <exit>
    return;
8010668f:	e9 2b 02 00 00       	jmp    801068bf <trap+0x27d>
  }

  switch(tf->trapno){
80106694:	8b 45 08             	mov    0x8(%ebp),%eax
80106697:	8b 40 30             	mov    0x30(%eax),%eax
8010669a:	83 e8 20             	sub    $0x20,%eax
8010669d:	83 f8 1f             	cmp    $0x1f,%eax
801066a0:	0f 87 bc 00 00 00    	ja     80106762 <trap+0x120>
801066a6:	8b 04 85 b8 88 10 80 	mov    -0x7fef7748(,%eax,4),%eax
801066ad:	ff e0                	jmp    *%eax
  case T_IRQ0 + IRQ_TIMER:
    if(cpu->id == 0){
801066af:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801066b5:	0f b6 00             	movzbl (%eax),%eax
801066b8:	84 c0                	test   %al,%al
801066ba:	75 31                	jne    801066ed <trap+0xab>
      acquire(&tickslock);
801066bc:	c7 04 24 80 20 11 80 	movl   $0x80112080,(%esp)
801066c3:	e8 af e6 ff ff       	call   80104d77 <acquire>
      ticks++;
801066c8:	a1 c0 28 11 80       	mov    0x801128c0,%eax
801066cd:	83 c0 01             	add    $0x1,%eax
801066d0:	a3 c0 28 11 80       	mov    %eax,0x801128c0
      wakeup(&ticks);
801066d5:	c7 04 24 c0 28 11 80 	movl   $0x801128c0,(%esp)
801066dc:	e8 9b e4 ff ff       	call   80104b7c <wakeup>
      release(&tickslock);
801066e1:	c7 04 24 80 20 11 80 	movl   $0x80112080,(%esp)
801066e8:	e8 eb e6 ff ff       	call   80104dd8 <release>
    }
    lapiceoi();
801066ed:	e8 e2 c7 ff ff       	call   80102ed4 <lapiceoi>
    break;
801066f2:	e9 41 01 00 00       	jmp    80106838 <trap+0x1f6>
  case T_IRQ0 + IRQ_IDE:
    ideintr();
801066f7:	e8 f3 bf ff ff       	call   801026ef <ideintr>
    lapiceoi();
801066fc:	e8 d3 c7 ff ff       	call   80102ed4 <lapiceoi>
    break;
80106701:	e9 32 01 00 00       	jmp    80106838 <trap+0x1f6>
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80106706:	e8 ac c5 ff ff       	call   80102cb7 <kbdintr>
    lapiceoi();
8010670b:	e8 c4 c7 ff ff       	call   80102ed4 <lapiceoi>
    break;
80106710:	e9 23 01 00 00       	jmp    80106838 <trap+0x1f6>
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80106715:	e8 9d 03 00 00       	call   80106ab7 <uartintr>
    lapiceoi();
8010671a:	e8 b5 c7 ff ff       	call   80102ed4 <lapiceoi>
    break;
8010671f:	e9 14 01 00 00       	jmp    80106838 <trap+0x1f6>
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80106724:	8b 45 08             	mov    0x8(%ebp),%eax
80106727:	8b 48 38             	mov    0x38(%eax),%ecx
            cpu->id, tf->cs, tf->eip);
8010672a:	8b 45 08             	mov    0x8(%ebp),%eax
8010672d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80106731:	0f b7 d0             	movzwl %ax,%edx
            cpu->id, tf->cs, tf->eip);
80106734:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010673a:	0f b6 00             	movzbl (%eax),%eax
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
8010673d:	0f b6 c0             	movzbl %al,%eax
80106740:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
80106744:	89 54 24 08          	mov    %edx,0x8(%esp)
80106748:	89 44 24 04          	mov    %eax,0x4(%esp)
8010674c:	c7 04 24 18 88 10 80 	movl   $0x80108818,(%esp)
80106753:	e8 42 9c ff ff       	call   8010039a <cprintf>
            cpu->id, tf->cs, tf->eip);
    lapiceoi();
80106758:	e8 77 c7 ff ff       	call   80102ed4 <lapiceoi>
    break;
8010675d:	e9 d6 00 00 00       	jmp    80106838 <trap+0x1f6>
   
  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80106762:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106768:	85 c0                	test   %eax,%eax
8010676a:	74 11                	je     8010677d <trap+0x13b>
8010676c:	8b 45 08             	mov    0x8(%ebp),%eax
8010676f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
80106773:	0f b7 c0             	movzwl %ax,%eax
80106776:	83 e0 03             	and    $0x3,%eax
80106779:	85 c0                	test   %eax,%eax
8010677b:	75 46                	jne    801067c3 <trap+0x181>
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
8010677d:	e8 23 fd ff ff       	call   801064a5 <rcr2>
80106782:	8b 55 08             	mov    0x8(%ebp),%edx
80106785:	8b 5a 38             	mov    0x38(%edx),%ebx
              tf->trapno, cpu->id, tf->eip, rcr2());
80106788:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
8010678f:	0f b6 12             	movzbl (%edx),%edx
   
  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80106792:	0f b6 ca             	movzbl %dl,%ecx
80106795:	8b 55 08             	mov    0x8(%ebp),%edx
80106798:	8b 52 30             	mov    0x30(%edx),%edx
8010679b:	89 44 24 10          	mov    %eax,0x10(%esp)
8010679f:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
801067a3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
801067a7:	89 54 24 04          	mov    %edx,0x4(%esp)
801067ab:	c7 04 24 3c 88 10 80 	movl   $0x8010883c,(%esp)
801067b2:	e8 e3 9b ff ff       	call   8010039a <cprintf>
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
801067b7:	c7 04 24 6e 88 10 80 	movl   $0x8010886e,(%esp)
801067be:	e8 77 9d ff ff       	call   8010053a <panic>
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801067c3:	e8 dd fc ff ff       	call   801064a5 <rcr2>
801067c8:	89 c2                	mov    %eax,%edx
801067ca:	8b 45 08             	mov    0x8(%ebp),%eax
801067cd:	8b 78 38             	mov    0x38(%eax),%edi
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
801067d0:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801067d6:	0f b6 00             	movzbl (%eax),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801067d9:	0f b6 f0             	movzbl %al,%esi
801067dc:	8b 45 08             	mov    0x8(%ebp),%eax
801067df:	8b 58 34             	mov    0x34(%eax),%ebx
801067e2:	8b 45 08             	mov    0x8(%ebp),%eax
801067e5:	8b 48 30             	mov    0x30(%eax),%ecx
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
801067e8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801067ee:	83 c0 6c             	add    $0x6c,%eax
801067f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
801067f4:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpu->id, tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801067fa:	8b 40 10             	mov    0x10(%eax),%eax
801067fd:	89 54 24 1c          	mov    %edx,0x1c(%esp)
80106801:	89 7c 24 18          	mov    %edi,0x18(%esp)
80106805:	89 74 24 14          	mov    %esi,0x14(%esp)
80106809:	89 5c 24 10          	mov    %ebx,0x10(%esp)
8010680d:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
80106811:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106814:	89 54 24 08          	mov    %edx,0x8(%esp)
80106818:	89 44 24 04          	mov    %eax,0x4(%esp)
8010681c:	c7 04 24 74 88 10 80 	movl   $0x80108874,(%esp)
80106823:	e8 72 9b ff ff       	call   8010039a <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpu->id, tf->eip, 
            rcr2());
    proc->killed = 1;
80106828:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010682e:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80106835:	eb 01                	jmp    80106838 <trap+0x1f6>
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
80106837:	90                   	nop
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running 
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80106838:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010683e:	85 c0                	test   %eax,%eax
80106840:	74 24                	je     80106866 <trap+0x224>
80106842:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106848:	8b 40 24             	mov    0x24(%eax),%eax
8010684b:	85 c0                	test   %eax,%eax
8010684d:	74 17                	je     80106866 <trap+0x224>
8010684f:	8b 45 08             	mov    0x8(%ebp),%eax
80106852:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
80106856:	0f b7 c0             	movzwl %ax,%eax
80106859:	83 e0 03             	and    $0x3,%eax
8010685c:	83 f8 03             	cmp    $0x3,%eax
8010685f:	75 05                	jne    80106866 <trap+0x224>
    exit();
80106861:	e8 b1 db ff ff       	call   80104417 <exit>

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80106866:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010686c:	85 c0                	test   %eax,%eax
8010686e:	74 1e                	je     8010688e <trap+0x24c>
80106870:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106876:	8b 40 0c             	mov    0xc(%eax),%eax
80106879:	83 f8 04             	cmp    $0x4,%eax
8010687c:	75 10                	jne    8010688e <trap+0x24c>
8010687e:	8b 45 08             	mov    0x8(%ebp),%eax
80106881:	8b 40 30             	mov    0x30(%eax),%eax
80106884:	83 f8 20             	cmp    $0x20,%eax
80106887:	75 05                	jne    8010688e <trap+0x24c>
    yield();
80106889:	e8 b3 e1 ff ff       	call   80104a41 <yield>

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
8010688e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80106894:	85 c0                	test   %eax,%eax
80106896:	74 27                	je     801068bf <trap+0x27d>
80106898:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010689e:	8b 40 24             	mov    0x24(%eax),%eax
801068a1:	85 c0                	test   %eax,%eax
801068a3:	74 1a                	je     801068bf <trap+0x27d>
801068a5:	8b 45 08             	mov    0x8(%ebp),%eax
801068a8:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
801068ac:	0f b7 c0             	movzwl %ax,%eax
801068af:	83 e0 03             	and    $0x3,%eax
801068b2:	83 f8 03             	cmp    $0x3,%eax
801068b5:	75 08                	jne    801068bf <trap+0x27d>
    exit();
801068b7:	e8 5b db ff ff       	call   80104417 <exit>
801068bc:	eb 01                	jmp    801068bf <trap+0x27d>
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
    return;
801068be:	90                   	nop
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
801068bf:	83 c4 3c             	add    $0x3c,%esp
801068c2:	5b                   	pop    %ebx
801068c3:	5e                   	pop    %esi
801068c4:	5f                   	pop    %edi
801068c5:	5d                   	pop    %ebp
801068c6:	c3                   	ret    
	...

801068c8 <inb>:
// Routines to let C code use special x86 instructions.

static inline uchar
inb(ushort port)
{
801068c8:	55                   	push   %ebp
801068c9:	89 e5                	mov    %esp,%ebp
801068cb:	83 ec 14             	sub    $0x14,%esp
801068ce:	8b 45 08             	mov    0x8(%ebp),%eax
801068d1:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801068d5:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
801068d9:	89 c2                	mov    %eax,%edx
801068db:	ec                   	in     (%dx),%al
801068dc:	88 45 ff             	mov    %al,-0x1(%ebp)
  return data;
801068df:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
}
801068e3:	c9                   	leave  
801068e4:	c3                   	ret    

801068e5 <outb>:
               "memory", "cc");
}

static inline void
outb(ushort port, uchar data)
{
801068e5:	55                   	push   %ebp
801068e6:	89 e5                	mov    %esp,%ebp
801068e8:	83 ec 08             	sub    $0x8,%esp
801068eb:	8b 55 08             	mov    0x8(%ebp),%edx
801068ee:	8b 45 0c             	mov    0xc(%ebp),%eax
801068f1:	66 89 55 fc          	mov    %dx,-0x4(%ebp)
801068f5:	88 45 f8             	mov    %al,-0x8(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801068f8:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
801068fc:	0f b7 55 fc          	movzwl -0x4(%ebp),%edx
80106900:	ee                   	out    %al,(%dx)
}
80106901:	c9                   	leave  
80106902:	c3                   	ret    

80106903 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80106903:	55                   	push   %ebp
80106904:	89 e5                	mov    %esp,%ebp
80106906:	83 ec 28             	sub    $0x28,%esp
  char *p;

  // Turn off the FIFO
  outb(COM1+2, 0);
80106909:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106910:	00 
80106911:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
80106918:	e8 c8 ff ff ff       	call   801068e5 <outb>
  
  // 9600 baud, 8 data bits, 1 stop bit, parity off.
  outb(COM1+3, 0x80);    // Unlock divisor
8010691d:	c7 44 24 04 80 00 00 	movl   $0x80,0x4(%esp)
80106924:	00 
80106925:	c7 04 24 fb 03 00 00 	movl   $0x3fb,(%esp)
8010692c:	e8 b4 ff ff ff       	call   801068e5 <outb>
  outb(COM1+0, 115200/9600);
80106931:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
80106938:	00 
80106939:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106940:	e8 a0 ff ff ff       	call   801068e5 <outb>
  outb(COM1+1, 0);
80106945:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010694c:	00 
8010694d:	c7 04 24 f9 03 00 00 	movl   $0x3f9,(%esp)
80106954:	e8 8c ff ff ff       	call   801068e5 <outb>
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
80106959:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
80106960:	00 
80106961:	c7 04 24 fb 03 00 00 	movl   $0x3fb,(%esp)
80106968:	e8 78 ff ff ff       	call   801068e5 <outb>
  outb(COM1+4, 0);
8010696d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106974:	00 
80106975:	c7 04 24 fc 03 00 00 	movl   $0x3fc,(%esp)
8010697c:	e8 64 ff ff ff       	call   801068e5 <outb>
  outb(COM1+1, 0x01);    // Enable receive interrupts.
80106981:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80106988:	00 
80106989:	c7 04 24 f9 03 00 00 	movl   $0x3f9,(%esp)
80106990:	e8 50 ff ff ff       	call   801068e5 <outb>

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80106995:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
8010699c:	e8 27 ff ff ff       	call   801068c8 <inb>
801069a1:	3c ff                	cmp    $0xff,%al
801069a3:	74 6c                	je     80106a11 <uartinit+0x10e>
    return;
  uart = 1;
801069a5:	c7 05 6c b6 10 80 01 	movl   $0x1,0x8010b66c
801069ac:	00 00 00 

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
801069af:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
801069b6:	e8 0d ff ff ff       	call   801068c8 <inb>
  inb(COM1+0);
801069bb:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
801069c2:	e8 01 ff ff ff       	call   801068c8 <inb>
  picenable(IRQ_COM1);
801069c7:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
801069ce:	e8 ae d0 ff ff       	call   80103a81 <picenable>
  ioapicenable(IRQ_COM1, 0);
801069d3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801069da:	00 
801069db:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
801069e2:	e8 8b bf ff ff       	call   80102972 <ioapicenable>
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
801069e7:	c7 45 f4 38 89 10 80 	movl   $0x80108938,-0xc(%ebp)
801069ee:	eb 15                	jmp    80106a05 <uartinit+0x102>
    uartputc(*p);
801069f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
801069f3:	0f b6 00             	movzbl (%eax),%eax
801069f6:	0f be c0             	movsbl %al,%eax
801069f9:	89 04 24             	mov    %eax,(%esp)
801069fc:	e8 13 00 00 00       	call   80106a14 <uartputc>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80106a01:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80106a05:	8b 45 f4             	mov    -0xc(%ebp),%eax
80106a08:	0f b6 00             	movzbl (%eax),%eax
80106a0b:	84 c0                	test   %al,%al
80106a0d:	75 e1                	jne    801069f0 <uartinit+0xed>
80106a0f:	eb 01                	jmp    80106a12 <uartinit+0x10f>
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
    return;
80106a11:	90                   	nop
  ioapicenable(IRQ_COM1, 0);
  
  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}
80106a12:	c9                   	leave  
80106a13:	c3                   	ret    

80106a14 <uartputc>:

void
uartputc(int c)
{
80106a14:	55                   	push   %ebp
80106a15:	89 e5                	mov    %esp,%ebp
80106a17:	83 ec 28             	sub    $0x28,%esp
  int i;

  if(!uart)
80106a1a:	a1 6c b6 10 80       	mov    0x8010b66c,%eax
80106a1f:	85 c0                	test   %eax,%eax
80106a21:	74 4d                	je     80106a70 <uartputc+0x5c>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80106a23:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
80106a2a:	eb 10                	jmp    80106a3c <uartputc+0x28>
    microdelay(10);
80106a2c:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
80106a33:	e8 c1 c4 ff ff       	call   80102ef9 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80106a38:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
80106a3c:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%ebp)
80106a40:	7f 16                	jg     80106a58 <uartputc+0x44>
80106a42:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
80106a49:	e8 7a fe ff ff       	call   801068c8 <inb>
80106a4e:	0f b6 c0             	movzbl %al,%eax
80106a51:	83 e0 20             	and    $0x20,%eax
80106a54:	85 c0                	test   %eax,%eax
80106a56:	74 d4                	je     80106a2c <uartputc+0x18>
    microdelay(10);
  outb(COM1+0, c);
80106a58:	8b 45 08             	mov    0x8(%ebp),%eax
80106a5b:	0f b6 c0             	movzbl %al,%eax
80106a5e:	89 44 24 04          	mov    %eax,0x4(%esp)
80106a62:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106a69:	e8 77 fe ff ff       	call   801068e5 <outb>
80106a6e:	eb 01                	jmp    80106a71 <uartputc+0x5d>
uartputc(int c)
{
  int i;

  if(!uart)
    return;
80106a70:	90                   	nop
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80106a71:	c9                   	leave  
80106a72:	c3                   	ret    

80106a73 <uartgetc>:

static int
uartgetc(void)
{
80106a73:	55                   	push   %ebp
80106a74:	89 e5                	mov    %esp,%ebp
80106a76:	83 ec 04             	sub    $0x4,%esp
  if(!uart)
80106a79:	a1 6c b6 10 80       	mov    0x8010b66c,%eax
80106a7e:	85 c0                	test   %eax,%eax
80106a80:	75 07                	jne    80106a89 <uartgetc+0x16>
    return -1;
80106a82:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106a87:	eb 2c                	jmp    80106ab5 <uartgetc+0x42>
  if(!(inb(COM1+5) & 0x01))
80106a89:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
80106a90:	e8 33 fe ff ff       	call   801068c8 <inb>
80106a95:	0f b6 c0             	movzbl %al,%eax
80106a98:	83 e0 01             	and    $0x1,%eax
80106a9b:	85 c0                	test   %eax,%eax
80106a9d:	75 07                	jne    80106aa6 <uartgetc+0x33>
    return -1;
80106a9f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106aa4:	eb 0f                	jmp    80106ab5 <uartgetc+0x42>
  return inb(COM1+0);
80106aa6:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
80106aad:	e8 16 fe ff ff       	call   801068c8 <inb>
80106ab2:	0f b6 c0             	movzbl %al,%eax
}
80106ab5:	c9                   	leave  
80106ab6:	c3                   	ret    

80106ab7 <uartintr>:

void
uartintr(void)
{
80106ab7:	55                   	push   %ebp
80106ab8:	89 e5                	mov    %esp,%ebp
80106aba:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
80106abd:	c7 04 24 73 6a 10 80 	movl   $0x80106a73,(%esp)
80106ac4:	e8 e2 9c ff ff       	call   801007ab <consoleintr>
}
80106ac9:	c9                   	leave  
80106aca:	c3                   	ret    
	...

80106acc <vector0>:
80106acc:	6a 00                	push   $0x0
80106ace:	6a 00                	push   $0x0
80106ad0:	e9 7b f9 ff ff       	jmp    80106450 <alltraps>

80106ad5 <vector1>:
80106ad5:	6a 00                	push   $0x0
80106ad7:	6a 01                	push   $0x1
80106ad9:	e9 72 f9 ff ff       	jmp    80106450 <alltraps>

80106ade <vector2>:
80106ade:	6a 00                	push   $0x0
80106ae0:	6a 02                	push   $0x2
80106ae2:	e9 69 f9 ff ff       	jmp    80106450 <alltraps>

80106ae7 <vector3>:
80106ae7:	6a 00                	push   $0x0
80106ae9:	6a 03                	push   $0x3
80106aeb:	e9 60 f9 ff ff       	jmp    80106450 <alltraps>

80106af0 <vector4>:
80106af0:	6a 00                	push   $0x0
80106af2:	6a 04                	push   $0x4
80106af4:	e9 57 f9 ff ff       	jmp    80106450 <alltraps>

80106af9 <vector5>:
80106af9:	6a 00                	push   $0x0
80106afb:	6a 05                	push   $0x5
80106afd:	e9 4e f9 ff ff       	jmp    80106450 <alltraps>

80106b02 <vector6>:
80106b02:	6a 00                	push   $0x0
80106b04:	6a 06                	push   $0x6
80106b06:	e9 45 f9 ff ff       	jmp    80106450 <alltraps>

80106b0b <vector7>:
80106b0b:	6a 00                	push   $0x0
80106b0d:	6a 07                	push   $0x7
80106b0f:	e9 3c f9 ff ff       	jmp    80106450 <alltraps>

80106b14 <vector8>:
80106b14:	6a 08                	push   $0x8
80106b16:	e9 35 f9 ff ff       	jmp    80106450 <alltraps>

80106b1b <vector9>:
80106b1b:	6a 00                	push   $0x0
80106b1d:	6a 09                	push   $0x9
80106b1f:	e9 2c f9 ff ff       	jmp    80106450 <alltraps>

80106b24 <vector10>:
80106b24:	6a 0a                	push   $0xa
80106b26:	e9 25 f9 ff ff       	jmp    80106450 <alltraps>

80106b2b <vector11>:
80106b2b:	6a 0b                	push   $0xb
80106b2d:	e9 1e f9 ff ff       	jmp    80106450 <alltraps>

80106b32 <vector12>:
80106b32:	6a 0c                	push   $0xc
80106b34:	e9 17 f9 ff ff       	jmp    80106450 <alltraps>

80106b39 <vector13>:
80106b39:	6a 0d                	push   $0xd
80106b3b:	e9 10 f9 ff ff       	jmp    80106450 <alltraps>

80106b40 <vector14>:
80106b40:	6a 0e                	push   $0xe
80106b42:	e9 09 f9 ff ff       	jmp    80106450 <alltraps>

80106b47 <vector15>:
80106b47:	6a 00                	push   $0x0
80106b49:	6a 0f                	push   $0xf
80106b4b:	e9 00 f9 ff ff       	jmp    80106450 <alltraps>

80106b50 <vector16>:
80106b50:	6a 00                	push   $0x0
80106b52:	6a 10                	push   $0x10
80106b54:	e9 f7 f8 ff ff       	jmp    80106450 <alltraps>

80106b59 <vector17>:
80106b59:	6a 11                	push   $0x11
80106b5b:	e9 f0 f8 ff ff       	jmp    80106450 <alltraps>

80106b60 <vector18>:
80106b60:	6a 00                	push   $0x0
80106b62:	6a 12                	push   $0x12
80106b64:	e9 e7 f8 ff ff       	jmp    80106450 <alltraps>

80106b69 <vector19>:
80106b69:	6a 00                	push   $0x0
80106b6b:	6a 13                	push   $0x13
80106b6d:	e9 de f8 ff ff       	jmp    80106450 <alltraps>

80106b72 <vector20>:
80106b72:	6a 00                	push   $0x0
80106b74:	6a 14                	push   $0x14
80106b76:	e9 d5 f8 ff ff       	jmp    80106450 <alltraps>

80106b7b <vector21>:
80106b7b:	6a 00                	push   $0x0
80106b7d:	6a 15                	push   $0x15
80106b7f:	e9 cc f8 ff ff       	jmp    80106450 <alltraps>

80106b84 <vector22>:
80106b84:	6a 00                	push   $0x0
80106b86:	6a 16                	push   $0x16
80106b88:	e9 c3 f8 ff ff       	jmp    80106450 <alltraps>

80106b8d <vector23>:
80106b8d:	6a 00                	push   $0x0
80106b8f:	6a 17                	push   $0x17
80106b91:	e9 ba f8 ff ff       	jmp    80106450 <alltraps>

80106b96 <vector24>:
80106b96:	6a 00                	push   $0x0
80106b98:	6a 18                	push   $0x18
80106b9a:	e9 b1 f8 ff ff       	jmp    80106450 <alltraps>

80106b9f <vector25>:
80106b9f:	6a 00                	push   $0x0
80106ba1:	6a 19                	push   $0x19
80106ba3:	e9 a8 f8 ff ff       	jmp    80106450 <alltraps>

80106ba8 <vector26>:
80106ba8:	6a 00                	push   $0x0
80106baa:	6a 1a                	push   $0x1a
80106bac:	e9 9f f8 ff ff       	jmp    80106450 <alltraps>

80106bb1 <vector27>:
80106bb1:	6a 00                	push   $0x0
80106bb3:	6a 1b                	push   $0x1b
80106bb5:	e9 96 f8 ff ff       	jmp    80106450 <alltraps>

80106bba <vector28>:
80106bba:	6a 00                	push   $0x0
80106bbc:	6a 1c                	push   $0x1c
80106bbe:	e9 8d f8 ff ff       	jmp    80106450 <alltraps>

80106bc3 <vector29>:
80106bc3:	6a 00                	push   $0x0
80106bc5:	6a 1d                	push   $0x1d
80106bc7:	e9 84 f8 ff ff       	jmp    80106450 <alltraps>

80106bcc <vector30>:
80106bcc:	6a 00                	push   $0x0
80106bce:	6a 1e                	push   $0x1e
80106bd0:	e9 7b f8 ff ff       	jmp    80106450 <alltraps>

80106bd5 <vector31>:
80106bd5:	6a 00                	push   $0x0
80106bd7:	6a 1f                	push   $0x1f
80106bd9:	e9 72 f8 ff ff       	jmp    80106450 <alltraps>

80106bde <vector32>:
80106bde:	6a 00                	push   $0x0
80106be0:	6a 20                	push   $0x20
80106be2:	e9 69 f8 ff ff       	jmp    80106450 <alltraps>

80106be7 <vector33>:
80106be7:	6a 00                	push   $0x0
80106be9:	6a 21                	push   $0x21
80106beb:	e9 60 f8 ff ff       	jmp    80106450 <alltraps>

80106bf0 <vector34>:
80106bf0:	6a 00                	push   $0x0
80106bf2:	6a 22                	push   $0x22
80106bf4:	e9 57 f8 ff ff       	jmp    80106450 <alltraps>

80106bf9 <vector35>:
80106bf9:	6a 00                	push   $0x0
80106bfb:	6a 23                	push   $0x23
80106bfd:	e9 4e f8 ff ff       	jmp    80106450 <alltraps>

80106c02 <vector36>:
80106c02:	6a 00                	push   $0x0
80106c04:	6a 24                	push   $0x24
80106c06:	e9 45 f8 ff ff       	jmp    80106450 <alltraps>

80106c0b <vector37>:
80106c0b:	6a 00                	push   $0x0
80106c0d:	6a 25                	push   $0x25
80106c0f:	e9 3c f8 ff ff       	jmp    80106450 <alltraps>

80106c14 <vector38>:
80106c14:	6a 00                	push   $0x0
80106c16:	6a 26                	push   $0x26
80106c18:	e9 33 f8 ff ff       	jmp    80106450 <alltraps>

80106c1d <vector39>:
80106c1d:	6a 00                	push   $0x0
80106c1f:	6a 27                	push   $0x27
80106c21:	e9 2a f8 ff ff       	jmp    80106450 <alltraps>

80106c26 <vector40>:
80106c26:	6a 00                	push   $0x0
80106c28:	6a 28                	push   $0x28
80106c2a:	e9 21 f8 ff ff       	jmp    80106450 <alltraps>

80106c2f <vector41>:
80106c2f:	6a 00                	push   $0x0
80106c31:	6a 29                	push   $0x29
80106c33:	e9 18 f8 ff ff       	jmp    80106450 <alltraps>

80106c38 <vector42>:
80106c38:	6a 00                	push   $0x0
80106c3a:	6a 2a                	push   $0x2a
80106c3c:	e9 0f f8 ff ff       	jmp    80106450 <alltraps>

80106c41 <vector43>:
80106c41:	6a 00                	push   $0x0
80106c43:	6a 2b                	push   $0x2b
80106c45:	e9 06 f8 ff ff       	jmp    80106450 <alltraps>

80106c4a <vector44>:
80106c4a:	6a 00                	push   $0x0
80106c4c:	6a 2c                	push   $0x2c
80106c4e:	e9 fd f7 ff ff       	jmp    80106450 <alltraps>

80106c53 <vector45>:
80106c53:	6a 00                	push   $0x0
80106c55:	6a 2d                	push   $0x2d
80106c57:	e9 f4 f7 ff ff       	jmp    80106450 <alltraps>

80106c5c <vector46>:
80106c5c:	6a 00                	push   $0x0
80106c5e:	6a 2e                	push   $0x2e
80106c60:	e9 eb f7 ff ff       	jmp    80106450 <alltraps>

80106c65 <vector47>:
80106c65:	6a 00                	push   $0x0
80106c67:	6a 2f                	push   $0x2f
80106c69:	e9 e2 f7 ff ff       	jmp    80106450 <alltraps>

80106c6e <vector48>:
80106c6e:	6a 00                	push   $0x0
80106c70:	6a 30                	push   $0x30
80106c72:	e9 d9 f7 ff ff       	jmp    80106450 <alltraps>

80106c77 <vector49>:
80106c77:	6a 00                	push   $0x0
80106c79:	6a 31                	push   $0x31
80106c7b:	e9 d0 f7 ff ff       	jmp    80106450 <alltraps>

80106c80 <vector50>:
80106c80:	6a 00                	push   $0x0
80106c82:	6a 32                	push   $0x32
80106c84:	e9 c7 f7 ff ff       	jmp    80106450 <alltraps>

80106c89 <vector51>:
80106c89:	6a 00                	push   $0x0
80106c8b:	6a 33                	push   $0x33
80106c8d:	e9 be f7 ff ff       	jmp    80106450 <alltraps>

80106c92 <vector52>:
80106c92:	6a 00                	push   $0x0
80106c94:	6a 34                	push   $0x34
80106c96:	e9 b5 f7 ff ff       	jmp    80106450 <alltraps>

80106c9b <vector53>:
80106c9b:	6a 00                	push   $0x0
80106c9d:	6a 35                	push   $0x35
80106c9f:	e9 ac f7 ff ff       	jmp    80106450 <alltraps>

80106ca4 <vector54>:
80106ca4:	6a 00                	push   $0x0
80106ca6:	6a 36                	push   $0x36
80106ca8:	e9 a3 f7 ff ff       	jmp    80106450 <alltraps>

80106cad <vector55>:
80106cad:	6a 00                	push   $0x0
80106caf:	6a 37                	push   $0x37
80106cb1:	e9 9a f7 ff ff       	jmp    80106450 <alltraps>

80106cb6 <vector56>:
80106cb6:	6a 00                	push   $0x0
80106cb8:	6a 38                	push   $0x38
80106cba:	e9 91 f7 ff ff       	jmp    80106450 <alltraps>

80106cbf <vector57>:
80106cbf:	6a 00                	push   $0x0
80106cc1:	6a 39                	push   $0x39
80106cc3:	e9 88 f7 ff ff       	jmp    80106450 <alltraps>

80106cc8 <vector58>:
80106cc8:	6a 00                	push   $0x0
80106cca:	6a 3a                	push   $0x3a
80106ccc:	e9 7f f7 ff ff       	jmp    80106450 <alltraps>

80106cd1 <vector59>:
80106cd1:	6a 00                	push   $0x0
80106cd3:	6a 3b                	push   $0x3b
80106cd5:	e9 76 f7 ff ff       	jmp    80106450 <alltraps>

80106cda <vector60>:
80106cda:	6a 00                	push   $0x0
80106cdc:	6a 3c                	push   $0x3c
80106cde:	e9 6d f7 ff ff       	jmp    80106450 <alltraps>

80106ce3 <vector61>:
80106ce3:	6a 00                	push   $0x0
80106ce5:	6a 3d                	push   $0x3d
80106ce7:	e9 64 f7 ff ff       	jmp    80106450 <alltraps>

80106cec <vector62>:
80106cec:	6a 00                	push   $0x0
80106cee:	6a 3e                	push   $0x3e
80106cf0:	e9 5b f7 ff ff       	jmp    80106450 <alltraps>

80106cf5 <vector63>:
80106cf5:	6a 00                	push   $0x0
80106cf7:	6a 3f                	push   $0x3f
80106cf9:	e9 52 f7 ff ff       	jmp    80106450 <alltraps>

80106cfe <vector64>:
80106cfe:	6a 00                	push   $0x0
80106d00:	6a 40                	push   $0x40
80106d02:	e9 49 f7 ff ff       	jmp    80106450 <alltraps>

80106d07 <vector65>:
80106d07:	6a 00                	push   $0x0
80106d09:	6a 41                	push   $0x41
80106d0b:	e9 40 f7 ff ff       	jmp    80106450 <alltraps>

80106d10 <vector66>:
80106d10:	6a 00                	push   $0x0
80106d12:	6a 42                	push   $0x42
80106d14:	e9 37 f7 ff ff       	jmp    80106450 <alltraps>

80106d19 <vector67>:
80106d19:	6a 00                	push   $0x0
80106d1b:	6a 43                	push   $0x43
80106d1d:	e9 2e f7 ff ff       	jmp    80106450 <alltraps>

80106d22 <vector68>:
80106d22:	6a 00                	push   $0x0
80106d24:	6a 44                	push   $0x44
80106d26:	e9 25 f7 ff ff       	jmp    80106450 <alltraps>

80106d2b <vector69>:
80106d2b:	6a 00                	push   $0x0
80106d2d:	6a 45                	push   $0x45
80106d2f:	e9 1c f7 ff ff       	jmp    80106450 <alltraps>

80106d34 <vector70>:
80106d34:	6a 00                	push   $0x0
80106d36:	6a 46                	push   $0x46
80106d38:	e9 13 f7 ff ff       	jmp    80106450 <alltraps>

80106d3d <vector71>:
80106d3d:	6a 00                	push   $0x0
80106d3f:	6a 47                	push   $0x47
80106d41:	e9 0a f7 ff ff       	jmp    80106450 <alltraps>

80106d46 <vector72>:
80106d46:	6a 00                	push   $0x0
80106d48:	6a 48                	push   $0x48
80106d4a:	e9 01 f7 ff ff       	jmp    80106450 <alltraps>

80106d4f <vector73>:
80106d4f:	6a 00                	push   $0x0
80106d51:	6a 49                	push   $0x49
80106d53:	e9 f8 f6 ff ff       	jmp    80106450 <alltraps>

80106d58 <vector74>:
80106d58:	6a 00                	push   $0x0
80106d5a:	6a 4a                	push   $0x4a
80106d5c:	e9 ef f6 ff ff       	jmp    80106450 <alltraps>

80106d61 <vector75>:
80106d61:	6a 00                	push   $0x0
80106d63:	6a 4b                	push   $0x4b
80106d65:	e9 e6 f6 ff ff       	jmp    80106450 <alltraps>

80106d6a <vector76>:
80106d6a:	6a 00                	push   $0x0
80106d6c:	6a 4c                	push   $0x4c
80106d6e:	e9 dd f6 ff ff       	jmp    80106450 <alltraps>

80106d73 <vector77>:
80106d73:	6a 00                	push   $0x0
80106d75:	6a 4d                	push   $0x4d
80106d77:	e9 d4 f6 ff ff       	jmp    80106450 <alltraps>

80106d7c <vector78>:
80106d7c:	6a 00                	push   $0x0
80106d7e:	6a 4e                	push   $0x4e
80106d80:	e9 cb f6 ff ff       	jmp    80106450 <alltraps>

80106d85 <vector79>:
80106d85:	6a 00                	push   $0x0
80106d87:	6a 4f                	push   $0x4f
80106d89:	e9 c2 f6 ff ff       	jmp    80106450 <alltraps>

80106d8e <vector80>:
80106d8e:	6a 00                	push   $0x0
80106d90:	6a 50                	push   $0x50
80106d92:	e9 b9 f6 ff ff       	jmp    80106450 <alltraps>

80106d97 <vector81>:
80106d97:	6a 00                	push   $0x0
80106d99:	6a 51                	push   $0x51
80106d9b:	e9 b0 f6 ff ff       	jmp    80106450 <alltraps>

80106da0 <vector82>:
80106da0:	6a 00                	push   $0x0
80106da2:	6a 52                	push   $0x52
80106da4:	e9 a7 f6 ff ff       	jmp    80106450 <alltraps>

80106da9 <vector83>:
80106da9:	6a 00                	push   $0x0
80106dab:	6a 53                	push   $0x53
80106dad:	e9 9e f6 ff ff       	jmp    80106450 <alltraps>

80106db2 <vector84>:
80106db2:	6a 00                	push   $0x0
80106db4:	6a 54                	push   $0x54
80106db6:	e9 95 f6 ff ff       	jmp    80106450 <alltraps>

80106dbb <vector85>:
80106dbb:	6a 00                	push   $0x0
80106dbd:	6a 55                	push   $0x55
80106dbf:	e9 8c f6 ff ff       	jmp    80106450 <alltraps>

80106dc4 <vector86>:
80106dc4:	6a 00                	push   $0x0
80106dc6:	6a 56                	push   $0x56
80106dc8:	e9 83 f6 ff ff       	jmp    80106450 <alltraps>

80106dcd <vector87>:
80106dcd:	6a 00                	push   $0x0
80106dcf:	6a 57                	push   $0x57
80106dd1:	e9 7a f6 ff ff       	jmp    80106450 <alltraps>

80106dd6 <vector88>:
80106dd6:	6a 00                	push   $0x0
80106dd8:	6a 58                	push   $0x58
80106dda:	e9 71 f6 ff ff       	jmp    80106450 <alltraps>

80106ddf <vector89>:
80106ddf:	6a 00                	push   $0x0
80106de1:	6a 59                	push   $0x59
80106de3:	e9 68 f6 ff ff       	jmp    80106450 <alltraps>

80106de8 <vector90>:
80106de8:	6a 00                	push   $0x0
80106dea:	6a 5a                	push   $0x5a
80106dec:	e9 5f f6 ff ff       	jmp    80106450 <alltraps>

80106df1 <vector91>:
80106df1:	6a 00                	push   $0x0
80106df3:	6a 5b                	push   $0x5b
80106df5:	e9 56 f6 ff ff       	jmp    80106450 <alltraps>

80106dfa <vector92>:
80106dfa:	6a 00                	push   $0x0
80106dfc:	6a 5c                	push   $0x5c
80106dfe:	e9 4d f6 ff ff       	jmp    80106450 <alltraps>

80106e03 <vector93>:
80106e03:	6a 00                	push   $0x0
80106e05:	6a 5d                	push   $0x5d
80106e07:	e9 44 f6 ff ff       	jmp    80106450 <alltraps>

80106e0c <vector94>:
80106e0c:	6a 00                	push   $0x0
80106e0e:	6a 5e                	push   $0x5e
80106e10:	e9 3b f6 ff ff       	jmp    80106450 <alltraps>

80106e15 <vector95>:
80106e15:	6a 00                	push   $0x0
80106e17:	6a 5f                	push   $0x5f
80106e19:	e9 32 f6 ff ff       	jmp    80106450 <alltraps>

80106e1e <vector96>:
80106e1e:	6a 00                	push   $0x0
80106e20:	6a 60                	push   $0x60
80106e22:	e9 29 f6 ff ff       	jmp    80106450 <alltraps>

80106e27 <vector97>:
80106e27:	6a 00                	push   $0x0
80106e29:	6a 61                	push   $0x61
80106e2b:	e9 20 f6 ff ff       	jmp    80106450 <alltraps>

80106e30 <vector98>:
80106e30:	6a 00                	push   $0x0
80106e32:	6a 62                	push   $0x62
80106e34:	e9 17 f6 ff ff       	jmp    80106450 <alltraps>

80106e39 <vector99>:
80106e39:	6a 00                	push   $0x0
80106e3b:	6a 63                	push   $0x63
80106e3d:	e9 0e f6 ff ff       	jmp    80106450 <alltraps>

80106e42 <vector100>:
80106e42:	6a 00                	push   $0x0
80106e44:	6a 64                	push   $0x64
80106e46:	e9 05 f6 ff ff       	jmp    80106450 <alltraps>

80106e4b <vector101>:
80106e4b:	6a 00                	push   $0x0
80106e4d:	6a 65                	push   $0x65
80106e4f:	e9 fc f5 ff ff       	jmp    80106450 <alltraps>

80106e54 <vector102>:
80106e54:	6a 00                	push   $0x0
80106e56:	6a 66                	push   $0x66
80106e58:	e9 f3 f5 ff ff       	jmp    80106450 <alltraps>

80106e5d <vector103>:
80106e5d:	6a 00                	push   $0x0
80106e5f:	6a 67                	push   $0x67
80106e61:	e9 ea f5 ff ff       	jmp    80106450 <alltraps>

80106e66 <vector104>:
80106e66:	6a 00                	push   $0x0
80106e68:	6a 68                	push   $0x68
80106e6a:	e9 e1 f5 ff ff       	jmp    80106450 <alltraps>

80106e6f <vector105>:
80106e6f:	6a 00                	push   $0x0
80106e71:	6a 69                	push   $0x69
80106e73:	e9 d8 f5 ff ff       	jmp    80106450 <alltraps>

80106e78 <vector106>:
80106e78:	6a 00                	push   $0x0
80106e7a:	6a 6a                	push   $0x6a
80106e7c:	e9 cf f5 ff ff       	jmp    80106450 <alltraps>

80106e81 <vector107>:
80106e81:	6a 00                	push   $0x0
80106e83:	6a 6b                	push   $0x6b
80106e85:	e9 c6 f5 ff ff       	jmp    80106450 <alltraps>

80106e8a <vector108>:
80106e8a:	6a 00                	push   $0x0
80106e8c:	6a 6c                	push   $0x6c
80106e8e:	e9 bd f5 ff ff       	jmp    80106450 <alltraps>

80106e93 <vector109>:
80106e93:	6a 00                	push   $0x0
80106e95:	6a 6d                	push   $0x6d
80106e97:	e9 b4 f5 ff ff       	jmp    80106450 <alltraps>

80106e9c <vector110>:
80106e9c:	6a 00                	push   $0x0
80106e9e:	6a 6e                	push   $0x6e
80106ea0:	e9 ab f5 ff ff       	jmp    80106450 <alltraps>

80106ea5 <vector111>:
80106ea5:	6a 00                	push   $0x0
80106ea7:	6a 6f                	push   $0x6f
80106ea9:	e9 a2 f5 ff ff       	jmp    80106450 <alltraps>

80106eae <vector112>:
80106eae:	6a 00                	push   $0x0
80106eb0:	6a 70                	push   $0x70
80106eb2:	e9 99 f5 ff ff       	jmp    80106450 <alltraps>

80106eb7 <vector113>:
80106eb7:	6a 00                	push   $0x0
80106eb9:	6a 71                	push   $0x71
80106ebb:	e9 90 f5 ff ff       	jmp    80106450 <alltraps>

80106ec0 <vector114>:
80106ec0:	6a 00                	push   $0x0
80106ec2:	6a 72                	push   $0x72
80106ec4:	e9 87 f5 ff ff       	jmp    80106450 <alltraps>

80106ec9 <vector115>:
80106ec9:	6a 00                	push   $0x0
80106ecb:	6a 73                	push   $0x73
80106ecd:	e9 7e f5 ff ff       	jmp    80106450 <alltraps>

80106ed2 <vector116>:
80106ed2:	6a 00                	push   $0x0
80106ed4:	6a 74                	push   $0x74
80106ed6:	e9 75 f5 ff ff       	jmp    80106450 <alltraps>

80106edb <vector117>:
80106edb:	6a 00                	push   $0x0
80106edd:	6a 75                	push   $0x75
80106edf:	e9 6c f5 ff ff       	jmp    80106450 <alltraps>

80106ee4 <vector118>:
80106ee4:	6a 00                	push   $0x0
80106ee6:	6a 76                	push   $0x76
80106ee8:	e9 63 f5 ff ff       	jmp    80106450 <alltraps>

80106eed <vector119>:
80106eed:	6a 00                	push   $0x0
80106eef:	6a 77                	push   $0x77
80106ef1:	e9 5a f5 ff ff       	jmp    80106450 <alltraps>

80106ef6 <vector120>:
80106ef6:	6a 00                	push   $0x0
80106ef8:	6a 78                	push   $0x78
80106efa:	e9 51 f5 ff ff       	jmp    80106450 <alltraps>

80106eff <vector121>:
80106eff:	6a 00                	push   $0x0
80106f01:	6a 79                	push   $0x79
80106f03:	e9 48 f5 ff ff       	jmp    80106450 <alltraps>

80106f08 <vector122>:
80106f08:	6a 00                	push   $0x0
80106f0a:	6a 7a                	push   $0x7a
80106f0c:	e9 3f f5 ff ff       	jmp    80106450 <alltraps>

80106f11 <vector123>:
80106f11:	6a 00                	push   $0x0
80106f13:	6a 7b                	push   $0x7b
80106f15:	e9 36 f5 ff ff       	jmp    80106450 <alltraps>

80106f1a <vector124>:
80106f1a:	6a 00                	push   $0x0
80106f1c:	6a 7c                	push   $0x7c
80106f1e:	e9 2d f5 ff ff       	jmp    80106450 <alltraps>

80106f23 <vector125>:
80106f23:	6a 00                	push   $0x0
80106f25:	6a 7d                	push   $0x7d
80106f27:	e9 24 f5 ff ff       	jmp    80106450 <alltraps>

80106f2c <vector126>:
80106f2c:	6a 00                	push   $0x0
80106f2e:	6a 7e                	push   $0x7e
80106f30:	e9 1b f5 ff ff       	jmp    80106450 <alltraps>

80106f35 <vector127>:
80106f35:	6a 00                	push   $0x0
80106f37:	6a 7f                	push   $0x7f
80106f39:	e9 12 f5 ff ff       	jmp    80106450 <alltraps>

80106f3e <vector128>:
80106f3e:	6a 00                	push   $0x0
80106f40:	68 80 00 00 00       	push   $0x80
80106f45:	e9 06 f5 ff ff       	jmp    80106450 <alltraps>

80106f4a <vector129>:
80106f4a:	6a 00                	push   $0x0
80106f4c:	68 81 00 00 00       	push   $0x81
80106f51:	e9 fa f4 ff ff       	jmp    80106450 <alltraps>

80106f56 <vector130>:
80106f56:	6a 00                	push   $0x0
80106f58:	68 82 00 00 00       	push   $0x82
80106f5d:	e9 ee f4 ff ff       	jmp    80106450 <alltraps>

80106f62 <vector131>:
80106f62:	6a 00                	push   $0x0
80106f64:	68 83 00 00 00       	push   $0x83
80106f69:	e9 e2 f4 ff ff       	jmp    80106450 <alltraps>

80106f6e <vector132>:
80106f6e:	6a 00                	push   $0x0
80106f70:	68 84 00 00 00       	push   $0x84
80106f75:	e9 d6 f4 ff ff       	jmp    80106450 <alltraps>

80106f7a <vector133>:
80106f7a:	6a 00                	push   $0x0
80106f7c:	68 85 00 00 00       	push   $0x85
80106f81:	e9 ca f4 ff ff       	jmp    80106450 <alltraps>

80106f86 <vector134>:
80106f86:	6a 00                	push   $0x0
80106f88:	68 86 00 00 00       	push   $0x86
80106f8d:	e9 be f4 ff ff       	jmp    80106450 <alltraps>

80106f92 <vector135>:
80106f92:	6a 00                	push   $0x0
80106f94:	68 87 00 00 00       	push   $0x87
80106f99:	e9 b2 f4 ff ff       	jmp    80106450 <alltraps>

80106f9e <vector136>:
80106f9e:	6a 00                	push   $0x0
80106fa0:	68 88 00 00 00       	push   $0x88
80106fa5:	e9 a6 f4 ff ff       	jmp    80106450 <alltraps>

80106faa <vector137>:
80106faa:	6a 00                	push   $0x0
80106fac:	68 89 00 00 00       	push   $0x89
80106fb1:	e9 9a f4 ff ff       	jmp    80106450 <alltraps>

80106fb6 <vector138>:
80106fb6:	6a 00                	push   $0x0
80106fb8:	68 8a 00 00 00       	push   $0x8a
80106fbd:	e9 8e f4 ff ff       	jmp    80106450 <alltraps>

80106fc2 <vector139>:
80106fc2:	6a 00                	push   $0x0
80106fc4:	68 8b 00 00 00       	push   $0x8b
80106fc9:	e9 82 f4 ff ff       	jmp    80106450 <alltraps>

80106fce <vector140>:
80106fce:	6a 00                	push   $0x0
80106fd0:	68 8c 00 00 00       	push   $0x8c
80106fd5:	e9 76 f4 ff ff       	jmp    80106450 <alltraps>

80106fda <vector141>:
80106fda:	6a 00                	push   $0x0
80106fdc:	68 8d 00 00 00       	push   $0x8d
80106fe1:	e9 6a f4 ff ff       	jmp    80106450 <alltraps>

80106fe6 <vector142>:
80106fe6:	6a 00                	push   $0x0
80106fe8:	68 8e 00 00 00       	push   $0x8e
80106fed:	e9 5e f4 ff ff       	jmp    80106450 <alltraps>

80106ff2 <vector143>:
80106ff2:	6a 00                	push   $0x0
80106ff4:	68 8f 00 00 00       	push   $0x8f
80106ff9:	e9 52 f4 ff ff       	jmp    80106450 <alltraps>

80106ffe <vector144>:
80106ffe:	6a 00                	push   $0x0
80107000:	68 90 00 00 00       	push   $0x90
80107005:	e9 46 f4 ff ff       	jmp    80106450 <alltraps>

8010700a <vector145>:
8010700a:	6a 00                	push   $0x0
8010700c:	68 91 00 00 00       	push   $0x91
80107011:	e9 3a f4 ff ff       	jmp    80106450 <alltraps>

80107016 <vector146>:
80107016:	6a 00                	push   $0x0
80107018:	68 92 00 00 00       	push   $0x92
8010701d:	e9 2e f4 ff ff       	jmp    80106450 <alltraps>

80107022 <vector147>:
80107022:	6a 00                	push   $0x0
80107024:	68 93 00 00 00       	push   $0x93
80107029:	e9 22 f4 ff ff       	jmp    80106450 <alltraps>

8010702e <vector148>:
8010702e:	6a 00                	push   $0x0
80107030:	68 94 00 00 00       	push   $0x94
80107035:	e9 16 f4 ff ff       	jmp    80106450 <alltraps>

8010703a <vector149>:
8010703a:	6a 00                	push   $0x0
8010703c:	68 95 00 00 00       	push   $0x95
80107041:	e9 0a f4 ff ff       	jmp    80106450 <alltraps>

80107046 <vector150>:
80107046:	6a 00                	push   $0x0
80107048:	68 96 00 00 00       	push   $0x96
8010704d:	e9 fe f3 ff ff       	jmp    80106450 <alltraps>

80107052 <vector151>:
80107052:	6a 00                	push   $0x0
80107054:	68 97 00 00 00       	push   $0x97
80107059:	e9 f2 f3 ff ff       	jmp    80106450 <alltraps>

8010705e <vector152>:
8010705e:	6a 00                	push   $0x0
80107060:	68 98 00 00 00       	push   $0x98
80107065:	e9 e6 f3 ff ff       	jmp    80106450 <alltraps>

8010706a <vector153>:
8010706a:	6a 00                	push   $0x0
8010706c:	68 99 00 00 00       	push   $0x99
80107071:	e9 da f3 ff ff       	jmp    80106450 <alltraps>

80107076 <vector154>:
80107076:	6a 00                	push   $0x0
80107078:	68 9a 00 00 00       	push   $0x9a
8010707d:	e9 ce f3 ff ff       	jmp    80106450 <alltraps>

80107082 <vector155>:
80107082:	6a 00                	push   $0x0
80107084:	68 9b 00 00 00       	push   $0x9b
80107089:	e9 c2 f3 ff ff       	jmp    80106450 <alltraps>

8010708e <vector156>:
8010708e:	6a 00                	push   $0x0
80107090:	68 9c 00 00 00       	push   $0x9c
80107095:	e9 b6 f3 ff ff       	jmp    80106450 <alltraps>

8010709a <vector157>:
8010709a:	6a 00                	push   $0x0
8010709c:	68 9d 00 00 00       	push   $0x9d
801070a1:	e9 aa f3 ff ff       	jmp    80106450 <alltraps>

801070a6 <vector158>:
801070a6:	6a 00                	push   $0x0
801070a8:	68 9e 00 00 00       	push   $0x9e
801070ad:	e9 9e f3 ff ff       	jmp    80106450 <alltraps>

801070b2 <vector159>:
801070b2:	6a 00                	push   $0x0
801070b4:	68 9f 00 00 00       	push   $0x9f
801070b9:	e9 92 f3 ff ff       	jmp    80106450 <alltraps>

801070be <vector160>:
801070be:	6a 00                	push   $0x0
801070c0:	68 a0 00 00 00       	push   $0xa0
801070c5:	e9 86 f3 ff ff       	jmp    80106450 <alltraps>

801070ca <vector161>:
801070ca:	6a 00                	push   $0x0
801070cc:	68 a1 00 00 00       	push   $0xa1
801070d1:	e9 7a f3 ff ff       	jmp    80106450 <alltraps>

801070d6 <vector162>:
801070d6:	6a 00                	push   $0x0
801070d8:	68 a2 00 00 00       	push   $0xa2
801070dd:	e9 6e f3 ff ff       	jmp    80106450 <alltraps>

801070e2 <vector163>:
801070e2:	6a 00                	push   $0x0
801070e4:	68 a3 00 00 00       	push   $0xa3
801070e9:	e9 62 f3 ff ff       	jmp    80106450 <alltraps>

801070ee <vector164>:
801070ee:	6a 00                	push   $0x0
801070f0:	68 a4 00 00 00       	push   $0xa4
801070f5:	e9 56 f3 ff ff       	jmp    80106450 <alltraps>

801070fa <vector165>:
801070fa:	6a 00                	push   $0x0
801070fc:	68 a5 00 00 00       	push   $0xa5
80107101:	e9 4a f3 ff ff       	jmp    80106450 <alltraps>

80107106 <vector166>:
80107106:	6a 00                	push   $0x0
80107108:	68 a6 00 00 00       	push   $0xa6
8010710d:	e9 3e f3 ff ff       	jmp    80106450 <alltraps>

80107112 <vector167>:
80107112:	6a 00                	push   $0x0
80107114:	68 a7 00 00 00       	push   $0xa7
80107119:	e9 32 f3 ff ff       	jmp    80106450 <alltraps>

8010711e <vector168>:
8010711e:	6a 00                	push   $0x0
80107120:	68 a8 00 00 00       	push   $0xa8
80107125:	e9 26 f3 ff ff       	jmp    80106450 <alltraps>

8010712a <vector169>:
8010712a:	6a 00                	push   $0x0
8010712c:	68 a9 00 00 00       	push   $0xa9
80107131:	e9 1a f3 ff ff       	jmp    80106450 <alltraps>

80107136 <vector170>:
80107136:	6a 00                	push   $0x0
80107138:	68 aa 00 00 00       	push   $0xaa
8010713d:	e9 0e f3 ff ff       	jmp    80106450 <alltraps>

80107142 <vector171>:
80107142:	6a 00                	push   $0x0
80107144:	68 ab 00 00 00       	push   $0xab
80107149:	e9 02 f3 ff ff       	jmp    80106450 <alltraps>

8010714e <vector172>:
8010714e:	6a 00                	push   $0x0
80107150:	68 ac 00 00 00       	push   $0xac
80107155:	e9 f6 f2 ff ff       	jmp    80106450 <alltraps>

8010715a <vector173>:
8010715a:	6a 00                	push   $0x0
8010715c:	68 ad 00 00 00       	push   $0xad
80107161:	e9 ea f2 ff ff       	jmp    80106450 <alltraps>

80107166 <vector174>:
80107166:	6a 00                	push   $0x0
80107168:	68 ae 00 00 00       	push   $0xae
8010716d:	e9 de f2 ff ff       	jmp    80106450 <alltraps>

80107172 <vector175>:
80107172:	6a 00                	push   $0x0
80107174:	68 af 00 00 00       	push   $0xaf
80107179:	e9 d2 f2 ff ff       	jmp    80106450 <alltraps>

8010717e <vector176>:
8010717e:	6a 00                	push   $0x0
80107180:	68 b0 00 00 00       	push   $0xb0
80107185:	e9 c6 f2 ff ff       	jmp    80106450 <alltraps>

8010718a <vector177>:
8010718a:	6a 00                	push   $0x0
8010718c:	68 b1 00 00 00       	push   $0xb1
80107191:	e9 ba f2 ff ff       	jmp    80106450 <alltraps>

80107196 <vector178>:
80107196:	6a 00                	push   $0x0
80107198:	68 b2 00 00 00       	push   $0xb2
8010719d:	e9 ae f2 ff ff       	jmp    80106450 <alltraps>

801071a2 <vector179>:
801071a2:	6a 00                	push   $0x0
801071a4:	68 b3 00 00 00       	push   $0xb3
801071a9:	e9 a2 f2 ff ff       	jmp    80106450 <alltraps>

801071ae <vector180>:
801071ae:	6a 00                	push   $0x0
801071b0:	68 b4 00 00 00       	push   $0xb4
801071b5:	e9 96 f2 ff ff       	jmp    80106450 <alltraps>

801071ba <vector181>:
801071ba:	6a 00                	push   $0x0
801071bc:	68 b5 00 00 00       	push   $0xb5
801071c1:	e9 8a f2 ff ff       	jmp    80106450 <alltraps>

801071c6 <vector182>:
801071c6:	6a 00                	push   $0x0
801071c8:	68 b6 00 00 00       	push   $0xb6
801071cd:	e9 7e f2 ff ff       	jmp    80106450 <alltraps>

801071d2 <vector183>:
801071d2:	6a 00                	push   $0x0
801071d4:	68 b7 00 00 00       	push   $0xb7
801071d9:	e9 72 f2 ff ff       	jmp    80106450 <alltraps>

801071de <vector184>:
801071de:	6a 00                	push   $0x0
801071e0:	68 b8 00 00 00       	push   $0xb8
801071e5:	e9 66 f2 ff ff       	jmp    80106450 <alltraps>

801071ea <vector185>:
801071ea:	6a 00                	push   $0x0
801071ec:	68 b9 00 00 00       	push   $0xb9
801071f1:	e9 5a f2 ff ff       	jmp    80106450 <alltraps>

801071f6 <vector186>:
801071f6:	6a 00                	push   $0x0
801071f8:	68 ba 00 00 00       	push   $0xba
801071fd:	e9 4e f2 ff ff       	jmp    80106450 <alltraps>

80107202 <vector187>:
80107202:	6a 00                	push   $0x0
80107204:	68 bb 00 00 00       	push   $0xbb
80107209:	e9 42 f2 ff ff       	jmp    80106450 <alltraps>

8010720e <vector188>:
8010720e:	6a 00                	push   $0x0
80107210:	68 bc 00 00 00       	push   $0xbc
80107215:	e9 36 f2 ff ff       	jmp    80106450 <alltraps>

8010721a <vector189>:
8010721a:	6a 00                	push   $0x0
8010721c:	68 bd 00 00 00       	push   $0xbd
80107221:	e9 2a f2 ff ff       	jmp    80106450 <alltraps>

80107226 <vector190>:
80107226:	6a 00                	push   $0x0
80107228:	68 be 00 00 00       	push   $0xbe
8010722d:	e9 1e f2 ff ff       	jmp    80106450 <alltraps>

80107232 <vector191>:
80107232:	6a 00                	push   $0x0
80107234:	68 bf 00 00 00       	push   $0xbf
80107239:	e9 12 f2 ff ff       	jmp    80106450 <alltraps>

8010723e <vector192>:
8010723e:	6a 00                	push   $0x0
80107240:	68 c0 00 00 00       	push   $0xc0
80107245:	e9 06 f2 ff ff       	jmp    80106450 <alltraps>

8010724a <vector193>:
8010724a:	6a 00                	push   $0x0
8010724c:	68 c1 00 00 00       	push   $0xc1
80107251:	e9 fa f1 ff ff       	jmp    80106450 <alltraps>

80107256 <vector194>:
80107256:	6a 00                	push   $0x0
80107258:	68 c2 00 00 00       	push   $0xc2
8010725d:	e9 ee f1 ff ff       	jmp    80106450 <alltraps>

80107262 <vector195>:
80107262:	6a 00                	push   $0x0
80107264:	68 c3 00 00 00       	push   $0xc3
80107269:	e9 e2 f1 ff ff       	jmp    80106450 <alltraps>

8010726e <vector196>:
8010726e:	6a 00                	push   $0x0
80107270:	68 c4 00 00 00       	push   $0xc4
80107275:	e9 d6 f1 ff ff       	jmp    80106450 <alltraps>

8010727a <vector197>:
8010727a:	6a 00                	push   $0x0
8010727c:	68 c5 00 00 00       	push   $0xc5
80107281:	e9 ca f1 ff ff       	jmp    80106450 <alltraps>

80107286 <vector198>:
80107286:	6a 00                	push   $0x0
80107288:	68 c6 00 00 00       	push   $0xc6
8010728d:	e9 be f1 ff ff       	jmp    80106450 <alltraps>

80107292 <vector199>:
80107292:	6a 00                	push   $0x0
80107294:	68 c7 00 00 00       	push   $0xc7
80107299:	e9 b2 f1 ff ff       	jmp    80106450 <alltraps>

8010729e <vector200>:
8010729e:	6a 00                	push   $0x0
801072a0:	68 c8 00 00 00       	push   $0xc8
801072a5:	e9 a6 f1 ff ff       	jmp    80106450 <alltraps>

801072aa <vector201>:
801072aa:	6a 00                	push   $0x0
801072ac:	68 c9 00 00 00       	push   $0xc9
801072b1:	e9 9a f1 ff ff       	jmp    80106450 <alltraps>

801072b6 <vector202>:
801072b6:	6a 00                	push   $0x0
801072b8:	68 ca 00 00 00       	push   $0xca
801072bd:	e9 8e f1 ff ff       	jmp    80106450 <alltraps>

801072c2 <vector203>:
801072c2:	6a 00                	push   $0x0
801072c4:	68 cb 00 00 00       	push   $0xcb
801072c9:	e9 82 f1 ff ff       	jmp    80106450 <alltraps>

801072ce <vector204>:
801072ce:	6a 00                	push   $0x0
801072d0:	68 cc 00 00 00       	push   $0xcc
801072d5:	e9 76 f1 ff ff       	jmp    80106450 <alltraps>

801072da <vector205>:
801072da:	6a 00                	push   $0x0
801072dc:	68 cd 00 00 00       	push   $0xcd
801072e1:	e9 6a f1 ff ff       	jmp    80106450 <alltraps>

801072e6 <vector206>:
801072e6:	6a 00                	push   $0x0
801072e8:	68 ce 00 00 00       	push   $0xce
801072ed:	e9 5e f1 ff ff       	jmp    80106450 <alltraps>

801072f2 <vector207>:
801072f2:	6a 00                	push   $0x0
801072f4:	68 cf 00 00 00       	push   $0xcf
801072f9:	e9 52 f1 ff ff       	jmp    80106450 <alltraps>

801072fe <vector208>:
801072fe:	6a 00                	push   $0x0
80107300:	68 d0 00 00 00       	push   $0xd0
80107305:	e9 46 f1 ff ff       	jmp    80106450 <alltraps>

8010730a <vector209>:
8010730a:	6a 00                	push   $0x0
8010730c:	68 d1 00 00 00       	push   $0xd1
80107311:	e9 3a f1 ff ff       	jmp    80106450 <alltraps>

80107316 <vector210>:
80107316:	6a 00                	push   $0x0
80107318:	68 d2 00 00 00       	push   $0xd2
8010731d:	e9 2e f1 ff ff       	jmp    80106450 <alltraps>

80107322 <vector211>:
80107322:	6a 00                	push   $0x0
80107324:	68 d3 00 00 00       	push   $0xd3
80107329:	e9 22 f1 ff ff       	jmp    80106450 <alltraps>

8010732e <vector212>:
8010732e:	6a 00                	push   $0x0
80107330:	68 d4 00 00 00       	push   $0xd4
80107335:	e9 16 f1 ff ff       	jmp    80106450 <alltraps>

8010733a <vector213>:
8010733a:	6a 00                	push   $0x0
8010733c:	68 d5 00 00 00       	push   $0xd5
80107341:	e9 0a f1 ff ff       	jmp    80106450 <alltraps>

80107346 <vector214>:
80107346:	6a 00                	push   $0x0
80107348:	68 d6 00 00 00       	push   $0xd6
8010734d:	e9 fe f0 ff ff       	jmp    80106450 <alltraps>

80107352 <vector215>:
80107352:	6a 00                	push   $0x0
80107354:	68 d7 00 00 00       	push   $0xd7
80107359:	e9 f2 f0 ff ff       	jmp    80106450 <alltraps>

8010735e <vector216>:
8010735e:	6a 00                	push   $0x0
80107360:	68 d8 00 00 00       	push   $0xd8
80107365:	e9 e6 f0 ff ff       	jmp    80106450 <alltraps>

8010736a <vector217>:
8010736a:	6a 00                	push   $0x0
8010736c:	68 d9 00 00 00       	push   $0xd9
80107371:	e9 da f0 ff ff       	jmp    80106450 <alltraps>

80107376 <vector218>:
80107376:	6a 00                	push   $0x0
80107378:	68 da 00 00 00       	push   $0xda
8010737d:	e9 ce f0 ff ff       	jmp    80106450 <alltraps>

80107382 <vector219>:
80107382:	6a 00                	push   $0x0
80107384:	68 db 00 00 00       	push   $0xdb
80107389:	e9 c2 f0 ff ff       	jmp    80106450 <alltraps>

8010738e <vector220>:
8010738e:	6a 00                	push   $0x0
80107390:	68 dc 00 00 00       	push   $0xdc
80107395:	e9 b6 f0 ff ff       	jmp    80106450 <alltraps>

8010739a <vector221>:
8010739a:	6a 00                	push   $0x0
8010739c:	68 dd 00 00 00       	push   $0xdd
801073a1:	e9 aa f0 ff ff       	jmp    80106450 <alltraps>

801073a6 <vector222>:
801073a6:	6a 00                	push   $0x0
801073a8:	68 de 00 00 00       	push   $0xde
801073ad:	e9 9e f0 ff ff       	jmp    80106450 <alltraps>

801073b2 <vector223>:
801073b2:	6a 00                	push   $0x0
801073b4:	68 df 00 00 00       	push   $0xdf
801073b9:	e9 92 f0 ff ff       	jmp    80106450 <alltraps>

801073be <vector224>:
801073be:	6a 00                	push   $0x0
801073c0:	68 e0 00 00 00       	push   $0xe0
801073c5:	e9 86 f0 ff ff       	jmp    80106450 <alltraps>

801073ca <vector225>:
801073ca:	6a 00                	push   $0x0
801073cc:	68 e1 00 00 00       	push   $0xe1
801073d1:	e9 7a f0 ff ff       	jmp    80106450 <alltraps>

801073d6 <vector226>:
801073d6:	6a 00                	push   $0x0
801073d8:	68 e2 00 00 00       	push   $0xe2
801073dd:	e9 6e f0 ff ff       	jmp    80106450 <alltraps>

801073e2 <vector227>:
801073e2:	6a 00                	push   $0x0
801073e4:	68 e3 00 00 00       	push   $0xe3
801073e9:	e9 62 f0 ff ff       	jmp    80106450 <alltraps>

801073ee <vector228>:
801073ee:	6a 00                	push   $0x0
801073f0:	68 e4 00 00 00       	push   $0xe4
801073f5:	e9 56 f0 ff ff       	jmp    80106450 <alltraps>

801073fa <vector229>:
801073fa:	6a 00                	push   $0x0
801073fc:	68 e5 00 00 00       	push   $0xe5
80107401:	e9 4a f0 ff ff       	jmp    80106450 <alltraps>

80107406 <vector230>:
80107406:	6a 00                	push   $0x0
80107408:	68 e6 00 00 00       	push   $0xe6
8010740d:	e9 3e f0 ff ff       	jmp    80106450 <alltraps>

80107412 <vector231>:
80107412:	6a 00                	push   $0x0
80107414:	68 e7 00 00 00       	push   $0xe7
80107419:	e9 32 f0 ff ff       	jmp    80106450 <alltraps>

8010741e <vector232>:
8010741e:	6a 00                	push   $0x0
80107420:	68 e8 00 00 00       	push   $0xe8
80107425:	e9 26 f0 ff ff       	jmp    80106450 <alltraps>

8010742a <vector233>:
8010742a:	6a 00                	push   $0x0
8010742c:	68 e9 00 00 00       	push   $0xe9
80107431:	e9 1a f0 ff ff       	jmp    80106450 <alltraps>

80107436 <vector234>:
80107436:	6a 00                	push   $0x0
80107438:	68 ea 00 00 00       	push   $0xea
8010743d:	e9 0e f0 ff ff       	jmp    80106450 <alltraps>

80107442 <vector235>:
80107442:	6a 00                	push   $0x0
80107444:	68 eb 00 00 00       	push   $0xeb
80107449:	e9 02 f0 ff ff       	jmp    80106450 <alltraps>

8010744e <vector236>:
8010744e:	6a 00                	push   $0x0
80107450:	68 ec 00 00 00       	push   $0xec
80107455:	e9 f6 ef ff ff       	jmp    80106450 <alltraps>

8010745a <vector237>:
8010745a:	6a 00                	push   $0x0
8010745c:	68 ed 00 00 00       	push   $0xed
80107461:	e9 ea ef ff ff       	jmp    80106450 <alltraps>

80107466 <vector238>:
80107466:	6a 00                	push   $0x0
80107468:	68 ee 00 00 00       	push   $0xee
8010746d:	e9 de ef ff ff       	jmp    80106450 <alltraps>

80107472 <vector239>:
80107472:	6a 00                	push   $0x0
80107474:	68 ef 00 00 00       	push   $0xef
80107479:	e9 d2 ef ff ff       	jmp    80106450 <alltraps>

8010747e <vector240>:
8010747e:	6a 00                	push   $0x0
80107480:	68 f0 00 00 00       	push   $0xf0
80107485:	e9 c6 ef ff ff       	jmp    80106450 <alltraps>

8010748a <vector241>:
8010748a:	6a 00                	push   $0x0
8010748c:	68 f1 00 00 00       	push   $0xf1
80107491:	e9 ba ef ff ff       	jmp    80106450 <alltraps>

80107496 <vector242>:
80107496:	6a 00                	push   $0x0
80107498:	68 f2 00 00 00       	push   $0xf2
8010749d:	e9 ae ef ff ff       	jmp    80106450 <alltraps>

801074a2 <vector243>:
801074a2:	6a 00                	push   $0x0
801074a4:	68 f3 00 00 00       	push   $0xf3
801074a9:	e9 a2 ef ff ff       	jmp    80106450 <alltraps>

801074ae <vector244>:
801074ae:	6a 00                	push   $0x0
801074b0:	68 f4 00 00 00       	push   $0xf4
801074b5:	e9 96 ef ff ff       	jmp    80106450 <alltraps>

801074ba <vector245>:
801074ba:	6a 00                	push   $0x0
801074bc:	68 f5 00 00 00       	push   $0xf5
801074c1:	e9 8a ef ff ff       	jmp    80106450 <alltraps>

801074c6 <vector246>:
801074c6:	6a 00                	push   $0x0
801074c8:	68 f6 00 00 00       	push   $0xf6
801074cd:	e9 7e ef ff ff       	jmp    80106450 <alltraps>

801074d2 <vector247>:
801074d2:	6a 00                	push   $0x0
801074d4:	68 f7 00 00 00       	push   $0xf7
801074d9:	e9 72 ef ff ff       	jmp    80106450 <alltraps>

801074de <vector248>:
801074de:	6a 00                	push   $0x0
801074e0:	68 f8 00 00 00       	push   $0xf8
801074e5:	e9 66 ef ff ff       	jmp    80106450 <alltraps>

801074ea <vector249>:
801074ea:	6a 00                	push   $0x0
801074ec:	68 f9 00 00 00       	push   $0xf9
801074f1:	e9 5a ef ff ff       	jmp    80106450 <alltraps>

801074f6 <vector250>:
801074f6:	6a 00                	push   $0x0
801074f8:	68 fa 00 00 00       	push   $0xfa
801074fd:	e9 4e ef ff ff       	jmp    80106450 <alltraps>

80107502 <vector251>:
80107502:	6a 00                	push   $0x0
80107504:	68 fb 00 00 00       	push   $0xfb
80107509:	e9 42 ef ff ff       	jmp    80106450 <alltraps>

8010750e <vector252>:
8010750e:	6a 00                	push   $0x0
80107510:	68 fc 00 00 00       	push   $0xfc
80107515:	e9 36 ef ff ff       	jmp    80106450 <alltraps>

8010751a <vector253>:
8010751a:	6a 00                	push   $0x0
8010751c:	68 fd 00 00 00       	push   $0xfd
80107521:	e9 2a ef ff ff       	jmp    80106450 <alltraps>

80107526 <vector254>:
80107526:	6a 00                	push   $0x0
80107528:	68 fe 00 00 00       	push   $0xfe
8010752d:	e9 1e ef ff ff       	jmp    80106450 <alltraps>

80107532 <vector255>:
80107532:	6a 00                	push   $0x0
80107534:	68 ff 00 00 00       	push   $0xff
80107539:	e9 12 ef ff ff       	jmp    80106450 <alltraps>
	...

80107540 <lgdt>:

struct segdesc;

static inline void
lgdt(struct segdesc *p, int size)
{
80107540:	55                   	push   %ebp
80107541:	89 e5                	mov    %esp,%ebp
80107543:	83 ec 10             	sub    $0x10,%esp
  volatile ushort pd[3];

  pd[0] = size-1;
80107546:	8b 45 0c             	mov    0xc(%ebp),%eax
80107549:	83 e8 01             	sub    $0x1,%eax
8010754c:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80107550:	8b 45 08             	mov    0x8(%ebp),%eax
80107553:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80107557:	8b 45 08             	mov    0x8(%ebp),%eax
8010755a:	c1 e8 10             	shr    $0x10,%eax
8010755d:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80107561:	8d 45 fa             	lea    -0x6(%ebp),%eax
80107564:	0f 01 10             	lgdtl  (%eax)
}
80107567:	c9                   	leave  
80107568:	c3                   	ret    

80107569 <ltr>:
  asm volatile("lidt (%0)" : : "r" (pd));
}

static inline void
ltr(ushort sel)
{
80107569:	55                   	push   %ebp
8010756a:	89 e5                	mov    %esp,%ebp
8010756c:	83 ec 04             	sub    $0x4,%esp
8010756f:	8b 45 08             	mov    0x8(%ebp),%eax
80107572:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  asm volatile("ltr %0" : : "r" (sel));
80107576:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
8010757a:	0f 00 d8             	ltr    %ax
}
8010757d:	c9                   	leave  
8010757e:	c3                   	ret    

8010757f <loadgs>:
  return eflags;
}

static inline void
loadgs(ushort v)
{
8010757f:	55                   	push   %ebp
80107580:	89 e5                	mov    %esp,%ebp
80107582:	83 ec 04             	sub    $0x4,%esp
80107585:	8b 45 08             	mov    0x8(%ebp),%eax
80107588:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  asm volatile("movw %0, %%gs" : : "r" (v));
8010758c:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
80107590:	8e e8                	mov    %eax,%gs
}
80107592:	c9                   	leave  
80107593:	c3                   	ret    

80107594 <lcr3>:
  return val;
}

static inline void
lcr3(uint val) 
{
80107594:	55                   	push   %ebp
80107595:	89 e5                	mov    %esp,%ebp
  asm volatile("movl %0,%%cr3" : : "r" (val));
80107597:	8b 45 08             	mov    0x8(%ebp),%eax
8010759a:	0f 22 d8             	mov    %eax,%cr3
}
8010759d:	5d                   	pop    %ebp
8010759e:	c3                   	ret    

8010759f <v2p>:
#define KERNBASE 0x80000000         // First kernel virtual address
#define KERNLINK (KERNBASE+EXTMEM)  // Address where kernel is linked

#ifndef __ASSEMBLER__

static inline uint v2p(void *a) { return ((uint) (a))  - KERNBASE; }
8010759f:	55                   	push   %ebp
801075a0:	89 e5                	mov    %esp,%ebp
801075a2:	8b 45 08             	mov    0x8(%ebp),%eax
801075a5:	2d 00 00 00 80       	sub    $0x80000000,%eax
801075aa:	5d                   	pop    %ebp
801075ab:	c3                   	ret    

801075ac <p2v>:
static inline void *p2v(uint a) { return (void *) ((a) + KERNBASE); }
801075ac:	55                   	push   %ebp
801075ad:	89 e5                	mov    %esp,%ebp
801075af:	8b 45 08             	mov    0x8(%ebp),%eax
801075b2:	2d 00 00 00 80       	sub    $0x80000000,%eax
801075b7:	5d                   	pop    %ebp
801075b8:	c3                   	ret    

801075b9 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
801075b9:	55                   	push   %ebp
801075ba:	89 e5                	mov    %esp,%ebp
801075bc:	53                   	push   %ebx
801075bd:	83 ec 24             	sub    $0x24,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
801075c0:	e8 b3 b8 ff ff       	call   80102e78 <cpunum>
801075c5:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
801075cb:	05 40 f9 10 80       	add    $0x8010f940,%eax
801075d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801075d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801075d6:	66 c7 40 78 ff ff    	movw   $0xffff,0x78(%eax)
801075dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801075df:	66 c7 40 7a 00 00    	movw   $0x0,0x7a(%eax)
801075e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
801075e8:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
801075ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
801075ef:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
801075f3:	83 e2 f0             	and    $0xfffffff0,%edx
801075f6:	83 ca 0a             	or     $0xa,%edx
801075f9:	88 50 7d             	mov    %dl,0x7d(%eax)
801075fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801075ff:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
80107603:	83 ca 10             	or     $0x10,%edx
80107606:	88 50 7d             	mov    %dl,0x7d(%eax)
80107609:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010760c:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
80107610:	83 e2 9f             	and    $0xffffff9f,%edx
80107613:	88 50 7d             	mov    %dl,0x7d(%eax)
80107616:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107619:	0f b6 50 7d          	movzbl 0x7d(%eax),%edx
8010761d:	83 ca 80             	or     $0xffffff80,%edx
80107620:	88 50 7d             	mov    %dl,0x7d(%eax)
80107623:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107626:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
8010762a:	83 ca 0f             	or     $0xf,%edx
8010762d:	88 50 7e             	mov    %dl,0x7e(%eax)
80107630:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107633:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80107637:	83 e2 ef             	and    $0xffffffef,%edx
8010763a:	88 50 7e             	mov    %dl,0x7e(%eax)
8010763d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107640:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80107644:	83 e2 df             	and    $0xffffffdf,%edx
80107647:	88 50 7e             	mov    %dl,0x7e(%eax)
8010764a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010764d:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
80107651:	83 ca 40             	or     $0x40,%edx
80107654:	88 50 7e             	mov    %dl,0x7e(%eax)
80107657:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010765a:	0f b6 50 7e          	movzbl 0x7e(%eax),%edx
8010765e:	83 ca 80             	or     $0xffffff80,%edx
80107661:	88 50 7e             	mov    %dl,0x7e(%eax)
80107664:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107667:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010766b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010766e:	66 c7 80 80 00 00 00 	movw   $0xffff,0x80(%eax)
80107675:	ff ff 
80107677:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010767a:	66 c7 80 82 00 00 00 	movw   $0x0,0x82(%eax)
80107681:	00 00 
80107683:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107686:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
8010768d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107690:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
80107697:	83 e2 f0             	and    $0xfffffff0,%edx
8010769a:	83 ca 02             	or     $0x2,%edx
8010769d:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
801076a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076a6:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
801076ad:	83 ca 10             	or     $0x10,%edx
801076b0:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
801076b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076b9:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
801076c0:	83 e2 9f             	and    $0xffffff9f,%edx
801076c3:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
801076c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076cc:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
801076d3:	83 ca 80             	or     $0xffffff80,%edx
801076d6:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
801076dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076df:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
801076e6:	83 ca 0f             	or     $0xf,%edx
801076e9:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
801076ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
801076f2:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
801076f9:	83 e2 ef             	and    $0xffffffef,%edx
801076fc:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
80107702:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107705:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
8010770c:	83 e2 df             	and    $0xffffffdf,%edx
8010770f:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
80107715:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107718:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
8010771f:	83 ca 40             	or     $0x40,%edx
80107722:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
80107728:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010772b:	0f b6 90 86 00 00 00 	movzbl 0x86(%eax),%edx
80107732:	83 ca 80             	or     $0xffffff80,%edx
80107735:	88 90 86 00 00 00    	mov    %dl,0x86(%eax)
8010773b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010773e:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80107745:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107748:	66 c7 80 90 00 00 00 	movw   $0xffff,0x90(%eax)
8010774f:	ff ff 
80107751:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107754:	66 c7 80 92 00 00 00 	movw   $0x0,0x92(%eax)
8010775b:	00 00 
8010775d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107760:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
80107767:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010776a:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
80107771:	83 e2 f0             	and    $0xfffffff0,%edx
80107774:	83 ca 0a             	or     $0xa,%edx
80107777:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
8010777d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107780:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
80107787:	83 ca 10             	or     $0x10,%edx
8010778a:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
80107790:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107793:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
8010779a:	83 ca 60             	or     $0x60,%edx
8010779d:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
801077a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077a6:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
801077ad:	83 ca 80             	or     $0xffffff80,%edx
801077b0:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
801077b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077b9:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801077c0:	83 ca 0f             	or     $0xf,%edx
801077c3:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801077c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077cc:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801077d3:	83 e2 ef             	and    $0xffffffef,%edx
801077d6:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801077dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077df:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801077e6:	83 e2 df             	and    $0xffffffdf,%edx
801077e9:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
801077ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
801077f2:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
801077f9:	83 ca 40             	or     $0x40,%edx
801077fc:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
80107802:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107805:	0f b6 90 96 00 00 00 	movzbl 0x96(%eax),%edx
8010780c:	83 ca 80             	or     $0xffffff80,%edx
8010780f:	88 90 96 00 00 00    	mov    %dl,0x96(%eax)
80107815:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107818:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
8010781f:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107822:	66 c7 80 98 00 00 00 	movw   $0xffff,0x98(%eax)
80107829:	ff ff 
8010782b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010782e:	66 c7 80 9a 00 00 00 	movw   $0x0,0x9a(%eax)
80107835:	00 00 
80107837:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010783a:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
80107841:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107844:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
8010784b:	83 e2 f0             	and    $0xfffffff0,%edx
8010784e:	83 ca 02             	or     $0x2,%edx
80107851:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
80107857:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010785a:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80107861:	83 ca 10             	or     $0x10,%edx
80107864:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
8010786a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010786d:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80107874:	83 ca 60             	or     $0x60,%edx
80107877:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
8010787d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107880:	0f b6 90 9d 00 00 00 	movzbl 0x9d(%eax),%edx
80107887:	83 ca 80             	or     $0xffffff80,%edx
8010788a:	88 90 9d 00 00 00    	mov    %dl,0x9d(%eax)
80107890:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107893:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
8010789a:	83 ca 0f             	or     $0xf,%edx
8010789d:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
801078a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078a6:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
801078ad:	83 e2 ef             	and    $0xffffffef,%edx
801078b0:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
801078b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078b9:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
801078c0:	83 e2 df             	and    $0xffffffdf,%edx
801078c3:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
801078c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078cc:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
801078d3:	83 ca 40             	or     $0x40,%edx
801078d6:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
801078dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078df:	0f b6 90 9e 00 00 00 	movzbl 0x9e(%eax),%edx
801078e6:	83 ca 80             	or     $0xffffff80,%edx
801078e9:	88 90 9e 00 00 00    	mov    %dl,0x9e(%eax)
801078ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078f2:	c6 80 9f 00 00 00 00 	movb   $0x0,0x9f(%eax)

  // Map cpu, and curproc
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
801078f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
801078fc:	05 b4 00 00 00       	add    $0xb4,%eax
80107901:	89 c3                	mov    %eax,%ebx
80107903:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107906:	05 b4 00 00 00       	add    $0xb4,%eax
8010790b:	c1 e8 10             	shr    $0x10,%eax
8010790e:	89 c1                	mov    %eax,%ecx
80107910:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107913:	05 b4 00 00 00       	add    $0xb4,%eax
80107918:	c1 e8 18             	shr    $0x18,%eax
8010791b:	89 c2                	mov    %eax,%edx
8010791d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107920:	66 c7 80 88 00 00 00 	movw   $0x0,0x88(%eax)
80107927:	00 00 
80107929:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010792c:	66 89 98 8a 00 00 00 	mov    %bx,0x8a(%eax)
80107933:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107936:	88 88 8c 00 00 00    	mov    %cl,0x8c(%eax)
8010793c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010793f:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
80107946:	83 e1 f0             	and    $0xfffffff0,%ecx
80107949:	83 c9 02             	or     $0x2,%ecx
8010794c:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107952:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107955:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
8010795c:	83 c9 10             	or     $0x10,%ecx
8010795f:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107965:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107968:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
8010796f:	83 e1 9f             	and    $0xffffff9f,%ecx
80107972:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
80107978:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010797b:	0f b6 88 8d 00 00 00 	movzbl 0x8d(%eax),%ecx
80107982:	83 c9 80             	or     $0xffffff80,%ecx
80107985:	88 88 8d 00 00 00    	mov    %cl,0x8d(%eax)
8010798b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010798e:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
80107995:	83 e1 f0             	and    $0xfffffff0,%ecx
80107998:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
8010799e:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079a1:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
801079a8:	83 e1 ef             	and    $0xffffffef,%ecx
801079ab:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
801079b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079b4:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
801079bb:	83 e1 df             	and    $0xffffffdf,%ecx
801079be:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
801079c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079c7:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
801079ce:	83 c9 40             	or     $0x40,%ecx
801079d1:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
801079d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079da:	0f b6 88 8e 00 00 00 	movzbl 0x8e(%eax),%ecx
801079e1:	83 c9 80             	or     $0xffffff80,%ecx
801079e4:	88 88 8e 00 00 00    	mov    %cl,0x8e(%eax)
801079ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079ed:	88 90 8f 00 00 00    	mov    %dl,0x8f(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
801079f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801079f6:	83 c0 70             	add    $0x70,%eax
801079f9:	c7 44 24 04 38 00 00 	movl   $0x38,0x4(%esp)
80107a00:	00 
80107a01:	89 04 24             	mov    %eax,(%esp)
80107a04:	e8 37 fb ff ff       	call   80107540 <lgdt>
  loadgs(SEG_KCPU << 3);
80107a09:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
80107a10:	e8 6a fb ff ff       	call   8010757f <loadgs>
  
  // Initialize cpu-local storage.
  cpu = c;
80107a15:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a18:	65 a3 00 00 00 00    	mov    %eax,%gs:0x0
  proc = 0;
80107a1e:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80107a25:	00 00 00 00 
}
80107a29:	83 c4 24             	add    $0x24,%esp
80107a2c:	5b                   	pop    %ebx
80107a2d:	5d                   	pop    %ebp
80107a2e:	c3                   	ret    

80107a2f <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80107a2f:	55                   	push   %ebp
80107a30:	89 e5                	mov    %esp,%ebp
80107a32:	83 ec 28             	sub    $0x28,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80107a35:	8b 45 0c             	mov    0xc(%ebp),%eax
80107a38:	c1 e8 16             	shr    $0x16,%eax
80107a3b:	c1 e0 02             	shl    $0x2,%eax
80107a3e:	03 45 08             	add    0x8(%ebp),%eax
80107a41:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(*pde & PTE_P){
80107a44:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107a47:	8b 00                	mov    (%eax),%eax
80107a49:	83 e0 01             	and    $0x1,%eax
80107a4c:	84 c0                	test   %al,%al
80107a4e:	74 17                	je     80107a67 <walkpgdir+0x38>
    pgtab = (pte_t*)p2v(PTE_ADDR(*pde));
80107a50:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107a53:	8b 00                	mov    (%eax),%eax
80107a55:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107a5a:	89 04 24             	mov    %eax,(%esp)
80107a5d:	e8 4a fb ff ff       	call   801075ac <p2v>
80107a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107a65:	eb 4b                	jmp    80107ab2 <walkpgdir+0x83>
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80107a67:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80107a6b:	74 0e                	je     80107a7b <walkpgdir+0x4c>
80107a6d:	e8 8c b0 ff ff       	call   80102afe <kalloc>
80107a72:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107a75:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80107a79:	75 07                	jne    80107a82 <walkpgdir+0x53>
      return 0;
80107a7b:	b8 00 00 00 00       	mov    $0x0,%eax
80107a80:	eb 41                	jmp    80107ac3 <walkpgdir+0x94>
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
80107a82:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107a89:	00 
80107a8a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107a91:	00 
80107a92:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107a95:	89 04 24             	mov    %eax,(%esp)
80107a98:	e8 29 d5 ff ff       	call   80104fc6 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table 
    // entries, if necessary.
    *pde = v2p(pgtab) | PTE_P | PTE_W | PTE_U;
80107a9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107aa0:	89 04 24             	mov    %eax,(%esp)
80107aa3:	e8 f7 fa ff ff       	call   8010759f <v2p>
80107aa8:	89 c2                	mov    %eax,%edx
80107aaa:	83 ca 07             	or     $0x7,%edx
80107aad:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107ab0:	89 10                	mov    %edx,(%eax)
  }
  return &pgtab[PTX(va)];
80107ab2:	8b 45 0c             	mov    0xc(%ebp),%eax
80107ab5:	c1 e8 0c             	shr    $0xc,%eax
80107ab8:	25 ff 03 00 00       	and    $0x3ff,%eax
80107abd:	c1 e0 02             	shl    $0x2,%eax
80107ac0:	03 45 f4             	add    -0xc(%ebp),%eax
}
80107ac3:	c9                   	leave  
80107ac4:	c3                   	ret    

80107ac5 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80107ac5:	55                   	push   %ebp
80107ac6:	89 e5                	mov    %esp,%ebp
80107ac8:	83 ec 28             	sub    $0x28,%esp
  char *a, *last;
  pte_t *pte;
  
  a = (char*)PGROUNDDOWN((uint)va);
80107acb:	8b 45 0c             	mov    0xc(%ebp),%eax
80107ace:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107ad3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80107ad6:	8b 45 0c             	mov    0xc(%ebp),%eax
80107ad9:	03 45 10             	add    0x10(%ebp),%eax
80107adc:	83 e8 01             	sub    $0x1,%eax
80107adf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107ae4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80107ae7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
80107aee:	00 
80107aef:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107af2:	89 44 24 04          	mov    %eax,0x4(%esp)
80107af6:	8b 45 08             	mov    0x8(%ebp),%eax
80107af9:	89 04 24             	mov    %eax,(%esp)
80107afc:	e8 2e ff ff ff       	call   80107a2f <walkpgdir>
80107b01:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107b04:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80107b08:	75 07                	jne    80107b11 <mappages+0x4c>
      return -1;
80107b0a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107b0f:	eb 46                	jmp    80107b57 <mappages+0x92>
    if(*pte & PTE_P)
80107b11:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b14:	8b 00                	mov    (%eax),%eax
80107b16:	83 e0 01             	and    $0x1,%eax
80107b19:	84 c0                	test   %al,%al
80107b1b:	74 0c                	je     80107b29 <mappages+0x64>
      panic("remap");
80107b1d:	c7 04 24 40 89 10 80 	movl   $0x80108940,(%esp)
80107b24:	e8 11 8a ff ff       	call   8010053a <panic>
    *pte = pa | perm | PTE_P;
80107b29:	8b 45 18             	mov    0x18(%ebp),%eax
80107b2c:	0b 45 14             	or     0x14(%ebp),%eax
80107b2f:	89 c2                	mov    %eax,%edx
80107b31:	83 ca 01             	or     $0x1,%edx
80107b34:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107b37:	89 10                	mov    %edx,(%eax)
    if(a == last)
80107b39:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107b3c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80107b3f:	74 10                	je     80107b51 <mappages+0x8c>
      break;
    a += PGSIZE;
80107b41:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
    pa += PGSIZE;
80107b48:	81 45 14 00 10 00 00 	addl   $0x1000,0x14(%ebp)
  }
80107b4f:	eb 96                	jmp    80107ae7 <mappages+0x22>
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
    if(a == last)
      break;
80107b51:	90                   	nop
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
80107b52:	b8 00 00 00 00       	mov    $0x0,%eax
}
80107b57:	c9                   	leave  
80107b58:	c3                   	ret    

80107b59 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80107b59:	55                   	push   %ebp
80107b5a:	89 e5                	mov    %esp,%ebp
80107b5c:	53                   	push   %ebx
80107b5d:	83 ec 34             	sub    $0x34,%esp
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80107b60:	e8 99 af ff ff       	call   80102afe <kalloc>
80107b65:	89 45 f0             	mov    %eax,-0x10(%ebp)
80107b68:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80107b6c:	75 0a                	jne    80107b78 <setupkvm+0x1f>
    return 0;
80107b6e:	b8 00 00 00 00       	mov    $0x0,%eax
80107b73:	e9 99 00 00 00       	jmp    80107c11 <setupkvm+0xb8>
  memset(pgdir, 0, PGSIZE);
80107b78:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107b7f:	00 
80107b80:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107b87:	00 
80107b88:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107b8b:	89 04 24             	mov    %eax,(%esp)
80107b8e:	e8 33 d4 ff ff       	call   80104fc6 <memset>
  if (p2v(PHYSTOP) > (void*)DEVSPACE)
80107b93:	c7 04 24 00 00 00 0e 	movl   $0xe000000,(%esp)
80107b9a:	e8 0d fa ff ff       	call   801075ac <p2v>
80107b9f:	3d 00 00 00 fe       	cmp    $0xfe000000,%eax
80107ba4:	76 0c                	jbe    80107bb2 <setupkvm+0x59>
    panic("PHYSTOP too high");
80107ba6:	c7 04 24 46 89 10 80 	movl   $0x80108946,(%esp)
80107bad:	e8 88 89 ff ff       	call   8010053a <panic>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107bb2:	c7 45 f4 c0 b4 10 80 	movl   $0x8010b4c0,-0xc(%ebp)
80107bb9:	eb 49                	jmp    80107c04 <setupkvm+0xab>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start, 
80107bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107bbe:	8b 48 0c             	mov    0xc(%eax),%ecx
80107bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107bc4:	8b 50 04             	mov    0x4(%eax),%edx
80107bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107bca:	8b 58 08             	mov    0x8(%eax),%ebx
80107bcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107bd0:	8b 40 04             	mov    0x4(%eax),%eax
80107bd3:	29 c3                	sub    %eax,%ebx
80107bd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107bd8:	8b 00                	mov    (%eax),%eax
80107bda:	89 4c 24 10          	mov    %ecx,0x10(%esp)
80107bde:	89 54 24 0c          	mov    %edx,0xc(%esp)
80107be2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80107be6:	89 44 24 04          	mov    %eax,0x4(%esp)
80107bea:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107bed:	89 04 24             	mov    %eax,(%esp)
80107bf0:	e8 d0 fe ff ff       	call   80107ac5 <mappages>
80107bf5:	85 c0                	test   %eax,%eax
80107bf7:	79 07                	jns    80107c00 <setupkvm+0xa7>
                (uint)k->phys_start, k->perm) < 0)
      return 0;
80107bf9:	b8 00 00 00 00       	mov    $0x0,%eax
80107bfe:	eb 11                	jmp    80107c11 <setupkvm+0xb8>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (p2v(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107c00:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
80107c04:	b8 00 b5 10 80       	mov    $0x8010b500,%eax
80107c09:	39 45 f4             	cmp    %eax,-0xc(%ebp)
80107c0c:	72 ad                	jb     80107bbb <setupkvm+0x62>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start, 
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
80107c0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
80107c11:	83 c4 34             	add    $0x34,%esp
80107c14:	5b                   	pop    %ebx
80107c15:	5d                   	pop    %ebp
80107c16:	c3                   	ret    

80107c17 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80107c17:	55                   	push   %ebp
80107c18:	89 e5                	mov    %esp,%ebp
80107c1a:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107c1d:	e8 37 ff ff ff       	call   80107b59 <setupkvm>
80107c22:	a3 18 29 11 80       	mov    %eax,0x80112918
  switchkvm();
80107c27:	e8 02 00 00 00       	call   80107c2e <switchkvm>
}
80107c2c:	c9                   	leave  
80107c2d:	c3                   	ret    

80107c2e <switchkvm>:

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80107c2e:	55                   	push   %ebp
80107c2f:	89 e5                	mov    %esp,%ebp
80107c31:	83 ec 04             	sub    $0x4,%esp
  lcr3(v2p(kpgdir));   // switch to the kernel page table
80107c34:	a1 18 29 11 80       	mov    0x80112918,%eax
80107c39:	89 04 24             	mov    %eax,(%esp)
80107c3c:	e8 5e f9 ff ff       	call   8010759f <v2p>
80107c41:	89 04 24             	mov    %eax,(%esp)
80107c44:	e8 4b f9 ff ff       	call   80107594 <lcr3>
}
80107c49:	c9                   	leave  
80107c4a:	c3                   	ret    

80107c4b <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80107c4b:	55                   	push   %ebp
80107c4c:	89 e5                	mov    %esp,%ebp
80107c4e:	53                   	push   %ebx
80107c4f:	83 ec 14             	sub    $0x14,%esp
  pushcli();
80107c52:	e8 69 d2 ff ff       	call   80104ec0 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80107c57:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107c5d:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80107c64:	83 c2 08             	add    $0x8,%edx
80107c67:	89 d3                	mov    %edx,%ebx
80107c69:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80107c70:	83 c2 08             	add    $0x8,%edx
80107c73:	c1 ea 10             	shr    $0x10,%edx
80107c76:	89 d1                	mov    %edx,%ecx
80107c78:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80107c7f:	83 c2 08             	add    $0x8,%edx
80107c82:	c1 ea 18             	shr    $0x18,%edx
80107c85:	66 c7 80 a0 00 00 00 	movw   $0x67,0xa0(%eax)
80107c8c:	67 00 
80107c8e:	66 89 98 a2 00 00 00 	mov    %bx,0xa2(%eax)
80107c95:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
80107c9b:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107ca2:	83 e1 f0             	and    $0xfffffff0,%ecx
80107ca5:	83 c9 09             	or     $0x9,%ecx
80107ca8:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107cae:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107cb5:	83 c9 10             	or     $0x10,%ecx
80107cb8:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107cbe:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107cc5:	83 e1 9f             	and    $0xffffff9f,%ecx
80107cc8:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107cce:	0f b6 88 a5 00 00 00 	movzbl 0xa5(%eax),%ecx
80107cd5:	83 c9 80             	or     $0xffffff80,%ecx
80107cd8:	88 88 a5 00 00 00    	mov    %cl,0xa5(%eax)
80107cde:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107ce5:	83 e1 f0             	and    $0xfffffff0,%ecx
80107ce8:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107cee:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107cf5:	83 e1 ef             	and    $0xffffffef,%ecx
80107cf8:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107cfe:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107d05:	83 e1 df             	and    $0xffffffdf,%ecx
80107d08:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107d0e:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107d15:	83 c9 40             	or     $0x40,%ecx
80107d18:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107d1e:	0f b6 88 a6 00 00 00 	movzbl 0xa6(%eax),%ecx
80107d25:	83 e1 7f             	and    $0x7f,%ecx
80107d28:	88 88 a6 00 00 00    	mov    %cl,0xa6(%eax)
80107d2e:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
  cpu->gdt[SEG_TSS].s = 0;
80107d34:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107d3a:	0f b6 90 a5 00 00 00 	movzbl 0xa5(%eax),%edx
80107d41:	83 e2 ef             	and    $0xffffffef,%edx
80107d44:	88 90 a5 00 00 00    	mov    %dl,0xa5(%eax)
  cpu->ts.ss0 = SEG_KDATA << 3;
80107d4a:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107d50:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80107d56:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80107d5c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80107d63:	8b 52 08             	mov    0x8(%edx),%edx
80107d66:	81 c2 00 10 00 00    	add    $0x1000,%edx
80107d6c:	89 50 0c             	mov    %edx,0xc(%eax)
  ltr(SEG_TSS << 3);
80107d6f:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
80107d76:	e8 ee f7 ff ff       	call   80107569 <ltr>
  if(p->pgdir == 0)
80107d7b:	8b 45 08             	mov    0x8(%ebp),%eax
80107d7e:	8b 40 04             	mov    0x4(%eax),%eax
80107d81:	85 c0                	test   %eax,%eax
80107d83:	75 0c                	jne    80107d91 <switchuvm+0x146>
    panic("switchuvm: no pgdir");
80107d85:	c7 04 24 57 89 10 80 	movl   $0x80108957,(%esp)
80107d8c:	e8 a9 87 ff ff       	call   8010053a <panic>
  lcr3(v2p(p->pgdir));  // switch to new address space
80107d91:	8b 45 08             	mov    0x8(%ebp),%eax
80107d94:	8b 40 04             	mov    0x4(%eax),%eax
80107d97:	89 04 24             	mov    %eax,(%esp)
80107d9a:	e8 00 f8 ff ff       	call   8010759f <v2p>
80107d9f:	89 04 24             	mov    %eax,(%esp)
80107da2:	e8 ed f7 ff ff       	call   80107594 <lcr3>
  popcli();
80107da7:	e8 5c d1 ff ff       	call   80104f08 <popcli>
}
80107dac:	83 c4 14             	add    $0x14,%esp
80107daf:	5b                   	pop    %ebx
80107db0:	5d                   	pop    %ebp
80107db1:	c3                   	ret    

80107db2 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80107db2:	55                   	push   %ebp
80107db3:	89 e5                	mov    %esp,%ebp
80107db5:	83 ec 38             	sub    $0x38,%esp
  char *mem;
  
  if(sz >= PGSIZE)
80107db8:	81 7d 10 ff 0f 00 00 	cmpl   $0xfff,0x10(%ebp)
80107dbf:	76 0c                	jbe    80107dcd <inituvm+0x1b>
    panic("inituvm: more than a page");
80107dc1:	c7 04 24 6b 89 10 80 	movl   $0x8010896b,(%esp)
80107dc8:	e8 6d 87 ff ff       	call   8010053a <panic>
  mem = kalloc();
80107dcd:	e8 2c ad ff ff       	call   80102afe <kalloc>
80107dd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(mem, 0, PGSIZE);
80107dd5:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107ddc:	00 
80107ddd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107de4:	00 
80107de5:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107de8:	89 04 24             	mov    %eax,(%esp)
80107deb:	e8 d6 d1 ff ff       	call   80104fc6 <memset>
  mappages(pgdir, 0, PGSIZE, v2p(mem), PTE_W|PTE_U);
80107df0:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107df3:	89 04 24             	mov    %eax,(%esp)
80107df6:	e8 a4 f7 ff ff       	call   8010759f <v2p>
80107dfb:	c7 44 24 10 06 00 00 	movl   $0x6,0x10(%esp)
80107e02:	00 
80107e03:	89 44 24 0c          	mov    %eax,0xc(%esp)
80107e07:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107e0e:	00 
80107e0f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107e16:	00 
80107e17:	8b 45 08             	mov    0x8(%ebp),%eax
80107e1a:	89 04 24             	mov    %eax,(%esp)
80107e1d:	e8 a3 fc ff ff       	call   80107ac5 <mappages>
  memmove(mem, init, sz);
80107e22:	8b 45 10             	mov    0x10(%ebp),%eax
80107e25:	89 44 24 08          	mov    %eax,0x8(%esp)
80107e29:	8b 45 0c             	mov    0xc(%ebp),%eax
80107e2c:	89 44 24 04          	mov    %eax,0x4(%esp)
80107e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107e33:	89 04 24             	mov    %eax,(%esp)
80107e36:	e8 5e d2 ff ff       	call   80105099 <memmove>
}
80107e3b:	c9                   	leave  
80107e3c:	c3                   	ret    

80107e3d <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80107e3d:	55                   	push   %ebp
80107e3e:	89 e5                	mov    %esp,%ebp
80107e40:	53                   	push   %ebx
80107e41:	83 ec 24             	sub    $0x24,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80107e44:	8b 45 0c             	mov    0xc(%ebp),%eax
80107e47:	25 ff 0f 00 00       	and    $0xfff,%eax
80107e4c:	85 c0                	test   %eax,%eax
80107e4e:	74 0c                	je     80107e5c <loaduvm+0x1f>
    panic("loaduvm: addr must be page aligned");
80107e50:	c7 04 24 88 89 10 80 	movl   $0x80108988,(%esp)
80107e57:	e8 de 86 ff ff       	call   8010053a <panic>
  for(i = 0; i < sz; i += PGSIZE){
80107e5c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
80107e63:	e9 ae 00 00 00       	jmp    80107f16 <loaduvm+0xd9>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80107e68:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107e6b:	8b 55 0c             	mov    0xc(%ebp),%edx
80107e6e:	8d 04 02             	lea    (%edx,%eax,1),%eax
80107e71:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80107e78:	00 
80107e79:	89 44 24 04          	mov    %eax,0x4(%esp)
80107e7d:	8b 45 08             	mov    0x8(%ebp),%eax
80107e80:	89 04 24             	mov    %eax,(%esp)
80107e83:	e8 a7 fb ff ff       	call   80107a2f <walkpgdir>
80107e88:	89 45 f4             	mov    %eax,-0xc(%ebp)
80107e8b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80107e8f:	75 0c                	jne    80107e9d <loaduvm+0x60>
      panic("loaduvm: address should exist");
80107e91:	c7 04 24 ab 89 10 80 	movl   $0x801089ab,(%esp)
80107e98:	e8 9d 86 ff ff       	call   8010053a <panic>
    pa = PTE_ADDR(*pte);
80107e9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ea0:	8b 00                	mov    (%eax),%eax
80107ea2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107ea7:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(sz - i < PGSIZE)
80107eaa:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107ead:	8b 55 18             	mov    0x18(%ebp),%edx
80107eb0:	89 d1                	mov    %edx,%ecx
80107eb2:	29 c1                	sub    %eax,%ecx
80107eb4:	89 c8                	mov    %ecx,%eax
80107eb6:	3d ff 0f 00 00       	cmp    $0xfff,%eax
80107ebb:	77 11                	ja     80107ece <loaduvm+0x91>
      n = sz - i;
80107ebd:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107ec0:	8b 55 18             	mov    0x18(%ebp),%edx
80107ec3:	89 d1                	mov    %edx,%ecx
80107ec5:	29 c1                	sub    %eax,%ecx
80107ec7:	89 c8                	mov    %ecx,%eax
80107ec9:	89 45 f0             	mov    %eax,-0x10(%ebp)
80107ecc:	eb 07                	jmp    80107ed5 <loaduvm+0x98>
    else
      n = PGSIZE;
80107ece:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
    if(readi(ip, p2v(pa), offset+i, n) != n)
80107ed5:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107ed8:	8b 55 14             	mov    0x14(%ebp),%edx
80107edb:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
80107ede:	8b 45 ec             	mov    -0x14(%ebp),%eax
80107ee1:	89 04 24             	mov    %eax,(%esp)
80107ee4:	e8 c3 f6 ff ff       	call   801075ac <p2v>
80107ee9:	8b 55 f0             	mov    -0x10(%ebp),%edx
80107eec:	89 54 24 0c          	mov    %edx,0xc(%esp)
80107ef0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80107ef4:	89 44 24 04          	mov    %eax,0x4(%esp)
80107ef8:	8b 45 10             	mov    0x10(%ebp),%eax
80107efb:	89 04 24             	mov    %eax,(%esp)
80107efe:	e8 65 9e ff ff       	call   80101d68 <readi>
80107f03:	3b 45 f0             	cmp    -0x10(%ebp),%eax
80107f06:	74 07                	je     80107f0f <loaduvm+0xd2>
      return -1;
80107f08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107f0d:	eb 18                	jmp    80107f27 <loaduvm+0xea>
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80107f0f:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
80107f16:	8b 45 e8             	mov    -0x18(%ebp),%eax
80107f19:	3b 45 18             	cmp    0x18(%ebp),%eax
80107f1c:	0f 82 46 ff ff ff    	jb     80107e68 <loaduvm+0x2b>
    else
      n = PGSIZE;
    if(readi(ip, p2v(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80107f22:	b8 00 00 00 00       	mov    $0x0,%eax
}
80107f27:	83 c4 24             	add    $0x24,%esp
80107f2a:	5b                   	pop    %ebx
80107f2b:	5d                   	pop    %ebp
80107f2c:	c3                   	ret    

80107f2d <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80107f2d:	55                   	push   %ebp
80107f2e:	89 e5                	mov    %esp,%ebp
80107f30:	83 ec 38             	sub    $0x38,%esp
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80107f33:	8b 45 10             	mov    0x10(%ebp),%eax
80107f36:	85 c0                	test   %eax,%eax
80107f38:	79 0a                	jns    80107f44 <allocuvm+0x17>
    return 0;
80107f3a:	b8 00 00 00 00       	mov    $0x0,%eax
80107f3f:	e9 c1 00 00 00       	jmp    80108005 <allocuvm+0xd8>
  if(newsz < oldsz)
80107f44:	8b 45 10             	mov    0x10(%ebp),%eax
80107f47:	3b 45 0c             	cmp    0xc(%ebp),%eax
80107f4a:	73 08                	jae    80107f54 <allocuvm+0x27>
    return oldsz;
80107f4c:	8b 45 0c             	mov    0xc(%ebp),%eax
80107f4f:	e9 b1 00 00 00       	jmp    80108005 <allocuvm+0xd8>

  a = PGROUNDUP(oldsz);
80107f54:	8b 45 0c             	mov    0xc(%ebp),%eax
80107f57:	05 ff 0f 00 00       	add    $0xfff,%eax
80107f5c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107f61:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(; a < newsz; a += PGSIZE){
80107f64:	e9 8d 00 00 00       	jmp    80107ff6 <allocuvm+0xc9>
    mem = kalloc();
80107f69:	e8 90 ab ff ff       	call   80102afe <kalloc>
80107f6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(mem == 0){
80107f71:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
80107f75:	75 2c                	jne    80107fa3 <allocuvm+0x76>
      cprintf("allocuvm out of memory\n");
80107f77:	c7 04 24 c9 89 10 80 	movl   $0x801089c9,(%esp)
80107f7e:	e8 17 84 ff ff       	call   8010039a <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
80107f83:	8b 45 0c             	mov    0xc(%ebp),%eax
80107f86:	89 44 24 08          	mov    %eax,0x8(%esp)
80107f8a:	8b 45 10             	mov    0x10(%ebp),%eax
80107f8d:	89 44 24 04          	mov    %eax,0x4(%esp)
80107f91:	8b 45 08             	mov    0x8(%ebp),%eax
80107f94:	89 04 24             	mov    %eax,(%esp)
80107f97:	e8 6b 00 00 00       	call   80108007 <deallocuvm>
      return 0;
80107f9c:	b8 00 00 00 00       	mov    $0x0,%eax
80107fa1:	eb 62                	jmp    80108005 <allocuvm+0xd8>
    }
    memset(mem, 0, PGSIZE);
80107fa3:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107faa:	00 
80107fab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80107fb2:	00 
80107fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107fb6:	89 04 24             	mov    %eax,(%esp)
80107fb9:	e8 08 d0 ff ff       	call   80104fc6 <memset>
    mappages(pgdir, (char*)a, PGSIZE, v2p(mem), PTE_W|PTE_U);
80107fbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
80107fc1:	89 04 24             	mov    %eax,(%esp)
80107fc4:	e8 d6 f5 ff ff       	call   8010759f <v2p>
80107fc9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80107fcc:	c7 44 24 10 06 00 00 	movl   $0x6,0x10(%esp)
80107fd3:	00 
80107fd4:	89 44 24 0c          	mov    %eax,0xc(%esp)
80107fd8:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80107fdf:	00 
80107fe0:	89 54 24 04          	mov    %edx,0x4(%esp)
80107fe4:	8b 45 08             	mov    0x8(%ebp),%eax
80107fe7:	89 04 24             	mov    %eax,(%esp)
80107fea:	e8 d6 fa ff ff       	call   80107ac5 <mappages>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80107fef:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
80107ff6:	8b 45 f4             	mov    -0xc(%ebp),%eax
80107ff9:	3b 45 10             	cmp    0x10(%ebp),%eax
80107ffc:	0f 82 67 ff ff ff    	jb     80107f69 <allocuvm+0x3c>
      return 0;
    }
    memset(mem, 0, PGSIZE);
    mappages(pgdir, (char*)a, PGSIZE, v2p(mem), PTE_W|PTE_U);
  }
  return newsz;
80108002:	8b 45 10             	mov    0x10(%ebp),%eax
}
80108005:	c9                   	leave  
80108006:	c3                   	ret    

80108007 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80108007:	55                   	push   %ebp
80108008:	89 e5                	mov    %esp,%ebp
8010800a:	83 ec 28             	sub    $0x28,%esp
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
8010800d:	8b 45 10             	mov    0x10(%ebp),%eax
80108010:	3b 45 0c             	cmp    0xc(%ebp),%eax
80108013:	72 08                	jb     8010801d <deallocuvm+0x16>
    return oldsz;
80108015:	8b 45 0c             	mov    0xc(%ebp),%eax
80108018:	e9 a4 00 00 00       	jmp    801080c1 <deallocuvm+0xba>

  a = PGROUNDUP(newsz);
8010801d:	8b 45 10             	mov    0x10(%ebp),%eax
80108020:	05 ff 0f 00 00       	add    $0xfff,%eax
80108025:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010802a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  for(; a  < oldsz; a += PGSIZE){
8010802d:	e9 80 00 00 00       	jmp    801080b2 <deallocuvm+0xab>
    pte = walkpgdir(pgdir, (char*)a, 0);
80108032:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108035:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
8010803c:	00 
8010803d:	89 44 24 04          	mov    %eax,0x4(%esp)
80108041:	8b 45 08             	mov    0x8(%ebp),%eax
80108044:	89 04 24             	mov    %eax,(%esp)
80108047:	e8 e3 f9 ff ff       	call   80107a2f <walkpgdir>
8010804c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(!pte)
8010804f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
80108053:	75 09                	jne    8010805e <deallocuvm+0x57>
      a += (NPTENTRIES - 1) * PGSIZE;
80108055:	81 45 ec 00 f0 3f 00 	addl   $0x3ff000,-0x14(%ebp)
8010805c:	eb 4d                	jmp    801080ab <deallocuvm+0xa4>
    else if((*pte & PTE_P) != 0){
8010805e:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108061:	8b 00                	mov    (%eax),%eax
80108063:	83 e0 01             	and    $0x1,%eax
80108066:	84 c0                	test   %al,%al
80108068:	74 41                	je     801080ab <deallocuvm+0xa4>
      pa = PTE_ADDR(*pte);
8010806a:	8b 45 e8             	mov    -0x18(%ebp),%eax
8010806d:	8b 00                	mov    (%eax),%eax
8010806f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108074:	89 45 f0             	mov    %eax,-0x10(%ebp)
      if(pa == 0)
80108077:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
8010807b:	75 0c                	jne    80108089 <deallocuvm+0x82>
        panic("kfree");
8010807d:	c7 04 24 e1 89 10 80 	movl   $0x801089e1,(%esp)
80108084:	e8 b1 84 ff ff       	call   8010053a <panic>
      char *v = p2v(pa);
80108089:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010808c:	89 04 24             	mov    %eax,(%esp)
8010808f:	e8 18 f5 ff ff       	call   801075ac <p2v>
80108094:	89 45 f4             	mov    %eax,-0xc(%ebp)
      kfree(v);
80108097:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010809a:	89 04 24             	mov    %eax,(%esp)
8010809d:	e8 c3 a9 ff ff       	call   80102a65 <kfree>
      *pte = 0;
801080a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
801080a5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801080ab:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
801080b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
801080b5:	3b 45 0c             	cmp    0xc(%ebp),%eax
801080b8:	0f 82 74 ff ff ff    	jb     80108032 <deallocuvm+0x2b>
      char *v = p2v(pa);
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
801080be:	8b 45 10             	mov    0x10(%ebp),%eax
}
801080c1:	c9                   	leave  
801080c2:	c3                   	ret    

801080c3 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
801080c3:	55                   	push   %ebp
801080c4:	89 e5                	mov    %esp,%ebp
801080c6:	83 ec 28             	sub    $0x28,%esp
  uint i;

  if(pgdir == 0)
801080c9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
801080cd:	75 0c                	jne    801080db <freevm+0x18>
    panic("freevm: no pgdir");
801080cf:	c7 04 24 e7 89 10 80 	movl   $0x801089e7,(%esp)
801080d6:	e8 5f 84 ff ff       	call   8010053a <panic>
  deallocuvm(pgdir, KERNBASE, 0);
801080db:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801080e2:	00 
801080e3:	c7 44 24 04 00 00 00 	movl   $0x80000000,0x4(%esp)
801080ea:	80 
801080eb:	8b 45 08             	mov    0x8(%ebp),%eax
801080ee:	89 04 24             	mov    %eax,(%esp)
801080f1:	e8 11 ff ff ff       	call   80108007 <deallocuvm>
  for(i = 0; i < NPDENTRIES; i++){
801080f6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
801080fd:	eb 3c                	jmp    8010813b <freevm+0x78>
    if(pgdir[i] & PTE_P){
801080ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108102:	c1 e0 02             	shl    $0x2,%eax
80108105:	03 45 08             	add    0x8(%ebp),%eax
80108108:	8b 00                	mov    (%eax),%eax
8010810a:	83 e0 01             	and    $0x1,%eax
8010810d:	84 c0                	test   %al,%al
8010810f:	74 26                	je     80108137 <freevm+0x74>
      char * v = p2v(PTE_ADDR(pgdir[i]));
80108111:	8b 45 f0             	mov    -0x10(%ebp),%eax
80108114:	c1 e0 02             	shl    $0x2,%eax
80108117:	03 45 08             	add    0x8(%ebp),%eax
8010811a:	8b 00                	mov    (%eax),%eax
8010811c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108121:	89 04 24             	mov    %eax,(%esp)
80108124:	e8 83 f4 ff ff       	call   801075ac <p2v>
80108129:	89 45 f4             	mov    %eax,-0xc(%ebp)
      kfree(v);
8010812c:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010812f:	89 04 24             	mov    %eax,(%esp)
80108132:	e8 2e a9 ff ff       	call   80102a65 <kfree>
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80108137:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
8010813b:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
80108142:	76 bb                	jbe    801080ff <freevm+0x3c>
    if(pgdir[i] & PTE_P){
      char * v = p2v(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80108144:	8b 45 08             	mov    0x8(%ebp),%eax
80108147:	89 04 24             	mov    %eax,(%esp)
8010814a:	e8 16 a9 ff ff       	call   80102a65 <kfree>
}
8010814f:	c9                   	leave  
80108150:	c3                   	ret    

80108151 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80108151:	55                   	push   %ebp
80108152:	89 e5                	mov    %esp,%ebp
80108154:	83 ec 28             	sub    $0x28,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80108157:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
8010815e:	00 
8010815f:	8b 45 0c             	mov    0xc(%ebp),%eax
80108162:	89 44 24 04          	mov    %eax,0x4(%esp)
80108166:	8b 45 08             	mov    0x8(%ebp),%eax
80108169:	89 04 24             	mov    %eax,(%esp)
8010816c:	e8 be f8 ff ff       	call   80107a2f <walkpgdir>
80108171:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pte == 0)
80108174:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80108178:	75 0c                	jne    80108186 <clearpteu+0x35>
    panic("clearpteu");
8010817a:	c7 04 24 f8 89 10 80 	movl   $0x801089f8,(%esp)
80108181:	e8 b4 83 ff ff       	call   8010053a <panic>
  *pte &= ~PTE_U;
80108186:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108189:	8b 00                	mov    (%eax),%eax
8010818b:	89 c2                	mov    %eax,%edx
8010818d:	83 e2 fb             	and    $0xfffffffb,%edx
80108190:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108193:	89 10                	mov    %edx,(%eax)
}
80108195:	c9                   	leave  
80108196:	c3                   	ret    

80108197 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80108197:	55                   	push   %ebp
80108198:	89 e5                	mov    %esp,%ebp
8010819a:	53                   	push   %ebx
8010819b:	83 ec 44             	sub    $0x44,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
8010819e:	e8 b6 f9 ff ff       	call   80107b59 <setupkvm>
801081a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
801081a6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
801081aa:	75 0a                	jne    801081b6 <copyuvm+0x1f>
    return 0;
801081ac:	b8 00 00 00 00       	mov    $0x0,%eax
801081b1:	e9 fd 00 00 00       	jmp    801082b3 <copyuvm+0x11c>
  for(i = 0; i < sz; i += PGSIZE){
801081b6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
801081bd:	e9 cc 00 00 00       	jmp    8010828e <copyuvm+0xf7>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
801081c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
801081c5:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801081cc:	00 
801081cd:	89 44 24 04          	mov    %eax,0x4(%esp)
801081d1:	8b 45 08             	mov    0x8(%ebp),%eax
801081d4:	89 04 24             	mov    %eax,(%esp)
801081d7:	e8 53 f8 ff ff       	call   80107a2f <walkpgdir>
801081dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801081df:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
801081e3:	75 0c                	jne    801081f1 <copyuvm+0x5a>
      panic("copyuvm: pte should exist");
801081e5:	c7 04 24 02 8a 10 80 	movl   $0x80108a02,(%esp)
801081ec:	e8 49 83 ff ff       	call   8010053a <panic>
    if(!(*pte & PTE_P))
801081f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801081f4:	8b 00                	mov    (%eax),%eax
801081f6:	83 e0 01             	and    $0x1,%eax
801081f9:	85 c0                	test   %eax,%eax
801081fb:	75 0c                	jne    80108209 <copyuvm+0x72>
      panic("copyuvm: page not present");
801081fd:	c7 04 24 1c 8a 10 80 	movl   $0x80108a1c,(%esp)
80108204:	e8 31 83 ff ff       	call   8010053a <panic>
    pa = PTE_ADDR(*pte);
80108209:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010820c:	8b 00                	mov    (%eax),%eax
8010820e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80108213:	89 45 e8             	mov    %eax,-0x18(%ebp)
    flags = PTE_FLAGS(*pte);
80108216:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80108219:	8b 00                	mov    (%eax),%eax
8010821b:	25 ff 0f 00 00       	and    $0xfff,%eax
80108220:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((mem = kalloc()) == 0)
80108223:	e8 d6 a8 ff ff       	call   80102afe <kalloc>
80108228:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010822b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
8010822f:	74 6e                	je     8010829f <copyuvm+0x108>
      goto bad;
    memmove(mem, (char*)p2v(pa), PGSIZE);
80108231:	8b 45 e8             	mov    -0x18(%ebp),%eax
80108234:	89 04 24             	mov    %eax,(%esp)
80108237:	e8 70 f3 ff ff       	call   801075ac <p2v>
8010823c:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80108243:	00 
80108244:	89 44 24 04          	mov    %eax,0x4(%esp)
80108248:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010824b:	89 04 24             	mov    %eax,(%esp)
8010824e:	e8 46 ce ff ff       	call   80105099 <memmove>
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), flags) < 0)
80108253:	8b 5d f0             	mov    -0x10(%ebp),%ebx
80108256:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108259:	89 04 24             	mov    %eax,(%esp)
8010825c:	e8 3e f3 ff ff       	call   8010759f <v2p>
80108261:	8b 55 ec             	mov    -0x14(%ebp),%edx
80108264:	89 5c 24 10          	mov    %ebx,0x10(%esp)
80108268:	89 44 24 0c          	mov    %eax,0xc(%esp)
8010826c:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80108273:	00 
80108274:	89 54 24 04          	mov    %edx,0x4(%esp)
80108278:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010827b:	89 04 24             	mov    %eax,(%esp)
8010827e:	e8 42 f8 ff ff       	call   80107ac5 <mappages>
80108283:	85 c0                	test   %eax,%eax
80108285:	78 1b                	js     801082a2 <copyuvm+0x10b>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80108287:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
8010828e:	8b 45 ec             	mov    -0x14(%ebp),%eax
80108291:	3b 45 0c             	cmp    0xc(%ebp),%eax
80108294:	0f 82 28 ff ff ff    	jb     801081c2 <copyuvm+0x2b>
      goto bad;
    memmove(mem, (char*)p2v(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), flags) < 0)
      goto bad;
  }
  return d;
8010829a:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010829d:	eb 14                	jmp    801082b3 <copyuvm+0x11c>
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
8010829f:	90                   	nop
801082a0:	eb 01                	jmp    801082a3 <copyuvm+0x10c>
    memmove(mem, (char*)p2v(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, v2p(mem), flags) < 0)
      goto bad;
801082a2:	90                   	nop
  }
  return d;

bad:
  freevm(d);
801082a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801082a6:	89 04 24             	mov    %eax,(%esp)
801082a9:	e8 15 fe ff ff       	call   801080c3 <freevm>
  return 0;
801082ae:	b8 00 00 00 00       	mov    $0x0,%eax
}
801082b3:	83 c4 44             	add    $0x44,%esp
801082b6:	5b                   	pop    %ebx
801082b7:	5d                   	pop    %ebp
801082b8:	c3                   	ret    

801082b9 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
801082b9:	55                   	push   %ebp
801082ba:	89 e5                	mov    %esp,%ebp
801082bc:	83 ec 28             	sub    $0x28,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
801082bf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
801082c6:	00 
801082c7:	8b 45 0c             	mov    0xc(%ebp),%eax
801082ca:	89 44 24 04          	mov    %eax,0x4(%esp)
801082ce:	8b 45 08             	mov    0x8(%ebp),%eax
801082d1:	89 04 24             	mov    %eax,(%esp)
801082d4:	e8 56 f7 ff ff       	call   80107a2f <walkpgdir>
801082d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((*pte & PTE_P) == 0)
801082dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
801082df:	8b 00                	mov    (%eax),%eax
801082e1:	83 e0 01             	and    $0x1,%eax
801082e4:	85 c0                	test   %eax,%eax
801082e6:	75 07                	jne    801082ef <uva2ka+0x36>
    return 0;
801082e8:	b8 00 00 00 00       	mov    $0x0,%eax
801082ed:	eb 25                	jmp    80108314 <uva2ka+0x5b>
  if((*pte & PTE_U) == 0)
801082ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
801082f2:	8b 00                	mov    (%eax),%eax
801082f4:	83 e0 04             	and    $0x4,%eax
801082f7:	85 c0                	test   %eax,%eax
801082f9:	75 07                	jne    80108302 <uva2ka+0x49>
    return 0;
801082fb:	b8 00 00 00 00       	mov    $0x0,%eax
80108300:	eb 12                	jmp    80108314 <uva2ka+0x5b>
  return (char*)p2v(PTE_ADDR(*pte));
80108302:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108305:	8b 00                	mov    (%eax),%eax
80108307:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010830c:	89 04 24             	mov    %eax,(%esp)
8010830f:	e8 98 f2 ff ff       	call   801075ac <p2v>
}
80108314:	c9                   	leave  
80108315:	c3                   	ret    

80108316 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80108316:	55                   	push   %ebp
80108317:	89 e5                	mov    %esp,%ebp
80108319:	83 ec 28             	sub    $0x28,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
8010831c:	8b 45 10             	mov    0x10(%ebp),%eax
8010831f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  while(len > 0){
80108322:	e9 8b 00 00 00       	jmp    801083b2 <copyout+0x9c>
    va0 = (uint)PGROUNDDOWN(va);
80108327:	8b 45 0c             	mov    0xc(%ebp),%eax
8010832a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010832f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    pa0 = uva2ka(pgdir, (char*)va0);
80108332:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108335:	89 44 24 04          	mov    %eax,0x4(%esp)
80108339:	8b 45 08             	mov    0x8(%ebp),%eax
8010833c:	89 04 24             	mov    %eax,(%esp)
8010833f:	e8 75 ff ff ff       	call   801082b9 <uva2ka>
80108344:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pa0 == 0)
80108347:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
8010834b:	75 07                	jne    80108354 <copyout+0x3e>
      return -1;
8010834d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80108352:	eb 6d                	jmp    801083c1 <copyout+0xab>
    n = PGSIZE - (va - va0);
80108354:	8b 45 0c             	mov    0xc(%ebp),%eax
80108357:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010835a:	89 d1                	mov    %edx,%ecx
8010835c:	29 c1                	sub    %eax,%ecx
8010835e:	89 c8                	mov    %ecx,%eax
80108360:	05 00 10 00 00       	add    $0x1000,%eax
80108365:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(n > len)
80108368:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010836b:	3b 45 14             	cmp    0x14(%ebp),%eax
8010836e:	76 06                	jbe    80108376 <copyout+0x60>
      n = len;
80108370:	8b 45 14             	mov    0x14(%ebp),%eax
80108373:	89 45 f0             	mov    %eax,-0x10(%ebp)
    memmove(pa0 + (va - va0), buf, n);
80108376:	8b 45 f4             	mov    -0xc(%ebp),%eax
80108379:	8b 55 0c             	mov    0xc(%ebp),%edx
8010837c:	89 d1                	mov    %edx,%ecx
8010837e:	29 c1                	sub    %eax,%ecx
80108380:	89 c8                	mov    %ecx,%eax
80108382:	03 45 ec             	add    -0x14(%ebp),%eax
80108385:	8b 55 f0             	mov    -0x10(%ebp),%edx
80108388:	89 54 24 08          	mov    %edx,0x8(%esp)
8010838c:	8b 55 e8             	mov    -0x18(%ebp),%edx
8010838f:	89 54 24 04          	mov    %edx,0x4(%esp)
80108393:	89 04 24             	mov    %eax,(%esp)
80108396:	e8 fe cc ff ff       	call   80105099 <memmove>
    len -= n;
8010839b:	8b 45 f0             	mov    -0x10(%ebp),%eax
8010839e:	29 45 14             	sub    %eax,0x14(%ebp)
    buf += n;
801083a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801083a4:	01 45 e8             	add    %eax,-0x18(%ebp)
    va = va0 + PGSIZE;
801083a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
801083aa:	05 00 10 00 00       	add    $0x1000,%eax
801083af:	89 45 0c             	mov    %eax,0xc(%ebp)
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801083b2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
801083b6:	0f 85 6b ff ff ff    	jne    80108327 <copyout+0x11>
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
801083bc:	b8 00 00 00 00       	mov    $0x0,%eax
}
801083c1:	c9                   	leave  
801083c2:	c3                   	ret    
