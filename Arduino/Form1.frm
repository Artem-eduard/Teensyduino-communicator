VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   ClientHeight    =   8895
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   14250
   LinkTopic       =   "Form1"
   ScaleHeight     =   8895
   ScaleWidth      =   14250
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "from Teensy"
      Height          =   8775
      Left            =   3600
      TabIndex        =   5
      Top             =   120
      Width           =   4575
      Begin VB.TextBox Text5 
         Height          =   7095
         Left            =   360
         MultiLine       =   -1  'True
         TabIndex        =   8
         Top             =   1680
         Width           =   3615
      End
      Begin VB.TextBox Text4 
         Height          =   495
         Left            =   360
         TabIndex        =   7
         Top             =   960
         Width           =   3615
      End
      Begin VB.TextBox Text3 
         Height          =   495
         Left            =   360
         TabIndex        =   6
         Top             =   240
         Width           =   3615
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Send"
      Height          =   495
      Left            =   2400
      TabIndex        =   4
      Top             =   1080
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Send"
      Height          =   495
      Left            =   2400
      TabIndex        =   3
      Top             =   360
      Width           =   1095
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Text            =   "Second"
      Top             =   1080
      Width           =   2175
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   10560
      Top             =   3840
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Text            =   "First"
      Top             =   360
      Width           =   2175
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   11160
      Top             =   3720
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6975
      Left            =   240
      TabIndex        =   1
      Top             =   1800
      Width           =   2535
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
If MSComm1.PortOpen = False Then MSComm1.PortOpen = True

MSComm1.Output = Text1.Text & Chr(13)


End Sub

Private Sub Command2_Click()
If MSComm1.PortOpen = False Then MSComm1.PortOpen = True

MSComm1.Output = Text2.Text & Chr(13)

End Sub

Private Sub Form_Load()
Randomize (Now)
 'With MSComm1
 'If .PortOpen Then .PortOpen = False
 
'        .CommPort = 3
 '       .Settings = "9600 , N, 8, 1"
  '      .RTSEnable = True
   '     .DTREnable = True
        
    '    .RThreshold = 1
     '   .SThreshold = 0
        
      '  .PortOpen = True
   ' End With
End Sub

Private Sub MSComm1_OnComm()


'The VB6 needs to generate 2 sets of random numbers between -10000 and +10000. These need to be sent off on a 30ms Timer.
'Also two command buttons which when clicked send strings taken from two text boxes.
'
'Ultimately the data from the VB6 program needs to be passed onto the two Teensyduinos,
'and made available as Strings and floats. These can be just displayed in the serial monitor that is part of the Teensyduino IDE.
'Also the Teensyduino (with a COM Port) must be able to share data and strings from and to the Teensyduino (with no COM port) to the VB6 program.

Dim Buffer As String

Dim Output() As String


If MSComm1.CommEvent = comEvReceive Then
   ' If MSComm1.InBufferCount Then
      ' Read data.
       'MSComm1.InputLen = 14
     
     
     
       Buffer = MSComm1.Input
       Output = Split(Buffer, "`")  'Split string from teensy
       
       
       Text3 = Output(0)
       Text4 = Output(1)
       Text5 = Output(2)
       
       
       
       
    
  '  End If
End If
End Sub

Private Sub Timer1_Timer()
Label1.Caption = Int(Rnd() * 20000) - 10000
Label1.Caption = Label1.Caption & "."
Label1.Caption = Label1.Caption & Format(Int(Rnd() * 1000000), "000000")

For i = 0 To 19
Label1.Caption = Label1.Caption & Chr(13) & Int(Rnd() * 20000) - 10000
Label1.Caption = Label1.Caption & "."
Label1.Caption = Label1.Caption & Format(Int(Rnd() * 1000000), "000000")

Text5 = "asdsad" & vbCrLf & "asdsad"

Next i


'MSComm1.Output = Label1.Caption


End Sub
