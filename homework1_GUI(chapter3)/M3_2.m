function varargout = M3_2(varargin)
% M3_2 MATLAB code for M3_2.fig
%      M3_2, by itself, creates a new M3_2 or raises the existing
%      singleton*.
%
%      H = M3_2 returns the handle to a new M3_2 or the handle to
%      the existing singleton*.
%
%      M3_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M3_2.M with the given input arguments.
%
%      M3_2('Property','Value',...) creates a new M3_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M3_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M3_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M3_2

% Last Modified by GUIDE v2.5 01-May-2017 19:52:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M3_2_OpeningFcn, ...
                   'gui_OutputFcn',  @M3_2_OutputFcn, ...
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


% --- Executes just before M3_2 is made visible.
function M3_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M3_2 (see VARARGIN)
global k
k = get(handles.edit1,'String')
k = str2num(k)
% Choose default command line output for M3_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M3_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M3_2_OutputFcn(hObject, eventdata, handles) 
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
global k
num1 = zeros(1,15);
den1 = zeros(1,15);
num1(1) = 1;
num1(11) = 1;
den1(11) = 1;
den1(12) = -1;
% Compute the frequency response
w = 0:(pi/(k-1)):pi;
num1
den1
h1 = freqz(num1, den1, w);
axes(handles.axes1)
plot(w/pi,real(h1));grid
title('Real part(a)')
xlabel('\omega/\pi'); ylabel('Amplitude')
axes(handles.axes2)
plot(w/pi,imag(h1));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
axes(handles.axes3)
plot(w/pi,abs(h1));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
axes(handles.axes4)
plot(w/pi,unwrap(angle(h1)));grid        %取相位
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k
num2 = zeros(1,15);
den2 = zeros(1,15);
num2(1) = 1;
num2(11) = -1;
den2(1) = 1;
den2(2) = -1;
w = 0:pi/(k-1):pi;
num2
den2
h2 = freqz(num2, den2, w);
axes(handles.axes1)
plot(w/pi,real(h2));grid
title('Real part(b)')
xlabel('\omega/\pi'); ylabel('Amplitude')
axes(handles.axes2)
plot(w/pi,imag(h2));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
axes(handles.axes3)
plot(w/pi,abs(h2));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
axes(handles.axes4)
plot(w/pi,unwrap(angle(h2)));grid        %取相位
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k
num3 = zeros(1,15);
den3 = zeros(1,15);
num3(1) = 1;
num3(11) = 1;
num3(6) = 2;
den3(11) = 1;
den3(12) = -2;
den3(13) = 1
w = 0:pi/(k-1):pi;
num3
den3
h3 = freqz(num3, den3, w);
axes(handles.axes1)
plot(w/pi,real(h3));grid
title('Real part(c)')
xlabel('\omega/\pi'); ylabel('Amplitude')
axes(handles.axes2)
plot(w/pi,imag(h3));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
axes(handles.axes3)
plot(w/pi,abs(h3));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
axes(handles.axes4)
plot(w/pi,unwrap(angle(h3)));grid        %取相位
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k
den4 = zeros(1,15);
num4= [1,2,3,4,5,6,7,8,9,10,11,10,9,8,7,6,5,4,3,2,1];
den4(11) = 1;
w = 0:pi/(k-1):pi;
num4
den4
h4 = freqz(num4, den4, w);
axes(handles.axes1)
plot(w/pi,real(h4));grid
title('Real part(d)')
xlabel('\omega/\pi'); ylabel('Amplitude')
axes(handles.axes2)
plot(w/pi,imag(h4));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
axes(handles.axes3)
plot(w/pi,abs(h4));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
axes(handles.axes4)
plot(w/pi,unwrap(angle(h4)));grid        %取相位
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k
den5 = zeros(1,15);
num5= [cos(0.5*pi),cos(0.45*pi),cos(0.4*pi),cos(0.35*pi),cos(0.3*pi),cos(0.25*pi),cos(0.2*pi),cos(0.15*pi),cos(0.1*pi),cos(0.05*pi),1,cos(0.05*pi),cos(0.1*pi),cos(0.15*pi),cos(0.2*pi),cos(0.25*pi),cos(0.3*pi),cos(0.35*pi),cos(0.4*pi),cos(0.45*pi),cos(0.5*pi)];
den5(11) = 1;
w = 0:pi/(k-1):pi;
num5
den5
h5 = freqz(num5, den5, w);
axes(handles.axes1)
plot(w/pi,real(h5));grid
title('Real part(e)')
xlabel('\omega/\pi'); ylabel('Amplitude')
axes(handles.axes2)
plot(w/pi,imag(h5));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
axes(handles.axes3)
plot(w/pi,abs(h5));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
axes(handles.axes4)
plot(w/pi,unwrap(angle(h5)));grid        %取相位
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global k
k = get(handles.edit1,'String')
k = str2num(k)
