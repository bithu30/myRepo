/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icip.utils;

import com.icip.core.ENUMS.CalculationTypeEnum;
import com.icip.core.ENUMS.VarTypeEnum;

/**
 *
 * @author icipmac
 */
public class ScenarioEnumChecker {
    public static CalculationTypeEnum CheckVar(VarTypeEnum s)
    {
        CalculationTypeEnum result = null;
        switch(s)
        {
            case T_2M:
            case TMAX_2M:
            case TMIN_2M:
                result = CalculationTypeEnum.AbsoluteValueScenarios;
                break;   
            case TOT_PREC:
            case VGUST_DYN:
                result = CalculationTypeEnum.PercentageValueScenarios;
                break;
        }
        return result;
    }
}
