<?php

/*
 * This file is part of PHPExifTool.
 *
 * (c) 2012 Romain Neutron <imprec@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace PHPExiftool\Driver\Tag\RAF;

use JMS\Serializer\Annotation\ExclusionPolicy;
use PHPExiftool\Driver\AbstractTag;

/**
 * @ExclusionPolicy("all")
 */
class WBGRGBLevelsDaylightFluor extends AbstractTag
{

    protected $Id = 8960;

    protected $Name = 'WB_GRGBLevelsDaylightFluor';

    protected $FullName = 'FujiFilm::RAF';

    protected $GroupName = 'RAF';

    protected $g0 = 'RAF';

    protected $g1 = 'RAF';

    protected $g2 = 'Image';

    protected $Type = 'int16u';

    protected $Writable = false;

    protected $Description = 'WB GRGB Levels Daylight Fluor';

    protected $MaxLength = 4;

}
