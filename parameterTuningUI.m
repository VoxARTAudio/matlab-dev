function parameterTuningUI(parameter,parameterMin,parameterMax)

% Map slider position to specified range
rangeVector = linspace(parameterMin,parameterMax,1001);
[~,idx] = min(abs(rangeVector-parameter.value));
initialSliderPosition = idx/1000;

% Main figure
hMainFigure = figure( ...
    'Name', 'Parameter Tuning', ...
    'MenuBar','none', ...
    'Toolbar','none', ...
    'HandleVisibility','callback', ...
    'NumberTitle','off', ...
    'IntegerHandle','off');
    
    % Slider to tune parameter
    uicontrol('Parent',hMainFigure, ...
        'Style','slider', ...
        'Position',[80,205,400,23], ...
        'Value',initialSliderPosition, ...
        'Callback',@slidercb);
    
    % Label for slider
    uicontrol('Parent',hMainFigure, ...
        'Style','text', ...
        'Position',[10,200,70,23], ...
        'String',parameter.name);
    
    % Display current parameter value
    paramValueDisplay = uicontrol('Parent',hMainFigure, ...
        'Style','text', ...
        'Position', [490,205,50,23], ...
        'BackgroundColor','white',...
        'String',parameter.value);
    
    % Update parameter value if slider value changed
    function slidercb(slider,~)
        val = get(slider,'Value');
        rangeVectorIndex = round(val*1000)+1;
        parameter.value = rangeVector(rangeVectorIndex);
        set(paramValueDisplay,'String',num2str(parameter.value));
    end
end


