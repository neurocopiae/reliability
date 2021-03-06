function varargout = design(varargin)
% DESIGN MATLAB code for design.fig
%      DESIGN, by itself, creates a new DESIGN or raises the existing
%      singleton*.
%
%      H = DESIGN returns the handle to a new DESIGN or the handle to
%      the existing singleton*.
%
%      DESIGN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DESIGN.M with the given input arguments.
%
%      DESIGN('Property','Value',...) creates a new DESIGN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before design_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to design_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help design

% Last Modified by GUIDE v2.5 10-Aug-2018 09:49:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @design_OpeningFcn, ...
                   'gui_OutputFcn',  @design_OutputFcn, ...
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


% --- Executes just before design is made visible.
function design_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to design (see VARARGIN)

% Choose default command line output for design
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes design wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = design_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(handles.subjects,'TooltipString','How many subjects are included in the analysis?');
set(handles.list,'TooltipString','Load cell array with subject strings called id, e.g. id.mat');
set(handles.runs,'TooltipString','How many sessions?');
set(handles.stats_dir,'TooltipString','Leave empty if you use already existing 4D file; Choose folder containing subject folders');
set(handles.stats,'TooltipString','Leave empty if you use already existing 4D file; Type in stats folder, e.g. stats_%d or days%d\stats1; %d as wildcard for session');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function subjects_Callback(hObject, eventdata, handles)
% hObject    handle to subjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subjects as text
%        str2double(get(hObject,'String')) returns contents of subjects as a double


% --- Executes during object creation, after setting all properties.
function subjects_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subjects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function runs_Callback(hObject, eventdata, handles)
% hObject    handle to runs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of runs as text
%        str2double(get(hObject,'String')) returns contents of runs as a double


% --- Executes during object creation, after setting all properties.
function runs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to runs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in list.
function list_Callback(hObject, eventdata, handles)
% hObject    handle to list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
list_subj = cellstr(spm_select(Inf,'mat','load list with subjects'));
assignin('base','list',list_subj);

% --- Executes on button press in dir_results.
function dir_results_Callback(hObject, eventdata, handles)
% hObject    handle to dir_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dir_results = cellstr(spm_select(Inf,'dir','choose results directory'));
assignin('base','dir_results',dir_results);

function con_Callback(hObject, eventdata, handles)
% hObject    handle to con (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of con as text
%        str2double(get(hObject,'String')) returns contents of con as a double


% --- Executes during object creation, after setting all properties.
function con_CreateFcn(hObject, eventdata, handles)
% hObject    handle to con (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stats_Callback(hObject, eventdata, handles)
% hObject    handle to stats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stats as text
%        str2double(get(hObject,'String')) returns contents of stats as a double


% --- Executes during object creation, after setting all properties.
function stats_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in stats_dir.
function stats_dir_Callback(hObject, eventdata, handles)
% hObject    handle to stats_dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in save.
dir_stats = cellstr(spm_select(Inf,'dir','choose stats directory'));
assignin('base','dir_stats',dir_stats);



function prefix_design_Callback(hObject, eventdata, handles)
% hObject    handle to prefix_design (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prefix_design as text
%        str2double(get(hObject,'String')) returns contents of prefix_design as a double


% --- Executes during object creation, after setting all properties.
function prefix_design_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prefix_design (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function con_count_Callback(hObject, eventdata, handles)
% hObject    handle to con_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of con_count as text
%        str2double(get(hObject,'String')) returns contents of con_count as a double


% --- Executes during object creation, after setting all properties.
function con_count_CreateFcn(hObject, eventdata, handles)
% hObject    handle to con_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in two_cons.
function two_cons_Callback(hObject, eventdata, handles)
% hObject    handle to two_cons (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of two_cons



function con1_Callback(hObject, eventdata, handles)
% hObject    handle to con1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of con1 as text
%        str2double(get(hObject,'String')) returns contents of con1 as a double


% --- Executes during object creation, after setting all properties.
function con1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to con1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function con1_count_Callback(hObject, eventdata, handles)
% hObject    handle to con1_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of con1_count as text
%        str2double(get(hObject,'String')) returns contents of con1_count as a double


% --- Executes during object creation, after setting all properties.
function con1_count_CreateFcn(hObject, eventdata, handles)
% hObject    handle to con1_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function con2_Callback(hObject, eventdata, handles)
% hObject    handle to con2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of con2 as text
%        str2double(get(hObject,'String')) returns contents of con2 as a double


% --- Executes during object creation, after setting all properties.
function con2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to con2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function con2_count_Callback(hObject, eventdata, handles)
% hObject    handle to con2_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of con2_count as text
%        str2double(get(hObject,'String')) returns contents of con2_count as a double


% --- Executes during object creation, after setting all properties.
function con2_count_CreateFcn(hObject, eventdata, handles)
% hObject    handle to con2_count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function form_Callback(hObject, eventdata, handles)
% hObject    handle to form (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of form as text
%        str2double(get(hObject,'String')) returns contents of form as a double


% --- Executes during object creation, after setting all properties.
function form_CreateFcn(hObject, eventdata, handles)
% hObject    handle to form (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function single_run_Callback(hObject, eventdata, handles)
% hObject    handle to single_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of single_run as text
%        str2double(get(hObject,'String')) returns contents of single_run as a double


% --- Executes during object creation, after setting all properties.
function single_run_CreateFcn(hObject, eventdata, handles)
% hObject    handle to single_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in single.
function single_Callback(hObject, eventdata, handles)
% hObject    handle to single (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of single

function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Starting creation of study design...');
box_path=evalin('base','box_path');

%% set parameters
%get GUI input
dir_results=evalin('base','dir_results'); % result directory
prefix_design = get(handles.prefix_design,'String'); % prefix for study design
name_design = sprintf('%s_study_design.mat',prefix_design); % creates study design file name
runs = str2double(get(handles.runs,'String')); % number of sessions
if runs == 1
    single_run = get(handles.single_run,'String');  
end;

exStats = get(handles.existStats,'Value');
ex4D = get(handles.exist4D,'Value');
if exStats == 1
    stats = get(handles.stats,'String'); % stats folder
    dir_stats=evalin('base','dir_stats'); % directory with statistics
    subjects = get(handles.subjects,'String'); % number of participants
    list=evalin('base','list'); % list with participant codes
    %% generate study_design
    disp('...save study design...');
    if runs > 1
        study_design = struct('name_design',name_design,'number_subjects',subjects,'number_sessions',runs,'subject_list',list,'results_directory',dir_results,'exist_stats',exStats,'stats_directory',stats,'stats_path',dir_stats,'exist_4D',ex4D);
    else
        study_design = struct('name_design',name_design,'number_subjects',subjects,'number_sessions',runs,'identifier_session',single_run,'subject_list',list,'results_directory',dir_results,'exist_stats',exStats, 'stats_directory',stats,'stats_path',dir_stats,'exist_4D',ex4D);
    end;   
elseif ex4D == 1
    subjects = get(handles.subjects,'String'); % number of participants
    %% generate study_design
    disp('...save study design...');    
    if runs > 1
        study_design = struct('name_design',name_design,'number_subjects',subjects,'number_sessions',runs,'results_directory',dir_results,'exist_stats',exStats,'exist_4D',ex4D);
    else
        study_design = struct('name_design',name_design,'number_subjects',subjects,'number_sessions',runs,'identifier_session',single_run,'results_directory',dir_results,'exist_stats',exStats,'exist_4D',ex4D);
    end;    
end;


%% save study design in results folder
cd(dir_results{1})
save(name_design,'study_design');
disp('...DONE');
cd(box_path);

    



% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
axes(hObject);
imshow('logo.png');


% --- Executes on button press in exist4D.
function exist4D_Callback(hObject, eventdata, handles)
% hObject    handle to exist4D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of exist4D


% --- Executes on button press in existStats.
function existStats_Callback(hObject, eventdata, handles)
% hObject    handle to existStats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of existStats


function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
