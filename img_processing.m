function varargout = odev1(varargin)
% ODEV1 MATLAB code for odev1.fig
%      ODEV1, by itself, creates a new ODEV1 or raises the existing
%      singleton*.
%
%      H = ODEV1 returns the handle to a new ODEV1 or the handle to
%      the existing singleton*.
%
%      ODEV1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ODEV1.M with the given input arguments.
%
%      ODEV1('Property','Value',...) creates a new ODEV1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before odev1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to odev1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help odev1

% Last Modified by GUIDE v2.5 15-Nov-2018 22:28:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @odev1_OpeningFcn, ...
                   'gui_OutputFcn',  @odev1_OutputFcn, ...
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


% --- Executes just before odev1 is made visible.
function odev1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to odev1 (see VARARGIN)

% Choose default command line output for odev1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes odev1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = odev1_OutputFcn(hObject, eventdata, handles) 
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
global a b
b=imread('C:\Users\user\Desktop\resimodev.jpg');
a = rgb2gray(b);
axes(handles.axes1);
imshow(a);
axes(handles.axes3);
imhist(a);
% [pixelCounts, grayLevels] = imhist(a);
% cdf = cumsum(pixelCounts); % Make transfer function (look up table).
% cdf = cdf / sum(cdf);
axes(handles.axes4);% Normalize
plot((1:10))

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%---------------->here we implement simple brightness

global a 

val=0.8*get(hObject,'Value')-0.8;
imbright=a+val;

axes(handles.axes2);
imshow(imbright);

axes(handles.axes3);
imhist(imbright);

[pixelCounts, grayLevels] = imhist(imbright);
cdf = cumsum(pixelCounts); % Make transfer function (look up table).
cdf = cdf / sum(cdf);
axes(handles.axes4);% Normalize
plot(grayLevels, cdf, 'b-');




% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global a 
%RGB2 = imadjust(a,[.2 .3 0; .6 .7 1],[]);
x=get(hObject,'Value');
imgas = imadjust(a,[],[],x);
axes(handles.axes2);
imshow(imgas, []);
guidata(hObject,handles);
axes(handles.axes3);
imhist(imgas);
t = 0:0.01:1;
 axes(handles.axes4);
plot(t,t.^x);


% set(handles.edit1,'String',num2str(x));
% handles.b=imgas;
% update(handles)
%guidata(hObject,handles);


% % % % % % % % % % % % % % % % % % % 
% J = imadjust(a,[0.3 0.7],[]);
%  axes(handles.axes2);
%  imshow(J);
%  axes(handles.axes3);
%  imhist(J);
% [pixelCounts, grayLevels] = imhist(J);
%  cdf = cumsum(pixelCounts); % Make transfer function (look up table).
%  cdf = cdf / sum(cdf);
%  axes(handles.axes4);% Normalize
%  plot(grayLevels, cdf, 'b-');
% % % % % % % % % % % % % % % % % % % % % 
%  t = 0:0.01:1;
%  gamm = 1;
%  
%   J = imadjust(a,[],[],gamm);
%   subplot(1,2,1)
%   axes(handles.axes2);
%   imshow(J); 
% %   title(sprintf('Gamma value: %.2f',gamm))
% %   subplot(1,2,2)
%   axes(handles.axes4);
%   plot(t,t.^gamm);


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
[rows, cols] = size(a);

intensity_low = 0;
intensity_high = 128;



%linear and enhance
for row = 1:rows
    for col = 1:cols
        if a(row,col) > intensity_low && a(row,col) < intensity_high
            a(row,col) = 50;
        end
    end
end
xaxis = linspace(0,255,50);
yaxis = imhist(a,50);

axes(handles.axes3);
stem(xaxis,yaxis);
% axes(handles.axes3);
%  imhist(a);
