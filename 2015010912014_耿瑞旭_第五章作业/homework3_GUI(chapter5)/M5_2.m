function varargout = M5_2(varargin)
% M5_2 MATLAB code for M5_2.fig
%      M5_2, by itself, creates a new M5_2 or raises the existing
%      singleton*.
%
%      H = M5_2 returns the handle to a new M5_2 or the handle to
%      the existing singleton*.
%
%      M5_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M5_2.M with the given input arguments.
%
%      M5_2('Property','Value',...) creates a new M5_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M5_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M5_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M5_2

% Last Modified by GUIDE v2.5 08-May-2017 14:52:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M5_2_OpeningFcn, ...
                   'gui_OutputFcn',  @M5_2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before M5_2 is made visible.
function M5_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M5_2 (see VARARGIN)
global g g1 g2 h h1 h2
g = [3,2,-2,1,0,1];
g1 = [3-2i, 4-i, -2+3j, j, 0]
g2 = [cos(pi*0/2),cos(pi*1/2),cos(pi*2/2),cos(pi*3/2),cos(pi*4/2)]
% n = length(g)
n1 = length(g1)
n2 = length(g2) 
h = [-5,-1,3,-2,4,4];
h1 = [1-3j, -2-j, 2+2j, 3, -2+4j]
h2 = [1,3,9,27,81]
% Choose default command line output for M5_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M5_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M5_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g h
Y = fft(g).*fft(h)
y = ifft(Y)
yy = circonv(g,h)
% t = 0:1:n-1
axes(handles.axes1)
stem(y)
xlabel('n')
ylabel('y[n]')
title('基于DFT的方法')
axes(handles.axes2)
stem(yy)
xlabel('n')
ylabel('y[n]')
title('利用circonv')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g1 h1
Y = fft(g1).*fft(h1)
y = ifft(Y)
yy = circonv(g1,h1)
% t = 0:1:n-1
axes(handles.axes1)
stem(y)
xlabel('n')
ylabel('y[n]')
title('基于DFT的方法')
axes(handles.axes2)
stem(yy)
xlabel('n')
ylabel('y[n]')
title('利用circonv')

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global g2 h2
Y = fft(g2).*fft(h2)
y = ifft(Y)
yy = circonv(g2,h2)
% t = 0:1:n-1
axes(handles.axes1)
stem(y)
xlabel('n')
ylabel('y[n]')
title('基于DFT的方法')
axes(handles.axes2)
stem(yy)
xlabel('n')
ylabel('y[n]')
title('利用circonv')
