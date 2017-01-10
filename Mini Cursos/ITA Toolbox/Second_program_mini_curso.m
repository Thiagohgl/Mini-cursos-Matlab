function varargout = Second_program_mini_curso(varargin)
% SECOND_PROGRAM_MINI_CURSO MATLAB code for Second_program_mini_curso.fig
%      SECOND_PROGRAM_MINI_CURSO, by itself, creates a new SECOND_PROGRAM_MINI_CURSO or raises the existing
%      singleton*.
%
%      H = SECOND_PROGRAM_MINI_CURSO returns the handle to a new SECOND_PROGRAM_MINI_CURSO or the handle to
%      the existing singleton*.
%
%      SECOND_PROGRAM_MINI_CURSO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECOND_PROGRAM_MINI_CURSO.M with the given input arguments.
%
%      SECOND_PROGRAM_MINI_CURSO('Property','Value',...) creates a new SECOND_PROGRAM_MINI_CURSO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Second_program_mini_curso_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Second_program_mini_curso_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Second_program_mini_curso

% Last Modified by GUIDE v2.5 04-Nov-2016 21:27:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Second_program_mini_curso_OpeningFcn, ...
                   'gui_OutputFcn',  @Second_program_mini_curso_OutputFcn, ...
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


% --- Executes just before Second_program_mini_curso is made visible.
function Second_program_mini_curso_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Second_program_mini_curso (see VARARGIN)

% Choose default command line output for Second_program_mini_curso
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Second_program_mini_curso wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Second_program_mini_curso_OutputFcn(hObject, eventdata, handles) 
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

Index = get(handles.LB_filtro,'Value');

switch Index
    case 1
        handles.I_plot = handles.Image;
        
    case 2
        handles.I_plot = rgb2gray(handles.Image);
    case 3
        handles.I_plot = im2bw(handles.Image,0.5);
end

imshow(handles.I_plot)
guidata(hObject,handles)

% --- Executes on selection change in LB_filtro.
function LB_filtro_Callback(hObject, eventdata, handles)
% hObject    handle to LB_filtro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns LB_filtro contents as cell array
%        contents{get(hObject,'Value')} returns selected item from LB_filtro


% --- Executes during object creation, after setting all properties.
function LB_filtro_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LB_filtro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.jpg','Selecione uma imagem');

handles.Image = imread([PathName,FileName]); % Ler a imagem
imshow(handles.Image) % Mostrar a mesma

guidata(hObject,handles)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
